import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

const parseAmount = (value: unknown) => Number(parseFloat(String(value || 0)).toFixed(2));

export const getCustomers = async (req: Request, res: Response) => {
  try {
    const customers = await prisma.customer.findMany({
      orderBy: { name: 'asc' },
      include: {
        creditTxs: {
          orderBy: { createdAt: 'desc' },
        },
      },
    });

    res.json(customers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar clientes' });
  }
};

export const createCustomer = async (req: Request, res: Response) => {
  try {
    const { name, phone, email, address, creditLimit } = req.body;

    const customer = await prisma.customer.create({
      data: {
        name,
        phone: phone || null,
        email: email || null,
        address: address || null,
        creditLimit: parseAmount(creditLimit),
        creditUsed: 0,
      },
      include: {
        creditTxs: {
          orderBy: { createdAt: 'desc' },
        },
      },
    });

    res.status(201).json(customer);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar cliente' });
  }
};

export const updateCustomer = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { name, phone, email, address, creditLimit } = req.body;

    const customer = await prisma.customer.update({
      where: { id },
      data: {
        name,
        phone: phone || null,
        email: email || null,
        address: address || null,
        creditLimit: creditLimit !== undefined ? parseAmount(creditLimit) : undefined,
      },
      include: {
        creditTxs: {
          orderBy: { createdAt: 'desc' },
        },
      },
    });

    res.json(customer);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar cliente' });
  }
};

export const deleteCustomer = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.customer.delete({ where: { id } });
    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir cliente' });
  }
};

export const addCreditCharge = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { amount, description } = req.body;

    const chargeAmount = parseAmount(amount);

    if (!chargeAmount || chargeAmount <= 0) {
      return res.status(400).json({ message: 'Informe um valor válido para lançar no fiado.' });
    }

    const customer = await prisma.customer.findUnique({ where: { id } });

    if (!customer) {
      return res.status(404).json({ message: 'Cliente não encontrado' });
    }

    const updated = await prisma.$transaction(async (tx) => {
      await tx.creditTransaction.create({
        data: {
          customerId: id,
          type: 'CHARGE',
          amount: chargeAmount,
          description: description || 'Lançamento manual no fiado',
        },
      });

      return tx.customer.update({
        where: { id },
        data: {
          creditUsed: {
            increment: chargeAmount,
          },
        },
        include: {
          creditTxs: {
            orderBy: { createdAt: 'desc' },
          },
        },
      });
    });

    return res.json(updated);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao lançar valor no fiado' });
  }
};

export const payCredit = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { amount } = req.body;

    const paidAmount = parseAmount(amount);

    if (!paidAmount || paidAmount <= 0) {
      return res.status(400).json({ message: 'Informe um valor válido para pagamento.' });
    }

    const customer = await prisma.customer.findUnique({ where: { id } });

    if (!customer) {
      return res.status(404).json({ message: 'Cliente não encontrado' });
    }

    const discountAmount = Math.min(customer.creditUsed, paidAmount);

    const updated = await prisma.$transaction(async (tx) => {
      await tx.creditTransaction.create({
        data: {
          customerId: id,
          type: 'PAYMENT',
          amount: discountAmount,
          description: 'Pagamento de fiado',
        },
      });

      return tx.customer.update({
        where: { id },
        data: {
          creditUsed: {
            decrement: discountAmount,
          },
        },
        include: {
          creditTxs: {
            orderBy: { createdAt: 'desc' },
          },
        },
      });
    });

    return res.json(updated);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao registrar pagamento de fiado' });
  }
};
