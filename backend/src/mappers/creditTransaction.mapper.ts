import { CreditTransaction, CreditTransactionStatus, CreditTransactionType } from '../types/domain';

type CreditTransactionRow = Record<string, any>;
type CreditTransactionInsert = Record<string, any>;

export function toCreditTransactionDomain(row: CreditTransactionRow): CreditTransaction {
  return {
    id: row.id,
    customerId: row.customer_id,
    type: row.type as CreditTransactionType,
    amount: row.amount,
    description: row.description,
    orderId: row.order_id ?? null,
    status: (row.status ?? (row.type === 'PAYMENT' ? 'PAID' : 'OPEN')) as CreditTransactionStatus,
    settledAmount: row.settled_amount ?? (row.type === 'PAYMENT' ? row.amount : 0),
    settledAt: row.settled_at ? new Date(row.settled_at) : null,
    createdAt: new Date(row.created_at),
  };
}

export function toCreditTransactionInsert(domain: CreditTransaction): CreditTransactionInsert {
  return {
    id: domain.id,
    customer_id: domain.customerId,
    type: domain.type,
    amount: domain.amount,
    description: domain.description,
    order_id: domain.orderId,
    status: domain.status,
    settled_amount: domain.settledAmount,
    settled_at: domain.settledAt?.toISOString() ?? null,
  };
}
// Sem toUpdate — credit_transactions são imutáveis por design (ledger)
