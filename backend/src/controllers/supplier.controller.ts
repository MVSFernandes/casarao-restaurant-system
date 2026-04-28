import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getSuppliers = async (req: Request, res: Response) => {
  try {
    const suppliers = await prisma.supplier.findMany({ orderBy: { name: 'asc' } });
    res.json(suppliers);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar fornecedores' });
  }
};

export const createSupplier = async (req: Request, res: Response) => {
  try {
    const { name, contact, phone, email } = req.body;
    const supplier = await prisma.supplier.create({ data: { name, contact, phone, email } });
    res.status(201).json(supplier);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao criar fornecedor' });
  }
};

export const updateSupplier = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { name, contact, phone, email } = req.body;
    const supplier = await prisma.supplier.update({ where: { id }, data: { name, contact, phone, email } });
    res.json(supplier);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao atualizar fornecedor' });
  }
};

export const deleteSupplier = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.supplier.delete({ where: { id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: 'Erro ao excluir fornecedor' });
  }
};

export const getSupplierComparison = async (req: Request, res: Response) => {
  try {
    const stockItems = await prisma.stockItem.findMany({
      include: {
        supplierLinks: {
          include: { supplier: true }
        }
      }
    });

    const result = stockItems
      .filter((item: any) => item.supplierLinks.length > 0)
      .map((item: any) => {
        const minPrice = Math.min(...item.supplierLinks.map((sp: any) => sp.price));
        return {
          ...item,
          supplierPrices: item.supplierLinks.map((sp: any) => ({
            supplierId: sp.supplierId,
            supplierName: sp.supplier.name,
            price: sp.price,
            isCheapest: sp.price === minPrice,
          }))
        };
      });

    res.json(result);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar comparação de fornecedores' });
  }
};

export const upsertSupplierPrice = async (req: Request, res: Response) => {
  try {
    const { stockItemId, supplierId, price } = req.body;
    const supplierPrice = await prisma.supplierStockItem.upsert({
      where: { supplierId_stockItemId: { supplierId, stockItemId } },
      create: { stockItemId, supplierId, price: parseFloat(price) },
      update: { price: parseFloat(price) },
    });
    res.json(supplierPrice);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao registrar preço do fornecedor' });
  }
};
