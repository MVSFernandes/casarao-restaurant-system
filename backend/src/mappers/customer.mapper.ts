import { Database } from '../types/database';
import { Customer } from '../types/domain';

type CustomerRow = Database['public']['Tables']['customers']['Row'];
type CustomerInsert = Database['public']['Tables']['customers']['Insert'];
type CustomerUpdate = Database['public']['Tables']['customers']['Update'];

export function toCustomerDomain(row: CustomerRow): Customer {
  return {
    id: row.id,
    name: row.name,
    phone: row.phone,
    email: row.email,
    address: row.address,
    creditLimit: row.credit_limit,
    creditUsed: row.credit_used,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toCustomerInsert(domain: Customer): CustomerInsert {
  return {
    id: domain.id,
    name: domain.name,
    phone: domain.phone,
    email: domain.email,
    address: domain.address,
    credit_limit: domain.creditLimit,
    credit_used: domain.creditUsed,
  };
}

export function toCustomerUpdate(patch: Partial<Customer>): CustomerUpdate {
  const update: CustomerUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.phone !== undefined) update.phone = patch.phone;
  if (patch.email !== undefined) update.email = patch.email;
  if (patch.address !== undefined) update.address = patch.address;
  if (patch.creditLimit !== undefined) update.credit_limit = patch.creditLimit;
  if (patch.creditUsed !== undefined) update.credit_used = patch.creditUsed;
  return update;
}