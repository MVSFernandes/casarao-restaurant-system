/**
 * Smoke test consolidado — Tier A (6 repositories simples).
 *
 * Testa CRUD completo + queries especiais (findByEmail, findLowStock,
 * findByDayOfWeek) + caminhos negativos (NotFoundError).
 *
 * Limpa todos os dados de teste no final. Restaurant Config é tratado
 * como singleton: muda + volta ao valor original.
 *
 * Como rodar:
 *   npm run smoke:tier-a
 */

import { tableRepository } from '../src/repositories/table.repository';
import { supplierRepository } from '../src/repositories/supplier.repository';
import { stockItemRepository } from '../src/repositories/stockItem.repository';
import { marmitaMenuItemRepository } from '../src/repositories/marmitaMenuItem.repository';
import { userRepository } from '../src/repositories/user.repository';
import { restaurantConfigRepository } from '../src/repositories/restaurantConfig.repository';
import { NotFoundError } from '../src/types/errors';

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

// ============================================================================
// TABLE
// ============================================================================
async function testTable() {
  console.log('\n--- TABLE ---');
  const ID = 'tbl_smoke_001';

  await safeDelete(() => tableRepository.delete(ID));

  const created = await tableRepository.create({
    id: ID,
    number: 999,
    status: 'AVAILABLE',
  });
  step('Table CREATE', created.id === ID && created.number === 999, `number=${created.number}`);

  const found = await tableRepository.findById(ID);
  step('Table READ by id', found?.id === ID);

  const all = await tableRepository.findAll();
  step('Table LIST', all.some((t) => t.id === ID), `total=${all.length}`);

  const updated = await tableRepository.update(ID, { status: 'OCCUPIED' });
  step('Table UPDATE status', updated.status === 'OCCUPIED', `status=${updated.status}`);

  await tableRepository.delete(ID);
  step('Table DELETE', true);

  const gone = await tableRepository.findById(ID);
  step('Table CONFIRM deleted', gone === null);

  let nf = false;
  try {
    await tableRepository.update('tbl_inexistent_xxx', { number: 1 });
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Table UPDATE inexistent → NotFoundError', nf);

  nf = false;
  try {
    await tableRepository.delete('tbl_inexistent_xxx');
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Table DELETE inexistent → NotFoundError', nf);
}

// ============================================================================
// SUPPLIER
// ============================================================================
async function testSupplier() {
  console.log('\n--- SUPPLIER ---');
  const ID = 'sup_smoke_001';

  await safeDelete(() => supplierRepository.delete(ID));

  const created = await supplierRepository.create({
    id: ID,
    name: 'Smoke Supplier',
    contact: 'João',
    phone: '11999999999',
    email: 'smoke@supplier.com',
    createdAt: new Date(), // ignorado pelo Insert (default no banco)
    updatedAt: new Date(),
  });
  step('Supplier CREATE', created.id === ID && created.name === 'Smoke Supplier');
  step('Supplier createdAt is Date object', created.createdAt instanceof Date,
    `type=${typeof created.createdAt}, value=${created.createdAt}`);

  const found = await supplierRepository.findById(ID);
  step('Supplier READ by id', found?.email === 'smoke@supplier.com');

  const updated = await supplierRepository.update(ID, { phone: '11888888888' });
  step('Supplier UPDATE phone', updated.phone === '11888888888');

  await supplierRepository.delete(ID);
  step('Supplier DELETE', true);

  let nf = false;
  try {
    await supplierRepository.update('sup_xxx', { name: 'X' });
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Supplier UPDATE inexistent → NotFoundError', nf);
}

// ============================================================================
// STOCK ITEM
// ============================================================================
async function testStockItem() {
  console.log('\n--- STOCK ITEM ---');
  const ID_NORMAL = 'stk_smoke_normal';
  const ID_LOW = 'stk_smoke_low';

  await safeDelete(() => stockItemRepository.delete(ID_NORMAL));
  await safeDelete(() => stockItemRepository.delete(ID_LOW));

  // Cria 1 com estoque OK e 1 com estoque baixo
  await stockItemRepository.create({
    id: ID_NORMAL,
    name: 'Smoke Stock Normal',
    quantity: 100,
    unit: 'kg',
    minQuantity: 10,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('StockItem CREATE (normal)', true);

  await stockItemRepository.create({
    id: ID_LOW,
    name: 'Smoke Stock Low',
    quantity: 5,
    unit: 'kg',
    minQuantity: 20, // estoque (5) < min (20)
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('StockItem CREATE (low)', true);

  const lowStock = await stockItemRepository.findLowStock();
  const containsLow = lowStock.some((s) => s.id === ID_LOW);
  const containsNormal = lowStock.some((s) => s.id === ID_NORMAL);
  step(
    'StockItem findLowStock includes low',
    containsLow,
    `low items: ${lowStock.map(s => s.id).join(', ')}`
  );
  step('StockItem findLowStock excludes normal', !containsNormal);

  const updated = await stockItemRepository.update(ID_LOW, { quantity: 50 });
  step('StockItem UPDATE quantity', updated.quantity === 50);

  await stockItemRepository.delete(ID_NORMAL);
  await stockItemRepository.delete(ID_LOW);
  step('StockItem DELETE both', true);
}

// ============================================================================
// MARMITA MENU ITEM
// ============================================================================
async function testMarmitaMenuItem() {
  console.log('\n--- MARMITA MENU ITEM ---');
  const ID_MON = 'mmi_smoke_mon';
  const ID_TUE = 'mmi_smoke_tue';

  await safeDelete(() => marmitaMenuItemRepository.delete(ID_MON));
  await safeDelete(() => marmitaMenuItemRepository.delete(ID_TUE));

  await marmitaMenuItemRepository.create({
    id: ID_MON,
    name: 'Feijoada',
    group: 'Prato Principal',
    price: 25.90,
    dayOfWeek: 1, // segunda
    sortOrder: 0,
    isActive: true,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('Marmita CREATE (segunda)', true);

  await marmitaMenuItemRepository.create({
    id: ID_TUE,
    name: 'Frango Grelhado',
    group: 'Prato Principal',
    price: 22.90,
    dayOfWeek: 2, // terça
    sortOrder: 0,
    isActive: true,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('Marmita CREATE (terça)', true);

  const monday = await marmitaMenuItemRepository.findByDayOfWeek(1);
  step(
    'Marmita findByDayOfWeek(1) returns only segunda',
    monday.some((m) => m.id === ID_MON) && !monday.some((m) => m.id === ID_TUE),
    `monday items: ${monday.map(m => m.name).join(', ')}`
  );

  const tuesday = await marmitaMenuItemRepository.findByDayOfWeek(2);
  step(
    'Marmita findByDayOfWeek(2) returns only terça',
    tuesday.some((m) => m.id === ID_TUE) && !tuesday.some((m) => m.id === ID_MON)
  );

  await marmitaMenuItemRepository.delete(ID_MON);
  await marmitaMenuItemRepository.delete(ID_TUE);
  step('Marmita DELETE both', true);
}

// ============================================================================
// USER
// ============================================================================
async function testUser() {
  console.log('\n--- USER ---');
  const ID = 'usr_smoke_001';
  const EMAIL = 'smoke@test.com';

  await safeDelete(() => userRepository.delete(ID));

  const created = await userRepository.create({
    id: ID,
    name: 'Smoke User',
    email: EMAIL,
    password: '$2b$10$fakehashfortest',
    role: 'CASHIER',
    createdAt: new Date(),
    updatedAt: new Date(),
  });
  step('User CREATE', created.email === EMAIL && created.role === 'CASHIER');

  const byEmail = await userRepository.findByEmail(EMAIL);
  step('User findByEmail', byEmail?.id === ID);

  const byEmailNone = await userRepository.findByEmail('inexistent@nowhere.com');
  step('User findByEmail inexistent → null', byEmailNone === null);

  const updated = await userRepository.update(ID, { role: 'WAITER' });
  step('User UPDATE role', updated.role === 'WAITER');

  await userRepository.delete(ID);
  step('User DELETE', true);

  // Confirma que admin Jessica continua intacta
  const admin = await userRepository.findById('admin_seed_user_001');
  step(
    'User: admin Jessica preserved',
    admin?.name === 'Jessica' && admin?.email === 'casarao@admin.com'
  );
}

// ============================================================================
// RESTAURANT CONFIG (singleton)
// ============================================================================
async function testRestaurantConfig() {
  console.log('\n--- RESTAURANT CONFIG ---');

  const original = await restaurantConfigRepository.get();
  step(
    'Config GET (singleton)',
    original.name === 'Casarão',
    `name="${original.name}", id="${original.id}"`
  );

  const originalPhone = original.phone;
  const TEST_PHONE = '11900000000';

  const updated = await restaurantConfigRepository.update(original.id, {
    phone: TEST_PHONE,
  });
  step('Config UPDATE phone', updated.phone === TEST_PHONE);

  // Volta ao original (pra não bagunçar o banco)
  await restaurantConfigRepository.update(original.id, { phone: originalPhone });
  step('Config UPDATE rolled back to original', true);
}

// ============================================================================
// MAIN
// ============================================================================
async function main() {
  console.log('=====================================');
  console.log('Smoke Test — Tier A Repositories');
  console.log('=====================================');

  await testTable();
  await testSupplier();
  await testStockItem();
  await testMarmitaMenuItem();
  await testUser();
  await testRestaurantConfig();

  console.log('\n=====================================');
  console.log(`✅ Passed: ${passed}`);
  console.log(`❌ Failed: ${failed}`);
  console.log('=====================================');

  if (failed > 0) {
    console.error('\n💥 Some tests failed!\n');
    process.exit(1);
  }
  console.log('\n🎉 All Tier A repositories validated!\n');
  process.exit(0);
}

main().catch((err) => {
  console.error('\n💥 Unexpected error:', err);
  process.exit(1);
});