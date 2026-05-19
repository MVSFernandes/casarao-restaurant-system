import { Request, Response } from 'express';
import { financeService } from '../services/finance.service';
import { supabase } from '../lib/supabase';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getPayables = async (_req: Request, res: Response) => {
  try {
    res.json(await financeService.listPayables());
  } catch (error) {
    handleError(res, error, 'Erro ao buscar contas a pagar');
  }
};

export const createPayable = async (req: Request, res: Response) => {
  try {
    const { description, amount, dueDate, supplierId } = req.body;
    const payable = await financeService.createPayable({
      description,
      amount: parseFloat(amount),
      dueDate: new Date(dueDate),
      supplierId: supplierId || null,
    });
    res.status(201).json(payable);
  } catch (error) {
    handleError(res, error, 'Erro ao criar conta a pagar');
  }
};

export const updatePayable = async (req: Request, res: Response) => {
  try {
    const { description, amount, dueDate, supplierId } = req.body;
    const payable = await financeService.updatePayable(req.params.id, {
      description,
      amount: amount ? parseFloat(amount) : undefined,
      dueDate: dueDate ? new Date(dueDate) : undefined,
      supplierId: supplierId || null,
    });
    res.json(payable);
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar conta a pagar');
  }
};

export const deletePayable = async (req: Request, res: Response) => {
  try {
    await financeService.deletePayable(req.params.id);
    res.json({ message: 'Conta a pagar excluída com sucesso' });
  } catch (error) {
    handleError(res, error, 'Erro ao excluir conta a pagar');
  }
};

export const markAsPaid = async (req: Request, res: Response) => {
  try {
    const payable = await financeService.markAsPaid(req.params.id);
    res.json(payable);
  } catch (error) {
    handleError(res, error, 'Erro ao marcar conta como paga');
  }
};

export const getFinanceReports = async (req: Request, res: Response) => {
  try {
    const { period } = req.query;
    const { dates } = await financeService.getReport((period as any) || 'month');

    const { data, error } = await supabase.rpc('finance_report', {
      p_start_date: dates.startDate,
      p_end_date: dates.endDate,
    });

    if (error) throw error;

    // Mapeia snake_case → camelCase para compatibilidade com o frontend
    const mapped = {
      totalRevenue: data.total_revenue ?? 0,
      totalExpenses: data.total_expenses ?? 0,
      totalWithdrawals: data.total_withdrawals ?? 0,
      netProfit: data.net_profit ?? 0,
      totalOrders: data.total_orders ?? 0,
      topProducts: (data.top_products ?? []).map((p: any) => ({
        productId: p.product_id,
        name: p.name,
        quantity: p.quantity,
        revenue: p.revenue,
      })),
      topCustomers: (data.top_customers ?? []).map((c: any) => ({
        customerId: c.customer_id,
        name: c.name,
        totalSpent: c.total_spent,
        orderCount: c.order_count,
      })),
      paymentMethods: data.payment_methods ?? {},
    };

    res.json(mapped);
  } catch (error) {
    handleError(res, error, 'Erro ao gerar relatório');
  }
};