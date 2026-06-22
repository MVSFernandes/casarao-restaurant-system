import { Request, Response } from 'express';
import { customerService } from '../services/customer.service';
import { creditService } from '../services/credit.service';
import { DomainError } from '../types/errors';

const handleError = (res: Response, error: unknown, fallback: string) => {
  if (error instanceof DomainError) return res.status(error.status).json({ message: error.message });
  console.error(error);
  return res.status(500).json({ message: fallback });
};

export const getCustomers = async (_req: Request, res: Response) => {
  try {
    const customers = await customerService.listAll();
    // Enriquece com transações (compatibilidade frontend)
    const enriched = await Promise.all(
      customers.map(async (c) => ({
        ...c,
        creditTxs: await customerService.getTransactions(c.id),
      }))
    );
    res.json(enriched);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar clientes');
  }
};

export const getCustomerCredits = async (_req: Request, res: Response) => {
  try {
    const summaries = await creditService.listCustomerCredits();
    res.json(summaries);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar fiado dos clientes');
  }
};

export const getCustomerCredit = async (req: Request, res: Response) => {
  try {
    const summary = await creditService.getCustomerCredit(req.params.id);
    res.json(summary);
  } catch (error) {
    handleError(res, error, 'Erro ao buscar fiado do cliente');
  }
};

export const createCustomer = async (req: Request, res: Response) => {
  try {
    const {
      name, phone, email, address, creditLimit, personType, document, legalName,
      stateRegistration, fiscalZipCode, fiscalStreet, fiscalNumber, fiscalNeighborhood,
      fiscalCity, fiscalCityIbgeCode, fiscalState,
    } = req.body;
    const customer = await customerService.create({
      name,
      phone,
      email,
      address,
      creditLimit,
      personType,
      document,
      legalName,
      stateRegistration,
      fiscalZipCode,
      fiscalStreet,
      fiscalNumber,
      fiscalNeighborhood,
      fiscalCity,
      fiscalCityIbgeCode,
      fiscalState,
    });
    const creditTxs = await customerService.getTransactions(customer.id);
    res.status(201).json({ ...customer, creditTxs });
  } catch (error) {
    handleError(res, error, 'Erro ao criar cliente');
  }
};

export const updateCustomer = async (req: Request, res: Response) => {
  try {
    const {
      name, phone, email, address, creditLimit, personType, document, legalName,
      stateRegistration, fiscalZipCode, fiscalStreet, fiscalNumber, fiscalNeighborhood,
      fiscalCity, fiscalCityIbgeCode, fiscalState,
    } = req.body;
    const customer = await customerService.update(req.params.id, {
      name,
      phone: phone || null,
      email: email || null,
      address: address || null,
      creditLimit,
      personType,
      document,
      legalName,
      stateRegistration,
      fiscalZipCode,
      fiscalStreet,
      fiscalNumber,
      fiscalNeighborhood,
      fiscalCity,
      fiscalCityIbgeCode,
      fiscalState,
    });
    const creditTxs = await customerService.getTransactions(customer.id);
    res.json({ ...customer, creditTxs });
  } catch (error) {
    handleError(res, error, 'Erro ao atualizar cliente');
  }
};

export const deleteCustomer = async (req: Request, res: Response) => {
  try {
    await customerService.delete(req.params.id);
    res.status(204).send();
  } catch (error) {
    handleError(res, error, 'Erro ao excluir cliente');
  }
};

export const addCreditCharge = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { amount, description } = req.body;
    await customerService.chargeCredit(id, amount, description);
    const summary = await creditService.getCustomerCredit(id);
    res.json(summary);
  } catch (error) {
    handleError(res, error, 'Erro ao lançar valor no fiado');
  }
};

export const payCredit = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { amount } = req.body;
    await customerService.payCredit(id, amount);
    const summary = await creditService.getCustomerCredit(id);
    res.json(summary);
  } catch (error) {
    handleError(res, error, 'Erro ao registrar pagamento de fiado');
  }
};
