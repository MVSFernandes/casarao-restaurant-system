import { Database } from '../types/database';
import { CreditTransaction, CreditTransactionType } from '../types/domain';

type CreditTransactionRow = Database['public']['Tables']['credit_transactions']['Row'];
type CreditTransactionInsert = Database['public']['Tables']['credit_transactions']['Insert'];

export function toCreditTransactionDomain(row: CreditTransactionRow): CreditTransaction {
  return {
    id: row.id,
    customerId: row.customer_id,
    type: row.type as CreditTransactionType,
    amount: row.amount,
    description: row.description,
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
  };
}
// Sem toUpdate — credit_transactions são imutáveis por design (ledger)