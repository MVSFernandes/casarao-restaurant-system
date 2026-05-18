import { Request, Response } from 'express';
import { productService } from '../services/domain.services';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getProducts = async (req: Request, res: Response) => {
  try {
    const { categoryId } = req.query;
    const products = await productService.listAll(categoryId as string | undefined);
    res.json(products);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar produtos');
  }
};

export const getProductById = async (req: Request, res: Response) => {
  try {
    const product = await productService.findById(req.params.id);
    res.json(product);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar produto');
  }
};

export const createProduct = async (req: Request, res: Response) => {
  try {
    const { name, description, price, categoryId, imageUrl, isByWeight } = req.body;
    const product = await productService.create({
      name, description, price, categoryId, imageUrl, isByWeight,
    });
    res.status(201).json(product);
  } catch (error) {
    handleError(res, error, 'Erro ao criar produto');
  }
};

export const updateProduct = async (req: Request, res: Response) => {
  try {
    const { name, description, price, categoryId, imageUrl, isByWeight } = req.body;
    const product = await productService.update(req.params.id, {
      name,
      description,
      price: price !== undefined ? parseFloat(price) : undefined,
      categoryId,
      imageUrl,
      isByWeight: isByWeight !== undefined ? !!isByWeight : undefined,
    });
    res.json(product);
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar produto');
  }
};

export const deleteProduct = async (req: Request, res: Response) => {
  try {
    await productService.delete(req.params.id);
    res.status(204).send();
  } catch (error) {
    handleError(res, error, 'Erro ao excluir produto');
  }
};