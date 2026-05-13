import { supabase } from '../lib/supabase';
import { ProductStockItem } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import { toProductStockItemDomain } from '../mappers/productStockItem.mapper';

const TABLE = 'product_stock_items';

export const productStockItemRepository = {
  async findByProduct(productId: string): Promise<ProductStockItem[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('product_id', productId);

    if (error) throw mapSupabaseError(error, { entity: 'ProductStockItem' });
    return (data ?? []).map(toProductStockItemDomain);
  },

  async replaceLinks(
    productId: string,
    links: ProductStockItem[]
  ): Promise<{ deleted: number; inserted: number }> {
    const linksPayload = links.map((link) => ({
      id: link.id,
      stock_item_id: link.stockItemId,
      quantity: link.quantity,
    }));

    const { data, error } = await supabase.rpc('replace_product_stock_links', {
      p_product_id: productId,
      p_links: linksPayload,
    });

    if (error) throw mapSupabaseError(error, { entity: 'ProductStockItem' });

    const result = data as { deleted: number; inserted: number };
    return {
      deleted: result.deleted ?? 0,
      inserted: result.inserted ?? 0,
    };
  },
};