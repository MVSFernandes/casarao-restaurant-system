import { Database } from '../types/database';
import { CashRegisterSession, CashWithdrawal, CashSessionStatus } from '../types/domain';

// ============================================================================
// CASH REGISTER SESSION
// ============================================================================

type SessionRow = Database['public']['Tables']['cash_register_sessions']['Row'];
type SessionInsert = Database['public']['Tables']['cash_register_sessions']['Insert'];
type SessionUpdate = Database['public']['Tables']['cash_register_sessions']['Update'];

export function toCashRegisterSessionDomain(row: SessionRow): CashRegisterSession {
  return {
    id: row.id,
    status: row.status as CashSessionStatus,
    openingAmount: row.opening_amount,
    closingAmount: row.closing_amount,
    withdrawalTotal: row.withdrawal_total,
    notes: row.notes,
    openedById: row.opened_by_id,
    closedById: row.closed_by_id,
    openedAt: new Date(row.opened_at),
    closedAt: row.closed_at ? new Date(row.closed_at) : null,
  };
}

export function toCashRegisterSessionInsert(domain: CashRegisterSession): SessionInsert {
  return {
    id: domain.id,
    status: domain.status,
    opening_amount: domain.openingAmount,
    closing_amount: domain.closingAmount,
    withdrawal_total: domain.withdrawalTotal,
    notes: domain.notes,
    opened_by_id: domain.openedById,
    closed_by_id: domain.closedById,
    closed_at: domain.closedAt?.toISOString() ?? null,
  };
}

export function toCashRegisterSessionUpdate(patch: Partial<CashRegisterSession>): SessionUpdate {
  const update: SessionUpdate = {};
  if (patch.status !== undefined) update.status = patch.status;
  if (patch.closingAmount !== undefined) update.closing_amount = patch.closingAmount;
  if (patch.withdrawalTotal !== undefined) update.withdrawal_total = patch.withdrawalTotal;
  if (patch.notes !== undefined) update.notes = patch.notes;
  if (patch.closedById !== undefined) update.closed_by_id = patch.closedById;
  if (patch.closedAt !== undefined) update.closed_at = patch.closedAt?.toISOString() ?? null;
  return update;
}

// ============================================================================
// CASH WITHDRAWAL
// ============================================================================

type WithdrawalRow = Database['public']['Tables']['cash_withdrawals']['Row'];
type WithdrawalInsert = Database['public']['Tables']['cash_withdrawals']['Insert'];

export function toCashWithdrawalDomain(row: WithdrawalRow): CashWithdrawal {
  return {
    id: row.id,
    sessionId: row.session_id,
    amount: row.amount,
    reason: row.reason,
    createdById: row.created_by_id,
    createdAt: new Date(row.created_at),
  };
}

export function toCashWithdrawalInsert(domain: CashWithdrawal): WithdrawalInsert {
  return {
    id: domain.id,
    session_id: domain.sessionId,
    amount: domain.amount,
    reason: domain.reason,
    created_by_id: domain.createdById,
  };
}
// Sem toUpdate — saques são imutáveis por design (ledger financeiro)