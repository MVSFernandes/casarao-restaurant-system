/**
 * Smoke test consolidado — Tier B (5 repositories de complexidade média).
 *
 * Testa CRUD + queries especializadas + INTEGRAÇÃO COM RPC
 * (replace_product_stock_links).
 *
 * Estratégia:
 *   1. Limpa dados de testes anteriores (se houver)
 *   2. Cria fixtures (categoria, produto, insumos, cliente, fornecedor, conta)
 *   3. Roda os 5 testes
 *   4. Deleta tudo na ordem inversa (respeita FKs)
 *
 * Como rodar:
 *   npm run smoke:tier-b
 */

import { customerRepository } from '../src/repositories/customer.repository';
import { productRepository } from '../src/repositories/product.repository';
import { payableAccountRepository } from '../src/repositories/payableAccount.repository';
import { supplierStockItemRepository } from '../src/repositories/supplierStockItem.repository';
import { productStockItemRepository } from '../src/repositories/productStockItem.repository';
import { categoryRepository } from '../src/repositories/category.repository';
import { stockItemRepository } from '../src/repositories/stockItem.repository';
import { supplierRepository } from '../src/repositories/supplier.repository';
import { NotFoundError, DomainError } from '../src/types/errors';

let passed = 0;
let failed = 0;

function step(label: string, ok: boolean, detail?: string) {
  const n = passed + failed + 1;
  if (ok) {
    console.log(`✅ [${n}] ${label}`);
    if (detail) console.log(`     ${detail}`);
    passed++;
  } else {
    console.error(`❌ [${n}] ${label}`);
    if (detail) console.error(`     ${detail}`);
    failed++;
  }
}

async function safeDelete(fn: () => Promise<void>) {
  try {
    await fn();
  } catch {
    /* ignora se não existir */
  }
}

// IDs de teste (prefixo _b_ pra não conflitar com Tier A)
const IDS = {
  category: 'cat_b_smoke',
  product: 'prod_b_smoke',
  customer: 'cust_b_smoke',
  supplier: 'sup_b_smoke',
  stock1: 'stk_b_smoke_1',
  stock2: 'stk_b_smoke_2',
  stock3: 'stk_b_smoke_3',
  payable: 'pay_b_smoke',
  ssi1: 'ssi_b_smoke_1',
  ssi2: 'ssi_b_smoke_2',
  psi1: 'psi_b_001',
  psi2: 'psi_b_002',
  psi3: 'psi_b_003',
};

// ============================================================================
// SETUP — cria fixtures necessárias
// ============================================================================
async function setup() {
  console.log('\n--- SETUP (creating fixtures) ---');

  // Categoria base
  await categoryRepository.create({
    id: IDS.category,
    name: 'Smoke B Test Category',
    isMealCategory: false,
    pricePerKg: null,
    selfServicePricePerKg: null,
  });

  // 3 insumos
  await stockItemRepository.create({
    id: IDS.stock1, name: 'Smoke B Pão', quantity: 100, unit: 'un', minQuantity: 10,
    createdAt: new Date(), updatedAt: new Date(),
  });
  await stockItemRepository.create({
    id: IDS.stock2, name: 'Smoke B Carne', quantity: 50, unit: 'kg', minQuantity: 5,
    createdAt: new Date(), updatedAt: new Date(),
  });
  await stockItemRepository.create({
    id: IDS.stock3, name: 'Smoke B Queijo', quantity: 10, unit: 'kg', minQuantity: 2,
    createdAt: new Date(), updatedAt: new Date(),
  });

  // Fornecedor
  await supplierRepository.create({
    id: IDS.supplier, name: 'Smoke B Supplier', contact: null, phone: null, email: null,
    createdAt: new Date(), updatedAt: new Date(),
  });

  console.log('✅ Fixtures created');
}

async function cleanup() {
  console.log('\n--- CLEANUP (deleting fixtures in FK order) ---');
  await safeDelete(() => payableAccountRepository.delete(IDS.payable));
  await safeDelete(() => supplierStockItemRepository.delete(IDS.ssi1));
  await safeDelete(() => supplierStockItemRepository.delete(IDS.ssi2));
  await safeDelete(async () => { await productStockItemRepository.replaceLinks(IDS.product, []); }); // limpa vínculos
  await safeDelete(() => productRepository.delete(IDS.product));
  await safeDelete(() => customerRepository.delete(IDS.customer));
  await safeDelete(() => stockItemRepository.delete(IDS.stock1));
  await safeDelete(() => stockItemRepository.delete(IDS.stock2));
  await safeDelete(() => stockItemRepository.delete(IDS.stock3));
  await safeDelete(() => supplierRepository.delete(IDS.supplier));
  await safeDelete(() => categoryRepository.delete(IDS.category));
  console.log('✅ Cleanup done');
}

