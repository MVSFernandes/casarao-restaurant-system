import { Database } from '../types/database';
import { Supplier } from '../types/domain';

type SupplierRow = Database['public']['Tables']['suppliers']['Row'];
type SupplierInsert = Database['public']['Tables']['suppliers']['Insert'];
type SupplierUpdate = Database['public']['Tables']['suppliers']['Update'];

export function toSupplierDomain(row: SupplierRow): Supplier {
  return {
    id: row.id,
    name: row.name,
    contact: row.contact,
    phone: row.phone,
    email: row.email,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toSupplierInsert(domain: Supplier): SupplierInsert {
  return {
    id: domain.id,
    name: domain.name,
    contact: domain.contact,
    phone: domain.phone,
    email: domain.email,
  };
}

export function toSupplierUpdate(patch: Partial<Supplier>): SupplierUpdate {
  const update: SupplierUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.contact !== undefined) update.contact = patch.contact;
  if (patch.phone !== undefined) update.phone = patch.phone;
  if (patch.email !== undefined) update.email = patch.email;
  return update;
}