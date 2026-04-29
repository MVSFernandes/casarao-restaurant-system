import { supabase } from '../lib/supabase';
import { Category } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toCategoryDomain,
  toCategoryInsert,
  toCategoryUpdate,
} from '../mappers/category.mapper';
import { NotFoundError } from '../types/errors';

/**
 * Repository de categorias.
 *
 * Encapsula todas as chamadas Supabase relacionadas a `categories`.
 * Devolve sempre entidades de domínio (camelCase, Date).
 *
 * Erros do banco são convertidos em DomainError (via mapSupabaseError).
 */

const TABLE = 'categories';

export const categoryRepository = {
  /**
   * Lista todas as categorias.
   * Ordenadas alfabeticamente por nome.
   */
  async findAll(): Promise<Category[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('name', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Category' });
    return (data ?? []).map(toCategoryDomain);
  },

  /**
   * Busca uma categoria pelo ID.
   * Retorna `null` se não existir (controller decide se é erro).
   */
  async findById(id: string): Promise<Category | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Category' });
    return data ? toCategoryDomain(data) : null;
  },

  /**
   * Cria uma nova categoria.
   * Lança UniqueConstraintError se o nome já existir.
   */
  async create(category: Category): Promise<Category> {
    const payload = toCategoryInsert(category);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Category', field: 'name' });
    return toCategoryDomain(data);
  },

  /**
   * Atualiza uma categoria parcialmente.
   * Lança NotFoundError se o ID não existir.
   */
  async update(id: string, patch: Partial<Category>): Promise<Category> {
    const payload = toCategoryUpdate(patch);

    // Sem campos para atualizar? Devolve o estado atual.
    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Category', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Category' });
    if (!data) throw new NotFoundError('Category', id);

    return toCategoryDomain(data);
  },

  /**
   * Deleta uma categoria pelo ID.
   * Lança NotFoundError se não existir.
   * Lança ForeignKeyError se houver produtos vinculados (FK protege).
   */
  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Category' });
    if (count === 0) throw new NotFoundError('Category', id);
  },
};