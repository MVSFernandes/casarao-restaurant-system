import { supabase } from '../lib/supabase';
import { Table } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toTableDomain,
  toTableInsert,
  toTableUpdate,
} from '../mappers/table.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'tables';

export const tableRepository = {
  async findAll(): Promise<Table[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('number', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Table' });
    return (data ?? []).map(toTableDomain);
  },

  async findById(id: string): Promise<Table | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Table' });
    return data ? toTableDomain(data) : null;
  },

  async create(table: Table): Promise<Table> {
    const payload = toTableInsert(table);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Table', field: 'number' });
    return toTableDomain(data);
  },

  async update(id: string, patch: Partial<Table>): Promise<Table> {
    const payload = toTableUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Table', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Table' });
    if (!data) throw new NotFoundError('Table', id);

    return toTableDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Table' });
    if (count === 0) throw new NotFoundError('Table', id);
  },
};