// ============================================================================
// CUSTOMER
// ============================================================================
async function testCustomer() {
  console.log('\n--- CUSTOMER ---');

  const created = await customerRepository.create({
    id: IDS.customer,
    name: 'Smoke B João Test',
    phone: '11999990000',
    email: 'smokeb@test.com',
    address: null,
    creditLimit: 200,
    creditUsed: 0,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('Customer CREATE', created.name === 'Smoke B João Test');

  const found = await customerRepository.findById(IDS.customer);
  step('Customer findById', found?.creditLimit === 200);

  // searchByName (busca parcial)
  const search = await customerRepository.searchByName('joão');
  step(
    'Customer searchByName (case-insensitive partial match)',
    search.some((c) => c.id === IDS.customer),
    `found ${search.length} matching "joão"`
  );

  // Atualiza credit_used pra testar findWithCreditDebt
  await customerRepository.update(IDS.customer, { creditUsed: 50 });

  const debtors = await customerRepository.findWithCreditDebt();
  step(
    'Customer findWithCreditDebt includes customer with debt',
    debtors.some((c) => c.id === IDS.customer && c.creditUsed === 50)
  );

  await customerRepository.update(IDS.customer, { creditUsed: 0 });

  const debtorsAfter = await customerRepository.findWithCreditDebt();
  step(
    'Customer findWithCreditDebt excludes customer after debt cleared',
    !debtorsAfter.some((c) => c.id === IDS.customer)
  );

  // Update geral
  const updated = await customerRepository.update(IDS.customer, { phone: '11888880000' });
  step('Customer UPDATE phone', updated.phone === '11888880000');

  // NotFoundError
  let nf = false;
  try {
    await customerRepository.update('cust_does_not_exist', { name: 'X' });
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Customer UPDATE inexistent → NotFoundError', nf);
}

// ============================================================================
// PRODUCT
// ============================================================================
async function testProduct() {
  console.log('\n--- PRODUCT ---');

  const created = await productRepository.create({
    id: IDS.product,
    name: 'Smoke B X-Burger',
    description: 'Hambúrguer de teste',
    price: 25.0,
    imageUrl: null,
    isByWeight: false,
    categoryId: IDS.category,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('Product CREATE', created.id === IDS.product);

  const byCat = await productRepository.findByCategory(IDS.category);
  step(
    'Product findByCategory',
    byCat.some((p) => p.id === IDS.product) && byCat.length === 1
  );

  const search = await productRepository.searchByName('smoke b');
  step(
    'Product searchByName (case-insensitive)',
    search.some((p) => p.id === IDS.product)
  );

  const updated = await productRepository.update(IDS.product, { price: 28.5 });
  step('Product UPDATE price', updated.price === 28.5);

  let nf = false;
  try {
    await productRepository.delete('prod_does_not_exist');
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Product DELETE inexistent → NotFoundError', nf);
}

// ============================================================================
// PAYABLE ACCOUNT
// ============================================================================
async function testPayableAccount() {
  console.log('\n--- PAYABLE ACCOUNT ---');

  const yesterday = new Date();
  yesterday.setDate(yesterday.getDate() - 1);

  const created = await payableAccountRepository.create({
    id: IDS.payable,
    description: 'Smoke B Test Bill',
    amount: 1500.5,
    dueDate: yesterday, // já vencida (pra testar findOverdue)
    paid: false,
    paidAt: null,
    supplierId: IDS.supplier,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('PayableAccount CREATE', created.amount === 1500.5);
  step('PayableAccount dueDate is Date object', created.dueDate instanceof Date);

  const unpaid = await payableAccountRepository.findUnpaid();
  step(
    'PayableAccount findUnpaid includes unpaid',
    unpaid.some((p) => p.id === IDS.payable)
  );

  const overdue = await payableAccountRepository.findOverdue();
  step(
    'PayableAccount findOverdue includes (yesterday + unpaid)',
    overdue.some((p) => p.id === IDS.payable)
  );

  const paid = await payableAccountRepository.markAsPaid(IDS.payable);
  step(
    'PayableAccount markAsPaid sets paid=true and paidAt',
    paid.paid === true && paid.paidAt !== null && paid.paidAt instanceof Date
  );

  const unpaidAfter = await payableAccountRepository.findUnpaid();
  step(
    'PayableAccount findUnpaid excludes after markAsPaid',
    !unpaidAfter.some((p) => p.id === IDS.payable)
  );

  let nf = false;
  try {
    await payableAccountRepository.markAsPaid('pay_does_not_exist');
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('PayableAccount markAsPaid inexistent → NotFoundError', nf);
}

// ============================================================================
// SUPPLIER STOCK ITEM
// ============================================================================
async function testSupplierStockItem() {
  console.log('\n--- SUPPLIER STOCK ITEM ---');

  const created1 = await supplierStockItemRepository.create({
    id: IDS.ssi1,
    supplierId: IDS.supplier,
    stockItemId: IDS.stock1,
    price: 0.5,
    updatedAt: new Date(),
  });
  step('SupplierStockItem CREATE', created1.price === 0.5);

  // Cria outro pro mesmo insumo (preço diferente, simular comparativo)
  // Mas o supplier_id também precisa ser único combo, então vamos usar outro stock
  await supplierStockItemRepository.create({
    id: IDS.ssi2,
    supplierId: IDS.supplier,
    stockItemId: IDS.stock2,
    price: 30.0,
    updatedAt: new Date(),
  });
  step('SupplierStockItem CREATE second item', true);

  const bySupp = await supplierStockItemRepository.findBySupplier(IDS.supplier);
  step(
    'SupplierStockItem findBySupplier',
    bySupp.length >= 2 && bySupp.every((s) => s.supplierId === IDS.supplier)
  );

  const byStock = await supplierStockItemRepository.findByStockItem(IDS.stock1);
  step(
    'SupplierStockItem findByStockItem',
    byStock.some((s) => s.id === IDS.ssi1)
  );

  // Update price → last_updated deve mudar
  const beforePrice = created1.updatedAt.getTime();
  await new Promise((resolve) => setTimeout(resolve, 50)); // espera 50ms pra timestamp mudar
  const updated = await supplierStockItemRepository.update(IDS.ssi1, { price: 0.6 });
  step(
    'SupplierStockItem UPDATE price auto-updates updatedAt',
    updated.price === 0.6 && updated.updatedAt.getTime() > beforePrice,
    `before=${beforePrice}, after=${updated.updatedAt.getTime()}`
  );
}

// ============================================================================
// PRODUCT STOCK ITEM (RPC!)
// ============================================================================
async function testProductStockItem() {
  console.log('\n--- PRODUCT STOCK ITEM (RPC integration) ---');

  // Inicialmente sem vínculos
  const empty = await productStockItemRepository.findByProduct(IDS.product);
  step('ProductStockItem findByProduct returns empty initially', empty.length === 0);

  // Replace com 3 vínculos
  const result = await productStockItemRepository.replaceLinks(IDS.product, [
    { id: IDS.psi1, productId: IDS.product, stockItemId: IDS.stock1, quantity: 1 },
    { id: IDS.psi2, productId: IDS.product, stockItemId: IDS.stock2, quantity: 0.15 },
    { id: IDS.psi3, productId: IDS.product, stockItemId: IDS.stock3, quantity: 0.03 },
  ]);
  step(
    'ProductStockItem replaceLinks: deleted 0, inserted 3',
    result.deleted === 0 && result.inserted === 3,
    `deleted=${result.deleted}, inserted=${result.inserted}`
  );

  const afterReplace = await productStockItemRepository.findByProduct(IDS.product);
  step(
    'ProductStockItem findByProduct returns 3 links after replace',
    afterReplace.length === 3
  );

  // Replace de novo com APENAS 2 (deve apagar os 3 e criar 2)
  const result2 = await productStockItemRepository.replaceLinks(IDS.product, [
    { id: IDS.psi1, productId: IDS.product, stockItemId: IDS.stock1, quantity: 2 },
    { id: IDS.psi2, productId: IDS.product, stockItemId: IDS.stock2, quantity: 0.2 },
  ]);
  step(
    'ProductStockItem replaceLinks: deleted 3, inserted 2',
    result2.deleted === 3 && result2.inserted === 2,
    `deleted=${result2.deleted}, inserted=${result2.inserted}`
  );

  // Caso de erro: insumo inexistente → RPC dispara P0002 → DomainError
  let domainErrorThrown = false;
  try {
    await productStockItemRepository.replaceLinks(IDS.product, [
      { id: 'psi_invalid', productId: IDS.product, stockItemId: 'stock_does_not_exist', quantity: 1 },
    ]);
  } catch (err) {
    domainErrorThrown = err instanceof DomainError;
  }
  step('ProductStockItem replaceLinks with invalid stock_item → DomainError', domainErrorThrown);

  // Confirma que após o erro, os vínculos anteriores (2) ainda estão lá (rollback funcionou)
  const afterError = await productStockItemRepository.findByProduct(IDS.product);
  step(
    'ProductStockItem rollback: previous 2 links preserved after RPC error',
    afterError.length === 2,
    `actual=${afterError.length} (expected 2)`
  );
}

// ============================================================================
// MAIN
// ============================================================================
async function main() {
  console.log('=====================================');
  console.log('Smoke Test — Tier B Repositories');
  console.log('=====================================');

  // Limpa antes (caso teste anterior tenha falhado no meio)
  await cleanup();

  try {
    await setup();
    await testCustomer();
    await testProduct();
    await testPayableAccount();
    await testSupplierStockItem();
    await testProductStockItem();
  } finally {
    // Sempre tenta limpar, mesmo se algum teste falhar
    await cleanup();
  }

  console.log('\n=====================================');
  console.log(`✅ Passed: ${passed}`);
  console.log(`❌ Failed: ${failed}`);
  console.log('=====================================');

  if (failed > 0) {
    console.error('\n💥 Some tests failed!\n');
    process.exit(1);
  }
  console.log('\n🎉 All Tier B repositories validated!\n');
  process.exit(0);
}

main().catch((err) => {
  console.error('\n💥 Unexpected error:', err);
  process.exit(1);
});