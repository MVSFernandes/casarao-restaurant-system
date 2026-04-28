import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getProducts = async (req: Request, res: Response) => {
  try {
    const { categoryId } = req.query;

    const products = await prisma.product.findMany({
      where: categoryId ? { categoryId: categoryId as string } : undefined,
      orderBy: { name: 'asc' },
      include: {
        category: true,
        stockItems: {
          include: {
            stockItem: true,
          },
          orderBy: {
            stockItem: {
              name: 'asc',
            },
          },
        },
      },
    });

    res.json(products);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar produtos' });
  }
};

export const getProductById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const product = await prisma.product.findUnique({
      where: { id },
      include: {
        category: true,
        stockItems: {
          include: {
            stockItem: true,
          },
          orderBy: {
            stockItem: {
              name: 'asc',
            },
          },
        },
      },
    });

    if (!product) {
      return res.status(404).json({ message: 'Produto não encontrado' });
    }

    res.json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar produto' });
  }
};

export const createProduct = async (req: Request, res: Response) => {
  try {
    const { name, description, price, categoryId, imageUrl, isByWeight } = req.body;

    const product = await prisma.product.create({
      data: {
        name,
        description,
        price: parseFloat(price),
        categoryId,
        imageUrl,
        isByWeight: !!isByWeight,
      },
      include: {
        category: true,
        stockItems: {
          include: {
            stockItem: true,
          },
          orderBy: {
            stockItem: {
              name: 'asc',
            },
          },
        },
      },
    });

    res.status(201).json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar produto' });
  }
};

export const updateProduct = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { name, description, price, categoryId, imageUrl, isByWeight } = req.body;

    const product = await prisma.product.update({
      where: { id },
      data: {
        name,
        description,
        price: price !== undefined ? parseFloat(price) : undefined,
        categoryId,
        imageUrl,
        isByWeight: isByWeight !== undefined ? !!isByWeight : undefined,
      },
      include: {
        category: true,
        stockItems: {
          include: {
            stockItem: true,
          },
          orderBy: {
            stockItem: {
              name: 'asc',
            },
          },
        },
      },
    });

    res.json(product);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar produto' });
  }
};

export const deleteProduct = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    await prisma.product.delete({
      where: { id },
    });

    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir produto' });
  }
};