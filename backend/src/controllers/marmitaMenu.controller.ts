import { Request, Response } from 'express';
import { marmitaMenuService } from '../services/domain.services';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getTodayMarmitaMenu = async (_req: Request, res: Response) => {
  try {
    const items = await marmitaMenuService.getTodayMenu();
    res.json(items);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar cardápio da marmita de hoje.');
  }
};

export const getMarmitaMenuByDay = async (req: Request, res: Response) => {
  try {
    const items = await marmitaMenuService.getByDay(Number(req.params.dayOfWeek));
    res.json(items);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar cardápio da marmita.');
  }
};

export const createMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    const { dayOfWeek, name, group, price, sortOrder } = req.body;
    const item = await marmitaMenuService.create({
      dayOfWeek: Number(dayOfWeek),
      name,
      group,
      price: Number(price || 0),
      sortOrder: Number(sortOrder || 0),
      isActive: true,
    });
    res.status(201).json(item);
  } catch (error) {
    handleError(res, error, 'Erro ao criar item da marmita.');
  }
};

export const updateMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    const { dayOfWeek, name, group, price, isActive, sortOrder } = req.body;
    const item = await marmitaMenuService.update(req.params.id, {
      dayOfWeek: dayOfWeek !== undefined ? Number(dayOfWeek) : undefined,
      name,
      group,
      price: price !== undefined ? Number(price) : undefined,
      isActive,
      sortOrder: sortOrder !== undefined ? Number(sortOrder) : undefined,
    });
    res.json(item);
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar item da marmita.');
  }
};

export const deleteMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    await marmitaMenuService.delete(req.params.id);
    res.status(204).send();
  } catch (error) {
    handleError(res, error, 'Erro ao excluir item da marmita.');
  }
};