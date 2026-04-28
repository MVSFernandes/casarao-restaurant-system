import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

const getOpenSession = () =>
  prisma.cashRegisterSession.findFirst({
    where: { status: 'OPEN' },
    orderBy: { openedAt: 'desc' },
    include: {
      openedBy: { select: { id: true, name: true, role: true } },
      closedBy: { select: { id: true, name: true, role: true } },
      withdrawals: {
        orderBy: { createdAt: 'desc' },
        include: { createdBy: { select: { id: true, name: true, role: true } } },
      },
    },
  });

// Nova função para buscar detalhamentos por método de pagamento
const getSessionPaymentTotals = async (sessionId: string) => {
  const payments = await prisma.payment.findMany({
    where: {
      status: 'PAID',
      order: {
        is: {
          cashRegisterSessionId: sessionId,
          status: {
            not: 'CANCELED',
          },
        },
      },
    },
    select: {
      amount: true,
      method: true,
    },
  });

  const totals = {
    CASH: 0,
    PIX: 0,
    CREDIT_CARD: 0,
    DEBIT_CARD: 0,
  };

  for (const payment of payments) {
    if (totals[payment.method as keyof typeof totals] !== undefined) {
      totals[payment.method as keyof typeof totals] += Number(payment.amount || 0);
    }
  }

  return totals;
};

const enrichSession = async (session: any) => {
  if (!session) return null;

  // Busca todos os pagamentos detalhados
  const paymentTotals = await getSessionPaymentTotals(session.id);
  const totalEntries = paymentTotals.CASH; // Caixa físico continua sendo apenas dinheiro

  const totalWithdrawals = (session.withdrawals || []).reduce(
    (sum: number, item: any) => sum + Number(item.amount || 0),
    0
  );

  const openingAmount = Number(session.openingAmount || 0);
  const expectedBalance = openingAmount + totalEntries - totalWithdrawals;

  return {
    ...session,
    totalEntries,
    totalWithdrawals,
    expectedBalance,
    // Adicionamos os totais extras ao enriquecimento
    pixTotal: paymentTotals.PIX,
    creditTotal: paymentTotals.CREDIT_CARD,
    debitTotal: paymentTotals.DEBIT_CARD,
  };
};

export const suggestWithdrawalAmount = async (_req: Request, res: Response) => {
  try {
    const current = await getOpenSession();

    if (!current) {
      return res.status(400).json({ message: 'Nenhum caixa aberto.' });
    }

    const cashPayments = await prisma.payment.findMany({
      where: {
        method: 'CASH',
        status: 'PAID',
        order: {
          is: {
            cashRegisterSessionId: current.id,
          },
        },
      },
    });

    const totalCashReceived = cashPayments.reduce(
      (sum, payment) => sum + Number(payment.amount || 0),
      0
    );

    const withdrawalTotal = current.withdrawals.reduce(
      (sum, item) => sum + Number(item.amount || 0),
      0
    );

    const suggestedAmount = Math.max(
      0,
      totalCashReceived - withdrawalTotal - Number(current.openingAmount || 0)
    );

    return res.json({
      suggestedAmount: Math.round(suggestedAmount * 100) / 100,
      totalCashReceived,
      totalWithdrawn: withdrawalTotal,
      openingAmount: Number(current.openingAmount || 0),
    });
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao sugerir valor de sangria' });
  }
};

export const getCurrentCashRegister = async (_req: Request, res: Response) => {
  try {
    const current = await getOpenSession();
    const enriched = await enrichSession(current);
    return res.json(enriched);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao buscar caixa atual' });
  }
};

export const getCashRegisterHistory = async (_req: Request, res: Response) => {
  try {
    const sessions = await prisma.cashRegisterSession.findMany({
      orderBy: { openedAt: 'desc' },
      take: 20,
      include: {
        openedBy: { select: { id: true, name: true, role: true } },
        closedBy: { select: { id: true, name: true, role: true } },
        withdrawals: {
          orderBy: { createdAt: 'desc' },
          include: { createdBy: { select: { id: true, name: true, role: true } } },
        },
      },
    });

    const enrichedSessions = await Promise.all(
      sessions.map((session) => enrichSession(session))
    );

    return res.json(enrichedSessions);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao buscar histórico do caixa' });
  }
};

