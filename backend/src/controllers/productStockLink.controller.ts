import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getLinksByProduct = async (req: Request, res: Response) => {
  try {
    const { productId } = req.params;

    const links = await prisma.productStockItem.findMany({
      where: { productId },
      include: {
        stockItem: true,
      },
      orderBy: {
        stockItem: {
          name: 'asc',
        },
      },
    });

    res.json(links);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar vínculos de estoque do produto.' });
  }
};

export const replaceLinksByProduct = async (req: Request, res: Response) => {
  try {
    const { productId } = req.params;
    const { links } = req.body as {
      links?: Array<{
        stockItemId: string;
        quantity: number;
      }>;
    };

    const product = await prisma.product.findUnique({
      where: { id: productId },
    });

    if (!product) {
      return res.status(404).json({ message: 'Produto não encontrado.' });
    }

    const normalizedLinks =
      (links || [])
        .filter((link) => link.stockItemId && Number(link.quantity) > 0)
        .map((link) => ({
          stockItemId: link.stockItemId,
          quantity: Number(link.quantity),
        }));

    await prisma.$transaction(async (tx) => {
      await tx.productStockItem.deleteMany({
        where: { productId },
      });

      if (normalizedLinks.length > 0) {
        await tx.productStockItem.createMany({
          data: normalizedLinks.map((link) => ({
            productId,
            stockItemId: link.stockItemId,
            quantity: link.quantity,
          })),
        });
      }
    });

    const updatedLinks = await prisma.productStockItem.findMany({
      where: { productId },
      include: {
        stockItem: true,
      },
      orderBy: {
        stockItem: {
          name: 'asc',
        },
      },
    });

    res.json(updatedLinks);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao salvar vínculos de estoque do produto.' });
  }
};