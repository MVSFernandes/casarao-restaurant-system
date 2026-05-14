import { Database } from '../types/database';
import { PayableAccount } from '../types/domain';

type PayableRow = Database['public']['Tables']['payable_accounts']['Row'];
type PayableInsert = Database['public']['Tables']['payable_accounts']['Insert'];
type PayableUpdate = Database['public']['Tables']['payable_accounts']['Update'];

export function toPayableAccountDomain(row: PayableRow): PayableAccount {
  return {
    id: row.id,
    description: row.description,
    amount: row.amount,
    dueDate: new Date(row.due_date),
    paid: row.paid,
    paidAt: row.paid_at ? new Date(row.paid_at) : null,
    supplierId: row.supplier_id,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toPayableAccountInsert(domain: PayableAccount): PayableInsert {
  return {
    id: domain.id,
    description: domain.description,
    amount: domain.amount,
    due_date: domain.dueDate.toISOString(),
    paid: domain.paid,
    paid_at: domain.paidAt ? domain.paidAt.toISOString() : null,
    supplier_id: domain.supplierId,
  };
}

export function toPayableAccountUpdate(patch: Partial<PayableAccount>): PayableUpdate {
  const update: PayableUpdate = {};
  if (patch.description !== undefined) update.description = patch.description;
  if (patch.amount !== undefined) update.amount = patch.amount;
  if (patch.dueDate !== undefined) update.due_date = patch.dueDate.toISOString();
  if (patch.paid !== undefined) update.paid = patch.paid;
  if (patch.paidAt !== undefined) {
    update.paid_at = patch.paidAt ? patch.paidAt.toISOString() : null;
  }
  if (patch.supplierId !== undefined) update.supplier_id = patch.supplierId;
  return update;
}