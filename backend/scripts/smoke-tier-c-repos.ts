/**
 * Smoke test consolidado — Tier C (repositórios complexos com RPCs).
 *
 * Cobre: Order + OrderItem, Payment, CreditTransaction (3 RPCs),
 *        CashRegisterSession + CashWithdrawal, AuditLog.
 *
 * Estratégia:
 *   1. Limpa dados de testes anteriores
 *   2. Cria fixtures (user, customer, category, product, stock, session)
 *   3. Roda os testes em ordem de dependência
 *   4. Cleanup na ordem inversa de FK
 *
 * Como rodar:
 *   npm run smoke:tier-c
 */

import { orderRepository } from '../src/repositories/order.repository';
import { paymentRepository } from '../src/repositories/payment.repository';
import { creditTransactionRepository } from '../src/repositories/creditTransaction.repository';
import { cashRegisterRepository } from '../src/repositories/cashRegister.repository';
import { auditLogRepository } from '../src/repositories/auditLog.repository';
import { categoryRepository } from '../src/repositories/category.repository';
import { productRepository } from '../src/repositories/product.repository';
import { stockItemRepository } from '../src/repositories/stockItem.repository';
import { customerRepository } from '../src/repositories/customer.repository';
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
  try { await fn(); } catch { /* ignora */ }
}

// IDs de teste (prefixo _c_ pra não conflitar)
const IDS = {
  // Fixtures
  category: 'cat_c_smoke',
  product: 'prod_c_smoke',
  stock1: 'stk_c_smoke_1',
  customer: 'cust_c_smoke',
  userId: 'admin_seed_user_001', // Jessica — já existe no banco
  // Entidades Tier C
  session: 'sess_c_smoke',
  withdrawal: 'wdraw_c_smoke',
  order1: 'ord_c_smoke_1',
  order2: 'ord_c_smoke_2',
  item1: 'item_c_smoke_1',
  payment1: 'pay_c_smoke_1',
};

// ============================================================================
// SETUP
// ============================================================================
async function setup() {
  console.log('\n--- SETUP (creating fixtures) ---');

  await categoryRepository.create({
    id: IDS.category, name: 'Smoke C Category',
    isMealCategory: false, pricePerKg: null, selfServicePricePerKg: null,
  });

  await productRepository.create({
    id: IDS.product, name: 'Smoke C Produto', description: null,
    price: 10.0, imageUrl: null, isByWeight: false, categoryId: IDS.category,
    createdAt: new Date(), updatedAt: new Date(),
  });

  await stockItemRepository.create({
    id: IDS.stock1, name: 'Smoke C Insumo', quantity: 100,
    unit: 'un', minQuantity: 5, createdAt: new Date(), updatedAt: new Date(),
  });

  await customerRepository.create({
    id: IDS.customer, name: 'Smoke C Cliente', phone: null, email: null,
    address: null, creditLimit: 500, creditUsed: 0,
    createdAt: new Date(), updatedAt: new Date(),
  });

  console.log('✅ Fixtures created');
}

// ============================================================================
// CLEANUP
// ============================================================================
async function cleanup() {
  console.log('\n--- CLEANUP ---');
  await safeDelete(() => paymentRepository.delete(IDS.payment1));
  await safeDelete(() => orderRepository.removeItem(IDS.item1));
  await safeDelete(() => orderRepository.delete(IDS.order1));
  await safeDelete(() => orderRepository.delete(IDS.order2));
  // Saques e sessão deletados diretamente (sem repository de delete)
  const { supabase } = await import('../src/lib/supabase');
  await supabase.from('cash_withdrawals').delete().eq('session_id', IDS.session);
  await supabase.from('cash_register_sessions').delete().eq('id', IDS.session);
  // Fixtures
  await safeDelete(() => customerRepository.delete(IDS.customer));
  await safeDelete(() => productRepository.delete(IDS.product));
  await safeDelete(() => stockItemRepository.delete(IDS.stock1));
  await safeDelete(() => categoryRepository.delete(IDS.category));
  console.log('✅ Cleanup done');
}

