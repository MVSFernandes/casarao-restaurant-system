import { Database } from '../types/database';
import { Payment, PaymentMethod, PaymentStatus } from '../types/domain';

type PaymentRow = Database['public']['Tables']['payments']['Row'];
type PaymentInsert = Database['public']['Tables']['payments']['Insert'];
type PaymentUpdate = Database['public']['Tables']['payments']['Update'];

export function toPaymentDomain(row: PaymentRow): Payment {
  return {
    id: row.id,
    orderId: row.order_id,
    method: row.method as PaymentMethod,
    amount: row.amount,
    status: row.status as PaymentStatus,
    transactionId: row.transaction_id,
    createdAt: new Date(row.created_at),
  };
}

export function toPaymentInsert(domain: Payment): PaymentInsert {
  return {
    id: domain.id,
    order_id: domain.orderId,
    method: domain.method,
    amount: domain.amount,
    status: domain.status,
    transaction_id: domain.transactionId,
  };
}

export function toPaymentUpdate(patch: Partial<Payment>): PaymentUpdate {
  const update: PaymentUpdate = {};
  if (patch.status !== undefined) update.status = patch.status;
  if (patch.amount !== undefined) update.amount = patch.amount;
  if (patch.transactionId !== undefined) update.transaction_id = patch.transactionId;
  return update;
}