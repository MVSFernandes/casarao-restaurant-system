import { supabase } from '../lib/supabase';
import { Product } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toProductDomain,
  toProductInsert,
  toProductUpdate,
} from '../mappers/product.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'products';

export const productRepository = {
  async findAll(): Promise<Product[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('name', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Product' });
    return (data ?? []).map(toProductDomain);
  },

  async findById(id: string): Promise<Product | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Product' });
    return data ? toProductDomain(data) : null;
  },

  /**
   * Lista produtos de uma categoria específica.
   * Usado no cardápio público (filtros) e no painel admin.
   */
  async findByCategory(categoryId: string): Promise<Product[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('category_id', categoryId)
      .order('name', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Product' });
    return (data ?? []).map(toProductDomain);
  },

  /**
   * Busca produto por nome (case-insensitive, partial match).
   * Usa o índice GIN trigram (idx_products_name_trgm) para performance.
   */
  async searchByName(query: string): Promise<Product[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .ilike('name', `%${query}%`)
      .order('name', { ascending: true })
      .limit(50);

    if (error) throw mapSupabaseError(error, { entity: 'Product' });
    return (data ?? []).map(toProductDomain);
  },

  async create(product: Product): Promise<Product> {
    const payload = toProductInsert(product);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Product', field: 'category_id' });
    return toProductDomain(data);
  },

  async update(id: string, patch: Partial<Product>): Promise<Product> {
    const payload = toProductUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Product', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Product', field: 'category_id' });
    if (!data) throw new NotFoundError('Product', id);

    return toProductDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Product' });
    if (count === 0) throw new NotFoundError('Product', id);
  },
};