// ============================================================================
// CASH REGISTER SESSION
// ============================================================================
async function testCashRegister() {
  console.log('\n--- CASH REGISTER SESSION + WITHDRAWAL ---');

  // Não deve ter sessão aberta (cleanup fez isso)
  const noOpen = await cashRegisterRepository.findOpenSession();
  step('findOpenSession returns null when no session', noOpen === null);

  // Abre sessão
  const session = await cashRegisterRepository.openSession({
    id: IDS.session,
    status: 'OPEN',
    openingAmount: 100,
    closingAmount: null,
    withdrawalTotal: 0,
    notes: 'Smoke test session',
    openedById: IDS.userId,
    closedById: null,
    openedAt: new Date(),
    closedAt: null,
  });
  step('CashRegister openSession', session.status === 'OPEN' && session.openingAmount === 100);

  // findOpenSession agora retorna
  const openSession = await cashRegisterRepository.findOpenSession();
  step('findOpenSession returns OPEN session', openSession?.id === IDS.session);

  // findSessionById
  const byId = await cashRegisterRepository.findSessionById(IDS.session);
  step('findSessionById', byId?.id === IDS.session);

  // Registra um saque
  const withdrawal = await cashRegisterRepository.addWithdrawal({
    id: IDS.withdrawal,
    sessionId: IDS.session,
    amount: 20,
    reason: 'Troco para entregador',
    createdById: IDS.userId,
    createdAt: new Date(),
  });
  step('addWithdrawal', withdrawal.amount === 20 && withdrawal.sessionId === IDS.session);

  // findWithdrawalsBySession
  const withdrawals = await cashRegisterRepository.findWithdrawalsBySession(IDS.session);
  step(
    'findWithdrawalsBySession',
    withdrawals.some((w) => w.id === IDS.withdrawal),
    `found ${withdrawals.length} withdrawal(s)`
  );

  // Atualiza withdrawal_total na sessão
  const updated = await cashRegisterRepository.updateSession(IDS.session, { withdrawalTotal: 20 });
  step('updateSession withdrawalTotal', updated.withdrawalTotal === 20);

  // findRecentSessions
  const recent = await cashRegisterRepository.findRecentSessions(5);
  step('findRecentSessions', recent.some((s) => s.id === IDS.session));
}

// ============================================================================
// ORDER + ORDER ITEM
// ============================================================================
async function testOrder() {
  console.log('\n--- ORDER + ORDER ITEM ---');

  // Cria pedido de balcão simples
  const order = await orderRepository.create({
    id: IDS.order1,
    type: 'DINE_IN',
    status: 'NEW',
    total: 10.0,
    deliveryFee: 0,
    customerName: 'Teste Direto',
    customerId: null,
    tableId: null,
    userId: IDS.userId,
    waiterId: null,
    cashRegisterSessionId: IDS.session,
    deliveryType: null,
    deliveryStreet: null,
    deliveryNumber: null,
    deliveryNeighborhood: null,
    deliveryReference: null,
    deliveryPhone: null,
    deliveryNotes: null,
    createdAt: new Date(),
    updatedAt: new Date(),
  });
step('Order CREATE', order.status === 'NEW' && order.type === 'DINE_IN');

  // findById
  const found = await orderRepository.findById(IDS.order1);
  step('Order findById', found?.id === IDS.order1);

  // findByStatus
  const newOrders = await orderRepository.findByStatus('NEW');
  step('Order findByStatus NEW', newOrders.some((o) => o.id === IDS.order1));

  // findBySession
  const sessionOrders = await orderRepository.findBySession(IDS.session);
  step('Order findBySession', sessionOrders.some((o) => o.id === IDS.order1));

  // Adiciona item
  const item = await orderRepository.addItem({
    id: IDS.item1,
    orderId: IDS.order1,
    productId: IDS.product,
    quantity: 1,
    weight: null,
    price: 10.0,
    unitPrice: 10.0,
    manualPrice: null,
    saleType: 'UNIT',
    notes: null,
  });
  step('Order addItem', item.id === IDS.item1 && item.price === 10.0);

  // findItems
  const items = await orderRepository.findItems(IDS.order1);
  step('Order findItems', items.length === 1 && items[0].id === IDS.item1);

  // Update status
  const updated = await orderRepository.update(IDS.order1, { status: 'IN_PROGRESS' });
  step('Order UPDATE status', updated.status === 'IN_PROGRESS');

  // Update inexistente → NotFoundError
  let nf = false;
  try {
    await orderRepository.update('ord_does_not_exist', { status: 'CANCELED' });
  } catch (err) {
    nf = err instanceof NotFoundError;
  }
  step('Order UPDATE inexistent → NotFoundError', nf);
}

// ============================================================================
// PAYMENT
// ============================================================================
async function testPayment() {
  console.log('\n--- PAYMENT ---');

  const payment = await paymentRepository.create({
    id: IDS.payment1,
    orderId: IDS.order1,
    method: 'CASH',
    amount: 10.0,
    status: 'PENDING',
    transactionId: null,
    createdAt: new Date(),
  });
  step('Payment CREATE', payment.method === 'CASH' && payment.status === 'PENDING');

  const byOrder = await paymentRepository.findByOrder(IDS.order1);
  step('Payment findByOrder', byOrder.some((p) => p.id === IDS.payment1));

  const updated = await paymentRepository.update(IDS.payment1, { status: 'PAID' });
  step('Payment UPDATE status to PAID', updated.status === 'PAID');

  const found = await paymentRepository.findById(IDS.payment1);
  step('Payment findById confirms PAID', found?.status === 'PAID');
}

