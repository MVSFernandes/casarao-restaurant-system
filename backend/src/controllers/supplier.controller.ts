import { Request, Response } from 'express';
import { supplierService } from '../services/domain.services';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getSuppliers = async (_req: Request, res: Response) => {
  try {
    res.json(await supplierService.listAll());
  } catch (error) {
    handleError(res, error, 'Erro ao buscar fornecedores');
  }
};

export const createSupplier = async (req: Request, res: Response) => {
  try {
    const { name, contact, phone, email } = req.body;
    const supplier = await supplierService.create({ name, contact, phone, email });
    res.status(201).json(supplier);
  } catch (error) {
    handleError(res, error, 'Erro ao criar fornecedor');
  }
};

export const updateSupplier = async (req: Request, res: Response) => {
  try {
    const { name, contact, phone, email } = req.body;
    const supplier = await supplierService.update(req.params.id, { name, contact, phone, email });
    res.json(supplier);
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar fornecedor');
  }
};

export const deleteSupplier = async (req: Request, res: Response) => {
  try {
    await supplierService.delete(req.params.id);
    res.status(204).send();
  } catch (error) {
    handleError(res, error, 'Erro ao excluir fornecedor');
  }
};

export const getSupplierComparison = async (_req: Request, res: Response) => {
  try {
    const result = await supplierService.getComparison();
    res.json(result);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar comparação de fornecedores');
  }
};

export const upsertSupplierPrice = async (req: Request, res: Response) => {
  try {
    const { stockItemId, supplierId, price } = req.body;
    const result = await supplierService.upsertPrice({ stockItemId, supplierId, price });
    res.json(result);
  } catch (error) {
    handleError(res, error, 'Erro ao registrar preço do fornecedor');
  }
};