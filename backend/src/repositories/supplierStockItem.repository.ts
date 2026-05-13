import { supabase } from '../lib/supabase';
import { SupplierStockItem } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toSupplierStockItemDomain,
  toSupplierStockItemInsert,
  toSupplierStockItemUpdate,
} from '../mappers/supplierStockItem.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'supplier_stock_items';

export const supplierStockItemRepository = {
  async findAll(): Promise<SupplierStockItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('updated_at', { ascending: false });

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    return (data ?? []).map(toSupplierStockItemDomain);
  },

  async findById(id: string): Promise<SupplierStockItem | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    return data ? toSupplierStockItemDomain(data) : null;
  },

  async findBySupplier(supplierId: string): Promise<SupplierStockItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('supplier_id', supplierId)
      .order('updated_at', { ascending: false });

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    return (data ?? []).map(toSupplierStockItemDomain);
  },

  async findByStockItem(stockItemId: string): Promise<SupplierStockItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('stock_item_id', stockItemId)
      .order('price', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    return (data ?? []).map(toSupplierStockItemDomain);
  },

  async create(item: SupplierStockItem): Promise<SupplierStockItem> {
    const payload = toSupplierStockItemInsert(item);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem', field: 'supplier_id/stock_item_id' });
    return toSupplierStockItemDomain(data);
  },

  async update(id: string, patch: Partial<SupplierStockItem>): Promise<SupplierStockItem> {
    const payload = toSupplierStockItemUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('SupplierStockItem', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    if (!data) throw new NotFoundError('SupplierStockItem', id);

    return toSupplierStockItemDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'SupplierStockItem' });
    if (count === 0) throw new NotFoundError('SupplierStockItem', id);
  },
};