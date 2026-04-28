import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getPayables = async (req: Request, res: Response) => {
  try {
    const payables = await prisma.payableAccount.findMany({
      orderBy: [{ paid: 'asc' }, { dueDate: 'asc' }],
      include: { supplier: true },
    });

    res.json(payables);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar contas a pagar' });
  }
};

export const createPayable = async (req: Request, res: Response) => {
  try {
    const { description, amount, dueDate, supplierId } = req.body;

    const payable = await prisma.payableAccount.create({
      data: {
        description,
        amount: parseFloat(amount),
        dueDate: new Date(dueDate),
        supplierId: supplierId || undefined,
        paid: false,
      },
      include: { supplier: true },
    });

    res.status(201).json(payable);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar conta a pagar' });
  }
};

export const updatePayable = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { description, amount, dueDate, supplierId } = req.body;

    const existingPayable = await prisma.payableAccount.findUnique({
      where: { id },
    });

    if (!existingPayable) {
      return res.status(404).json({ message: 'Conta a pagar não encontrada' });
    }

    const payable = await prisma.payableAccount.update({
      where: { id },
      data: {
        description,
        amount: parseFloat(amount),
        dueDate: new Date(dueDate),
        supplierId: supplierId || null,
      },
      include: { supplier: true },
    });

    res.json(payable);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar conta a pagar' });
  }
};

export const deletePayable = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const existingPayable = await prisma.payableAccount.findUnique({
      where: { id },
    });

    if (!existingPayable) {
      return res.status(404).json({ message: 'Conta a pagar não encontrada' });
    }

    await prisma.payableAccount.delete({
      where: { id },
    });

    res.json({ message: 'Conta a pagar excluída com sucesso' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir conta a pagar' });
  }
};

export const markAsPaid = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const payable = await prisma.payableAccount.update({
      where: { id },
      data: { paid: true, paidAt: new Date() },
    });

    res.json(payable);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao marcar conta como paga' });
  }
};

export const getFinanceReports = async (req: Request, res: Response) => {
  try {
    const { period } = req.query;

    const now = new Date();
    const startDate = new Date();

    switch (period) {
      case 'today':
        startDate.setHours(0, 0, 0, 0);
        break;
      case 'week':
        startDate.setDate(now.getDate() - 7);
        break;
      case 'month':
        startDate.setMonth(now.getMonth() - 1);
        break;
      case 'year':
        startDate.setFullYear(now.getFullYear() - 1);
        break;
      default:
        startDate.setMonth(now.getMonth() - 1);
        break;
    }

    const orders = await prisma.order.findMany({
      where: {
        createdAt: { gte: startDate },
        status: {
          not: 'CANCELED',
        },
      },
      include: {
        items: { include: { product: true } },
        customer: true,
        payment: true,
      },
      orderBy: { createdAt: 'desc' },
    });

    const totalRevenue = orders.reduce((sum, order) => sum + Number(order.total || 0), 0);
    const totalOrders = orders.length;

    const payables = await prisma.payableAccount.findMany({
      where: {
        paid: true,
        paidAt: { gte: startDate },
      },
    });

    const totalExpenses = payables.reduce(
      (sum, payable) => sum + Number(payable.amount || 0),
      0
    );

    const cashWithdrawals = await prisma.cashWithdrawal.findMany({
      where: {
        createdAt: { gte: startDate },
      },
    });

    const totalWithdrawals = cashWithdrawals.reduce(
      (sum, withdrawal) => sum + Number(withdrawal.amount || 0),
      0
    );

    const productSales: Record<string, { name: string; quantity: number; revenue: number }> = {};

    for (const order of orders) {
      for (const item of order.items) {
        if (!productSales[item.productId]) {
          productSales[item.productId] = {
            name: item.product?.name || 'Desconhecido',
            quantity: 0,
            revenue: 0,
          };
        }

        const itemRevenue =
          Number(item.price || 0) *
          Number(item.product?.isByWeight ? Number(item.weight || 0) / 1000 : item.quantity || 0);

        productSales[item.productId].quantity += Number(item.quantity || 0);
        productSales[item.productId].revenue += itemRevenue;
      }
    }

    const topProducts = Object.values(productSales)
      .sort((a, b) => b.revenue - a.revenue)
      .slice(0, 5);

    const customerSales: Record<string, { name: string; totalSpent: number; orderCount: number }> =
      {};

    for (const order of orders) {
      if (order.customerId && order.customer) {
        if (!customerSales[order.customerId]) {
          customerSales[order.customerId] = {
            name: order.customer.name,
            totalSpent: 0,
            orderCount: 0,
          };
        }

        customerSales[order.customerId].totalSpent += Number(order.total || 0);
        customerSales[order.customerId].orderCount += 1;
      }
    }

    const topCustomers = Object.values(customerSales)
      .sort((a, b) => b.totalSpent - a.totalSpent)
      .slice(0, 5);

    const paymentMethods: Record<string, number> = {};

    for (const order of orders) {
      if (order.payment?.method) {
        const method = order.payment.method;
        paymentMethods[method] = (paymentMethods[method] || 0) + Number(order.payment.amount || 0);
      }
    }

    res.json({
      totalRevenue,
      totalExpenses,
      totalWithdrawals,
      netProfit: totalRevenue - totalExpenses,
      totalOrders,
      topProducts,
      topCustomers,
      paymentMethods,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao gerar relatório' });
  }
};