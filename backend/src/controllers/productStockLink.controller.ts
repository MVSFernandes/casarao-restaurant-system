import { Request, Response } from 'express';
import { productService } from '../services/domain.services';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getLinksByProduct = async (req: Request, res: Response) => {
  try {
    const links = await productService.getLinks(req.params.productId);
    res.json(links);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar vínculos de estoque do produto.');
  }
};

export const replaceLinksByProduct = async (req: Request, res: Response) => {
  try {
    const { productId } = req.params;
    const { links } = req.body as {
      links?: Array<{ stockItemId: string; quantity: number }>;
    };

    const result = await productService.replaceLinks(
      productId,
      (links || []).filter((l) => l.stockItemId && Number(l.quantity) > 0)
        .map((l) => ({ stockItemId: l.stockItemId, quantity: Number(l.quantity) }))
    );

    // Retorna os links atualizados para compatibilidade com o frontend
    const updatedLinks = await productService.getLinks(productId);
    res.json(updatedLinks);
  } catch (error) {
    handleError(res, error, 'Erro ao salvar vínculos de estoque do produto.');
  }
};