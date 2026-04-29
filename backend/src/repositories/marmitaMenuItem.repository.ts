import { supabase } from '../lib/supabase';
import { MarmitaMenuItem } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toMarmitaMenuItemDomain,
  toMarmitaMenuItemInsert,
  toMarmitaMenuItemUpdate,
} from '../mappers/marmitaMenuItem.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'marmita_menu_items';

export const marmitaMenuItemRepository = {
  async findAll(): Promise<MarmitaMenuItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('day_of_week', { ascending: true })
      .order('sort_order', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    return (data ?? []).map(toMarmitaMenuItemDomain);
  },

  async findById(id: string): Promise<MarmitaMenuItem | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    return data ? toMarmitaMenuItemDomain(data) : null;
  },

  /**
   * Lista itens do cardápio para um dia específico (0=domingo, 6=sábado).
   * Apenas itens ativos.
   */
  async findByDayOfWeek(day: number): Promise<MarmitaMenuItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('day_of_week', day)
      .eq('is_active', true)
      .order('group', { ascending: true })
      .order('sort_order', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    return (data ?? []).map(toMarmitaMenuItemDomain);
  },

  async create(item: MarmitaMenuItem): Promise<MarmitaMenuItem> {
    const payload = toMarmitaMenuItemInsert(item);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    return toMarmitaMenuItemDomain(data);
  },

  async update(id: string, patch: Partial<MarmitaMenuItem>): Promise<MarmitaMenuItem> {
    const payload = toMarmitaMenuItemUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('MarmitaMenuItem', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    if (!data) throw new NotFoundError('MarmitaMenuItem', id);

    return toMarmitaMenuItemDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'MarmitaMenuItem' });
    if (count === 0) throw new NotFoundError('MarmitaMenuItem', id);
  },
};