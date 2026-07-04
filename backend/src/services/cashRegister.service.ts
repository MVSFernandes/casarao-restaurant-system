import { createId } from '@paralleldrive/cuid2';
import { cashRegisterRepository } from '../repositories/cashRegister.repository';
import { paymentRepository } from '../repositories/payment.repository';
import { auditLogRepository } from '../repositories/auditLog.repository';
import { CashRegisterSession, CashWithdrawal } from '../types/domain';
import {
  CashRegisterClosedError,
  PendingCashRegisterOrdersError,
  ValidationError,
} from '../types/errors';

export interface SessionSummary extends CashRegisterSession {
  totalEntries: number;       // apenas CASH
  totalWithdrawals: number;
  expectedBalance: number;
  pixTotal: number;
  creditTotal: number;
  debitTotal: number;
  withdrawals?: CashWithdrawal[];
}

export interface SuggestWithdrawalResult {
  suggestedAmount: number;
  totalCashReceived: number;
  totalWithdrawn: number;
  openingAmount: number;
}

// ---------------------------------------------------------------------------
// Helpers privados
// ---------------------------------------------------------------------------

async function getPaymentTotals(sessionId: string) {
  const payments = await paymentRepository.findBySession(sessionId);
  const paid = payments.filter((p) => p.status === 'PAID');

  const totals = { CASH: 0, PIX: 0, CREDIT_CARD: 0, DEBIT_CARD: 0 };
  for (const p of paid) {
    if (p.method in totals) {
      totals[p.method as keyof typeof totals] += p.amount;
    }
  }
  return totals;
}

async function enrichSession(session: CashRegisterSession): Promise<SessionSummary> {
  const paymentTotals = await getPaymentTotals(session.id);
  const withdrawals = await cashRegisterRepository.findWithdrawalsBySession(session.id);

  const totalWithdrawals = withdrawals.reduce((sum, w) => sum + w.amount, 0);
  const totalEntries = paymentTotals.CASH;
  const expectedBalance = session.openingAmount + totalEntries - totalWithdrawals;

  return {
    ...session,
    totalEntries,
    totalWithdrawals,
    expectedBalance,
    pixTotal: paymentTotals.PIX,
    creditTotal: paymentTotals.CREDIT_CARD,
    debitTotal: paymentTotals.DEBIT_CARD,
    withdrawals,
  };
}

// ---------------------------------------------------------------------------
// Service público
// ---------------------------------------------------------------------------

