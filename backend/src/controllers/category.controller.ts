import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getCategories = async (req: Request, res: Response) => {
  try {
    const { includeProducts } = req.query;
    const categories = await prisma.category.findMany({
      orderBy: { name: 'asc' },
      include: includeProducts === 'true' ? { products: { orderBy: { name: 'asc' } } } : undefined,
    });
    res.json(categories);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar categorias' });
  }
};

export const getCategoryById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const category = await prisma.category.findUnique({
      where: { id },
      include: { products: true }
    });
    if (!category) return res.status(404).json({ message: 'Categoria não encontrada' });
    res.json(category);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar categoria' });
  }
};

const mapCategoryPayload = (body: any) => ({
  name: body.name,
  isMealCategory: !!body.isMealCategory,
  pricePerKg:
    body.pricePerKg !== undefined && body.pricePerKg !== null && body.pricePerKg !== ''
      ? Number(body.pricePerKg)
      : null,
  selfServicePricePerKg:
    body.selfServicePricePerKg !== undefined && body.selfServicePricePerKg !== null && body.selfServicePricePerKg !== ''
      ? Number(body.selfServicePricePerKg)
      : null,
});

export const createCategory = async (req: Request, res: Response) => {
  try {
    const category = await prisma.category.create({ data: mapCategoryPayload(req.body) });
    res.status(201).json(category);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar categoria' });
  }
};

export const updateCategory = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const category = await prisma.category.update({ where: { id }, data: mapCategoryPayload(req.body) });
    res.json(category);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar categoria' });
  }
};

export const deleteCategory = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    await prisma.category.delete({ where: { id } });
    res.status(204).send();
  } catch (error) {
    res.status(500).json({ message: 'Erro ao excluir categoria' });
  }
};
