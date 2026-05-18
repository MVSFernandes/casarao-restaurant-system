import { Request, Response } from 'express';
import { tableService } from '../services/domain.services';
import { orderRepository } from '../repositories/order.repository';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) {
    return res.status(error.status).json({ message: error.message });
  }
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getTables = async (_req: Request, res: Response) => {
  try {
    const tables = await tableService.listAll();

    // Enriquece cada mesa com seus pedidos ativos (compatibilidade com frontend)
    const enriched = await Promise.all(
      tables.map(async (table) => {
        const activeStatuses = ['NEW', 'IN_PROGRESS', 'READY', 'DELIVERED'] as const;
        const allOrders = await Promise.all(
          activeStatuses.map((s) => orderRepository.findByStatus(s))
        );
        const tableOrders = allOrders.flat().filter((o) => o.tableId === table.id);
        return { ...table, orders: tableOrders };
      })
    );

    res.json(enriched);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar mesas');
  }
};

export const getTableById = async (req: Request, res: Response) => {
  try {
    const table = await tableService.findById(req.params.id);
    res.json(table);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar mesa');
  }
};

export const createTable = async (req: Request, res: Response) => {
  try {
    const table = await tableService.create(parseInt(req.body.number));
    res.status(201).json(table);
  } catch (error) {
    handleError(res, error, 'Erro ao criar mesa');
  }
};

export const updateTableStatus = async (req: Request, res: Response) => {
  try {
    const table = await tableService.updateStatus(req.params.id, req.body.status);
    res.json(table);
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar status da mesa');
  }
};

export const deleteTable = async (req: Request, res: Response) => {
  try {
    await tableService.delete(req.params.id);
    res.status(204).send();
  } catch (error) {
    handleError(res, error, 'Erro ao excluir mesa');
  }
};