export const cashRegisterService = {
  async getCurrentSession(): Promise<SessionSummary | null> {
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) return null;
    return enrichSession(session);
  },

  async getHistory(limit = 20): Promise<SessionSummary[]> {
    const sessions = await cashRegisterRepository.findRecentSessions(limit);
    return Promise.all(sessions.map(enrichSession));
  },

  async suggestWithdrawal(): Promise<SuggestWithdrawalResult> {
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) throw new CashRegisterClosedError();

    const paymentTotals = await getPaymentTotals(session.id);
    const withdrawals = await cashRegisterRepository.findWithdrawalsBySession(session.id);
    const totalWithdrawn = withdrawals.reduce((sum, w) => sum + w.amount, 0);

    const suggestedAmount = Math.max(
      0,
      paymentTotals.CASH - totalWithdrawn - session.openingAmount
    );

    return {
      suggestedAmount: Math.round(suggestedAmount * 100) / 100,
      totalCashReceived: paymentTotals.CASH,
      totalWithdrawn,
      openingAmount: session.openingAmount,
    };
  },

  async openSession(
    openingAmount: number,
    notes: string | null,
    actingUserId: string
  ): Promise<SessionSummary> {
    const existing = await cashRegisterRepository.findOpenSession();
    if (existing) throw new ValidationError('session', 'Já existe um caixa aberto.');

    if (openingAmount < 0) {
      throw new ValidationError('openingAmount', 'O valor de abertura não pode ser negativo.');
    }

    const session = await cashRegisterRepository.openSession({
      id: createId(),
      status: 'OPEN',
      openingAmount,
      closingAmount: null,
      withdrawalTotal: 0,
      notes,
      openedById: actingUserId,
      closedById: null,
      openedAt: new Date(),
      closedAt: null,
    });

    await auditLogRepository.log({
      id: createId(),
      userId: actingUserId,
      action: 'CASH_REGISTER_OPENED',
      entity: 'CashRegisterSession',
      entityId: session.id,
      details: JSON.stringify({ openingAmount, notes, openedAt: session.openedAt }),
      createdAt: new Date(),
    });

    return enrichSession(session);
  },

  async closeSession(
    closingAmount: number,
    notes: string | null,
    actingUserId: string
  ): Promise<SessionSummary> {
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) throw new CashRegisterClosedError();

    if (closingAmount < 0) {
      throw new ValidationError('closingAmount', 'O valor de fechamento não pode ser negativo.');
    }

    const pendingOrders = await cashRegisterRepository.findPendingOrdersForClose(session.id);
    if (pendingOrders.length > 0) {
      await auditLogRepository.log({
        id: createId(),
        userId: actingUserId,
        action: 'CASH_CLOSE_BLOCKED',
        entity: 'CashRegisterSession',
        entityId: session.id,
        details: JSON.stringify({
          pendingOrders,
          attemptedClosingAmount: closingAmount,
          attemptedAt: new Date().toISOString(),
        }),
        createdAt: new Date(),
      });

      throw new PendingCashRegisterOrdersError(pendingOrders);
    }

    const paymentTotals = await getPaymentTotals(session.id);
    const withdrawals = await cashRegisterRepository.findWithdrawalsBySession(session.id);
    const withdrawalTotal = withdrawals.reduce((sum, w) => sum + w.amount, 0);
    const expectedAmount = session.openingAmount + paymentTotals.CASH - withdrawalTotal;
    const closingDate = new Date();

    const updated = await cashRegisterRepository.closeOpenSession(session.id, {
      status: 'CLOSED',
      closingAmount,
      notes: notes ?? session.notes,
      closedAt: closingDate,
      closedById: actingUserId,
      withdrawalTotal,
    });

    await auditLogRepository.log({
      id: createId(),
      userId: actingUserId,
      action: 'CASH_REGISTER_CLOSED',
      entity: 'CashRegisterSession',
      entityId: session.id,
      details: JSON.stringify({
        openingAmount: session.openingAmount,
        totalEntries: paymentTotals.CASH,
        closingAmount,
        withdrawalTotal,
        expectedAmount,
        difference: closingAmount - expectedAmount,
        closedAt: closingDate.toISOString(),
        pixTotal: paymentTotals.PIX,
        creditTotal: paymentTotals.CREDIT_CARD,
        debitTotal: paymentTotals.DEBIT_CARD,
      }),
      createdAt: new Date(),
    });

    return enrichSession(updated);
  },

  async addWithdrawal(
    amount: number,
    reason: string,
    actingUserId: string
  ): Promise<CashWithdrawal> {
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) throw new CashRegisterClosedError();

    if (!amount || amount <= 0 || !reason.trim()) {
      throw new ValidationError('withdrawal', 'Informe valor e motivo da sangria.');
    }

    const withdrawal = await cashRegisterRepository.addWithdrawal({
      id: createId(),
      sessionId: session.id,
      amount,
      reason: reason.trim(),
      createdById: actingUserId,
      createdAt: new Date(),
    });

    await auditLogRepository.log({
      id: createId(),
      userId: actingUserId,
      action: 'CASH_WITHDRAWAL',
      entity: 'CashWithdrawal',
      entityId: withdrawal.id,
      details: JSON.stringify({ amount, reason: reason.trim(), sessionId: session.id }),
      createdAt: new Date(),
    });

    return withdrawal;
  },
};
