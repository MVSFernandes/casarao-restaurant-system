import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getTables = async (req: Request, res: Response) => {
  try {
    const tables = await prisma.table.findMany({
      orderBy: { number: 'asc' },
      include: {
        orders: {
          where: { status: { in: ['NEW', 'IN_PROGRESS', 'READY', 'DELIVERED'] } },
          include: { items: { include: { product: true } } }
        }
      }
    });
    res.json(tables);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar mesas' });
  }
};

export const getTableById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const table = await prisma.table.findUnique({
      where: { id },
      include: {
        orders: {
          include: { items: { include: { product: true } } }
        }
      }
    });
    if (!table) return res.status(404).json({ message: 'Mesa não encontrada' });
    res.json(table);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar mesa' });
  }
};

export const createTable = async (req: Request, res: Response) => {
  try {
    const { number } = req.body;
    const table = await prisma.table.create({
      data: { number: parseInt(number), status: 'AVAILABLE' }
    });
    res.status(201).json(table);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar mesa' });
  }
};

export const updateTableStatus = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    const table = await prisma.table.update({
      where: { id },
      data: { status }
    });
    res.json(table);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao atualizar status da mesa' });
  }
};

export const deleteTable = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.table.delete({ where: { id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: 'Erro ao excluir mesa' });
  }
};