const buildHistoryDateRange = (startDate?: string, endDate?: string) => {
  const range: { gte?: Date; lte?: Date } = {};

  if (startDate) {
    const parsedStart = new Date(`${startDate}T00:00:00.000`);
    if (!Number.isNaN(parsedStart.getTime())) {
      range.gte = parsedStart;
    }
  }

  if (endDate) {
    const parsedEnd = new Date(`${endDate}T23:59:59.999`);
    if (!Number.isNaN(parsedEnd.getTime())) {
      range.lte = parsedEnd;
    }
  }

  return Object.keys(range).length > 0 ? range : null;
};

export const getClosedOrdersHistory = async (req: Request, res: Response) => {
  try {
    const customerName = String(req.query.customerName || '').trim();
    const startDate = String(req.query.startDate || '').trim();
    const endDate = String(req.query.endDate || '').trim();
    const requestedRange = buildHistoryDateRange(startDate, endDate);

    const sessionWhere: any = {
      status: 'CLOSED',
      closedAt: { not: null },
    };

    if (requestedRange) {
      const overlapFilters = [] as any[];

      if (requestedRange.gte) {
        overlapFilters.push({ closedAt: { gte: requestedRange.gte } });
      }

      if (requestedRange.lte) {
        overlapFilters.push({ openedAt: { lte: requestedRange.lte } });
      }

      if (overlapFilters.length > 0) {
        sessionWhere.AND = overlapFilters;
      }
    }

    const sessions = await prisma.cashRegisterSession.findMany({
      where: sessionWhere,
      orderBy: { closedAt: 'desc' },
      ...(requestedRange || customerName ? {} : { take: 30 }),
      include: {
        openedBy: { select: { id: true, name: true, role: true } },
        closedBy: { select: { id: true, name: true, role: true } },
        withdrawals: {
          orderBy: { createdAt: 'desc' },
          include: { createdBy: { select: { id: true, name: true, role: true } } },
        },
      },
    });

    const history = await Promise.all(
      sessions.map(async (session) => {
        const orderWhere: any = {
          cashRegisterSessionId: session.id,
          status: { not: 'CANCELED' },
        };

        if (customerName) {
          orderWhere.OR = [
            {
              customerName: {
                contains: customerName,
                mode: 'insensitive',
              },
            },
            {
              customer: {
                name: {
                  contains: customerName,
                  mode: 'insensitive',
                },
              },
            },
          ];
        }

        if (requestedRange) {
          orderWhere.createdAt = requestedRange;
        }

        const orders = await prisma.order.findMany({
          where: orderWhere,
          orderBy: { createdAt: 'desc' },
          include: {
            items: { include: { product: true } },
            table: true,
            user: { select: { id: true, name: true, role: true } },
            waiter: { select: { id: true, name: true, role: true } },
            customer: true,
            payment: true,
          },
        });

        if ((customerName || requestedRange) && orders.length === 0) {
          return null;
        }

        const totalOrdersInSession = await prisma.order.count({
          where: {
            cashRegisterSessionId: session.id,
            status: { not: 'CANCELED' },
          },
        });

        const enrichedSession = await enrichSession(session);

        return {
          ...enrichedSession,
          matchedOrdersCount: orders.length,
          totalOrdersInSession,
          orders,
        };
      })
    );

    return res.json(history.filter(Boolean));
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao buscar histórico de pedidos do caixa' });
  }
};

export const openCashRegister = async (req: Request, res: Response) => {
  try {
    const user = (req as any).user;
    const { openingAmount, notes } = req.body;
    const existing = await getOpenSession();

    if (existing) {
      return res.status(400).json({ message: 'Já existe um caixa aberto.' });
    }

    if (Number(openingAmount) < 0) {
      return res.status(400).json({ message: 'O valor de abertura não pode ser negativo.' });
    }

    const session = await prisma.cashRegisterSession.create({
      data: {
        openingAmount: Number(openingAmount || 0),
        notes: notes || undefined,
        openedById: user.id,
        status: 'OPEN',
      },
      include: {
        openedBy: { select: { id: true, name: true, role: true } },
        withdrawals: {
          include: { createdBy: { select: { id: true, name: true, role: true } } },
        },
      },
    });

    await prisma.auditLog.create({
      data: {
        action: 'CASH_REGISTER_OPENED',
        entity: 'CashRegisterSession',
        entityId: session.id,
        userId: user.id,
        details: JSON.stringify({
          openingAmount: Number(openingAmount || 0),
          notes: notes || null,
          openedAt: new Date().toISOString(),
          openedBy: user.name,
        }),
      },
    });

    const enriched = await enrichSession(session);

    return res.status(201).json(enriched);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao abrir caixa' });
  }
};

