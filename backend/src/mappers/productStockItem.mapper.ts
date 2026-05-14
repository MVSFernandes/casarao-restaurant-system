import { Database } from '../types/database';
import { ProductStockItem } from '../types/domain';

type PSIRow = Database['public']['Tables']['product_stock_items']['Row'];
type PSIInsert = Database['public']['Tables']['product_stock_items']['Insert'];
type PSIUpdate = Database['public']['Tables']['product_stock_items']['Update'];

export function toProductStockItemDomain(row: PSIRow): ProductStockItem {
  return {
    id: row.id,
    productId: row.product_id,
    stockItemId: row.stock_item_id,
    quantity: row.quantity,
  };
}

export function toProductStockItemInsert(domain: ProductStockItem): PSIInsert {
  return {
    id: domain.id,
    product_id: domain.productId,
    stock_item_id: domain.stockItemId,
    quantity: domain.quantity,
  };
}

export function toProductStockItemUpdate(patch: Partial<ProductStockItem>): PSIUpdate {
  const update: PSIUpdate = {};
  if (patch.productId !== undefined) update.product_id = patch.productId;
  if (patch.stockItemId !== undefined) update.stock_item_id = patch.stockItemId;
  if (patch.quantity !== undefined) update.quantity = patch.quantity;
  return update;
}