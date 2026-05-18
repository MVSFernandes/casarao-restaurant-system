import { createId } from '@paralleldrive/cuid2';
import { customerRepository } from '../repositories/customer.repository';
import { creditTransactionRepository } from '../repositories/creditTransaction.repository';
import { Customer, CreditTransaction } from '../types/domain';
import { ValidationError, NotFoundError } from '../types/errors';

const parseAmount = (value: unknown) =>
  Number(parseFloat(String(value ?? 0)).toFixed(2));

export const customerService = {
  async listAll(): Promise<Customer[]> {
    return customerRepository.findAll();
  },

  async findById(id: string): Promise<Customer> {
    const customer = await customerRepository.findById(id);
    if (!customer) throw new NotFoundError('Customer', id);
    return customer;
  },

  async findByPhone(phone: string): Promise<Customer | null> {
    return customerRepository.findByPhone(phone);
  },

  async search(name: string): Promise<Customer[]> {
    return customerRepository.searchByName(name);
  },

  async findWithDebt(): Promise<Customer[]> {
    return customerRepository.findWithCreditDebt();
  },

  async create(input: {
    name: string;
    phone?: string | null;
    email?: string | null;
    address?: string | null;
    creditLimit?: number;
  }): Promise<Customer> {
    return customerRepository.create({
      id: createId(),
      name: input.name,
      phone: input.phone ?? null,
      email: input.email ?? null,
      address: input.address ?? null,
      creditLimit: parseAmount(input.creditLimit ?? 0),
      creditUsed: 0,
      createdAt: new Date(),
      updatedAt: new Date(),
    });
  },

  async update(
    id: string,
    input: {
      name?: string;
      phone?: string | null;
      email?: string | null;
      address?: string | null;
      creditLimit?: number;
    }
  ): Promise<Customer> {
    const patch: Partial<Customer> = {};
    if (input.name !== undefined) patch.name = input.name;
    if (input.phone !== undefined) patch.phone = input.phone;
    if (input.email !== undefined) patch.email = input.email;
    if (input.address !== undefined) patch.address = input.address;
    if (input.creditLimit !== undefined) patch.creditLimit = parseAmount(input.creditLimit);
    return customerRepository.update(id, patch);
  },

  async delete(id: string): Promise<void> {
    return customerRepository.delete(id);
  },

  async getTransactions(customerId: string): Promise<CreditTransaction[]> {
    return creditTransactionRepository.findByCustomer(customerId);
  },

  async chargeCredit(
    customerId: string,
    amount: number,
    description?: string | null
  ): Promise<Customer> {
    const chargeAmount = parseAmount(amount);
    if (!chargeAmount || chargeAmount <= 0) {
      throw new ValidationError('amount', 'Informe um valor valido para lancar no fiado.');
    }
    const customer = await customerRepository.findById(customerId);
    if (!customer) throw new NotFoundError('Customer', customerId);
    await creditTransactionRepository.chargeCredit(
      customerId,
      chargeAmount,
      description ?? 'Lancamento manual no fiado'
    );
    return (await customerRepository.findById(customerId))!;
  },

  async payCredit(customerId: string, amount: number): Promise<Customer> {
    const paidAmount = parseAmount(amount);
    if (!paidAmount || paidAmount <= 0) {
      throw new ValidationError('amount', 'Informe um valor valido para pagamento.');
    }
    const customer = await customerRepository.findById(customerId);
    if (!customer) throw new NotFoundError('Customer', customerId);
    await creditTransactionRepository.payCredit(
      customerId,
      Math.min(customer.creditUsed, paidAmount),
      'Pagamento de fiado'
    );
    return (await customerRepository.findById(customerId))!;
  },
};