export const closeCashRegister = async (req: Request, res: Response) => {
  try {
    const user = (req as any).user;
    const { closingAmount, notes } = req.body;
    const current = await getOpenSession();

    if (!current) {
      return res.status(400).json({ message: 'Nenhum caixa aberto.' });
    }

    if (Number(closingAmount) < 0) {
      return res.status(400).json({ message: 'O valor de fechamento não pode ser negativo.' });
    }

    const paymentTotals = await getSessionPaymentTotals(current.id);
    const totalEntries = paymentTotals.CASH;

    const withdrawalTotal = current.withdrawals.reduce(
      (sum, item) => sum + Number(item.amount || 0),
      0
    );

    const expectedAmount = Number(current.openingAmount || 0) + totalEntries - withdrawalTotal;
    const closingDate = new Date();

    const session = await prisma.cashRegisterSession.update({
      where: { id: current.id },
      data: {
        closingAmount: Number(closingAmount || 0),
        notes: notes || current.notes || undefined,
        closedAt: closingDate,
        closedById: user.id,
        status: 'CLOSED',
        withdrawalTotal,
      },
      include: {
        openedBy: { select: { id: true, name: true, role: true } },
        closedBy: { select: { id: true, name: true, role: true } },
        withdrawals: {
          include: { createdBy: { select: { id: true, name: true, role: true } } },
        },
      },
    });

    const difference = Number(closingAmount || 0) - expectedAmount;

    await prisma.auditLog.create({
      data: {
        action: 'CASH_REGISTER_CLOSED',
        entity: 'CashRegisterSession',
        entityId: session.id,
        userId: user.id,
        details: JSON.stringify({
          openingAmount: Number(current.openingAmount || 0),
          totalEntries,
          closingAmount: Number(closingAmount || 0),
          withdrawalTotal,
          expectedAmount,
          difference,
          closedAt: closingDate.toISOString(),
          closedBy: user.name,
          duration: Math.round(
            (closingDate.getTime() - new Date(current.openedAt).getTime()) / 1000 / 60
          ),
          pixTotal: paymentTotals.PIX,
          creditTotal: paymentTotals.CREDIT_CARD,
          debitTotal: paymentTotals.DEBIT_CARD,
        }),
      },
    });

    const enriched = await enrichSession(session);

    return res.json(enriched);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao fechar caixa' });
  }
};

export const createCashWithdrawal = async (req: Request, res: Response) => {
  try {
    const user = (req as any).user;
    const { amount, reason } = req.body;
    const current = await getOpenSession();

    if (!current) {
      return res.status(400).json({ message: 'Nenhum caixa aberto para registrar sangria.' });
    }

    if (!amount || Number(amount) <= 0 || !String(reason || '').trim()) {
      return res.status(400).json({ message: 'Informe valor e motivo da sangria.' });
    }

    if (Number(amount) < 0) {
      return res.status(400).json({ message: 'O valor da sangria não pode ser negativo.' });
    }

    const withdrawal = await prisma.cashWithdrawal.create({
      data: {
        amount: Number(amount),
        reason: String(reason).trim(),
        sessionId: current.id,
        createdById: user.id,
      },
      include: {
        createdBy: { select: { id: true, name: true, role: true } },
      },
    });

    await prisma.auditLog.create({
      data: {
        action: 'CASH_WITHDRAWAL',
        entity: 'CashWithdrawal',
        entityId: withdrawal.id,
        userId: user.id,
        details: JSON.stringify({
          amount: Number(amount),
          reason: String(reason).trim(),
          withdrawnBy: user.name,
          withdrawnAt: new Date().toISOString(),
          sessionId: current.id,
        }),
      },
    });

    return res.status(201).json(withdrawal);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao registrar sangria' });
  }
};