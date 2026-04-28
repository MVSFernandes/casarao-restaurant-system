import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

const getLowStockList = async () => {
  const items = await prisma.stockItem.findMany({
    orderBy: { name: 'asc' },
  });

  return items.filter((item) => Number(item.quantity) <= Number(item.minQuantity));
};

const emitStockUpdate = async (req: Request) => {
  const io = req.app.get('io');
  if (!io) return;

  const lowStockItems = await getLowStockList();

  io.emit('stock:updated');
  io.emit('stock:low', lowStockItems);
};

export const getStockItems = async (_req: Request, res: Response) => {
  try {
    const items = await prisma.stockItem.findMany({
      orderBy: { name: 'asc' },
    });

    res.json(items);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar itens de estoque' });
  }
};

export const getStockItemById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const item = await prisma.stockItem.findUnique({
      where: { id },
    });

    if (!item) {
      return res.status(404).json({ message: 'Item não encontrado' });
    }

    res.json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar item' });
  }
};

export const getLowStockItems = async (_req: Request, res: Response) => {
  try {
    const items = await getLowStockList();
    res.json(items);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar itens com estoque baixo' });
  }
};

export const createStockItem = async (req: Request, res: Response) => {
  try {
    const { name, quantity, unit, minQuantity } = req.body;

    const item = await prisma.stockItem.create({
      data: {
        name,
        quantity: parseFloat(quantity),
        unit,
        minQuantity: parseFloat(minQuantity || 0),
      },
    });

    await emitStockUpdate(req);

    res.status(201).json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar item de estoque' });
  }
};

export const updateStockItem = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { name, quantity, unit, minQuantity } = req.body;

    const item = await prisma.stockItem.update({
      where: { id },
      data: {
        name,
        quantity: quantity !== undefined ? parseFloat(quantity) : undefined,
        unit,
        minQuantity: minQuantity !== undefined ? parseFloat(minQuantity) : undefined,
      },
    });

    await emitStockUpdate(req);

    res.json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar item de estoque' });
  }
};

export const deleteStockItem = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    await prisma.stockItem.delete({
      where: { id },
    });

    await emitStockUpdate(req);

    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir item de estoque' });
  }
};