import { supabase } from '../lib/supabase';
import { Supplier } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toSupplierDomain,
  toSupplierInsert,
  toSupplierUpdate,
} from '../mappers/supplier.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'suppliers';

export const supplierRepository = {
  async findAll(): Promise<Supplier[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('name', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Supplier' });
    return (data ?? []).map(toSupplierDomain);
  },

  async findById(id: string): Promise<Supplier | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Supplier' });
    return data ? toSupplierDomain(data) : null;
  },

  async create(supplier: Supplier): Promise<Supplier> {
    const payload = toSupplierInsert(supplier);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Supplier', field: 'name' });
    return toSupplierDomain(data);
  },

  async update(id: string, patch: Partial<Supplier>): Promise<Supplier> {
    const payload = toSupplierUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Supplier', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Supplier' });
    if (!data) throw new NotFoundError('Supplier', id);

    return toSupplierDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Supplier' });
    if (count === 0) throw new NotFoundError('Supplier', id);
  },
};