// ============================================================================
// CREDIT TRANSACTION (RPCs)
// ============================================================================
async function testCreditTransaction() {
  console.log('\n--- CREDIT TRANSACTION (RPCs) ---');

  // Verifica saldo inicial zerado
  const initial = await creditTransactionRepository.findByCustomer(IDS.customer);
  step('CreditTransaction findByCustomer initially empty', initial.length === 0);

  // chargeCredit — lança débito manual de fiado
  const charge = await creditTransactionRepository.chargeCredit(
    IDS.customer, 100, 'Smoke test charge'
  );
  step(
    'CreditTransaction chargeCredit (RPC add_credit_charge)',
    charge.type === 'CHARGE' && charge.amount === 100 && charge.customerId === IDS.customer,
    `id=${charge.id}`
  );

  // Verifica que credit_used foi incrementado no customer
  const { customerRepository: cr } = await import('../src/repositories/customer.repository');
  const customerAfterCharge = await cr.findById(IDS.customer);
  step(
    'chargeCredit increments customer.creditUsed',
    customerAfterCharge?.creditUsed === 100,
    `creditUsed=${customerAfterCharge?.creditUsed}`
  );

  // payCredit — cliente paga parte da dívida
  const payment = await creditTransactionRepository.payCredit(
    IDS.customer, 40, 'Smoke test payment'
  );
  step(
    'CreditTransaction payCredit (RPC pay_customer_credit)',
    payment.type === 'PAYMENT' && payment.amount === 40,
    `id=${payment.id}`
  );

  // Verifica que credit_used foi decrementado
  const customerAfterPay = await cr.findById(IDS.customer);
  step(
    'payCredit decrements customer.creditUsed',
    customerAfterPay?.creditUsed === 60,
    `creditUsed=${customerAfterPay?.creditUsed}`
  );

  // findByCustomer agora tem 2 transações
  const all = await creditTransactionRepository.findByCustomer(IDS.customer);
  step(
    'findByCustomer returns 2 transactions (1 charge + 1 payment)',
    all.length === 2,
    `count=${all.length}`
  );

  // payOrderWithCredit — cria pedido de fiado e paga via RPC
  const orderForCredit = await orderRepository.create({
    id: IDS.order2,
    type: 'DINE_IN',
    status: 'NEW',
    total: 30.0,
    deliveryFee: 0,
    customerName: null,
    customerId: IDS.customer,
    tableId: null,
    userId: IDS.userId,
    waiterId: null,
    cashRegisterSessionId: IDS.session,
    deliveryType: null,
    deliveryStreet: null, deliveryNumber: null, deliveryNeighborhood: null,
    deliveryReference: null, deliveryPhone: null, deliveryNotes: null,
    createdAt: new Date(), updatedAt: new Date(),
  });
  step('Order CREATE for credit payment', orderForCredit.id === IDS.order2);

    const creditResult = await creditTransactionRepository.payOrderWithCredit(
    IDS.order2, IDS.customer, 30  
    );
  step(
    'payOrderWithCredit (RPC pay_order_with_credit)',
    !!creditResult.transactionId && !!creditResult.paymentId,
    `txId=${creditResult.transactionId}, payId=${creditResult.paymentId}`
  );

  // Verifica que o pedido ficou FINISHED após pagamento
  const orderAfterCredit = await orderRepository.findById(IDS.order2);
  step(
    'payOrderWithCredit: Order status → FINISHED',
    orderAfterCredit?.status === 'FINISHED',
    `status=${orderAfterCredit?.status}`
  );

  // Verifica que credit_used subiu de 60 → 90 (pagou 30 no fiado)
  const customerFinal = await cr.findById(IDS.customer);
  step(
    'payOrderWithCredit: customer.creditUsed incremented by order total',
    customerFinal?.creditUsed === 90,
    `creditUsed=${customerFinal?.creditUsed} (expected 90)`
  );
}

// ============================================================================
// AUDIT LOG
// ============================================================================
async function testAuditLog() {
  console.log('\n--- AUDIT LOG ---');

  // log() não lança erro mesmo em caso de falha (silencioso)
  await auditLogRepository.log({
    id: `audit_c_${Date.now()}`,
    userId: IDS.userId,
    action: 'CREATE',
    entity: 'Order',
    entityId: IDS.order1,
    details: 'Smoke test audit entry',
    createdAt: new Date(),
  });
  step('AuditLog log() completes without throwing', true);

  // findByEntity
  const byEntity = await auditLogRepository.findByEntity('Order', IDS.order1);
  step(
    'AuditLog findByEntity',
    byEntity.length >= 1 && byEntity[0].entity === 'Order',
    `found ${byEntity.length} entries`
  );

  // findByUser
  const byUser = await auditLogRepository.findByUser(IDS.userId, 10);
  step(
    'AuditLog findByUser',
    byUser.length >= 1 && byUser.some((a) => a.entityId === IDS.order1),
    `found ${byUser.length} entries for user`
  );
}

// ============================================================================
// MAIN
// ============================================================================
async function main() {
  console.log('=====================================');
  console.log('Smoke Test — Tier C Repositories');
  console.log('=====================================');

  await cleanup();

  try {
    await setup();
    await testCashRegister();
    await testOrder();
    await testPayment();
    await testCreditTransaction();
    await testAuditLog();
  } finally {
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
  console.log('\n🎉 All Tier C repositories validated!\n');
  process.exit(0);
}

main().catch((err) => {
  console.error('\n💥 Unexpected error:', err);
  process.exit(1);
});