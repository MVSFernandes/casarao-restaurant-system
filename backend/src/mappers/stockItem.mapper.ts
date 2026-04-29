import { Database } from '../types/database';
import { StockItem } from '../types/domain';

type StockItemRow = Database['public']['Tables']['stock_items']['Row'];
type StockItemInsert = Database['public']['Tables']['stock_items']['Insert'];
type StockItemUpdate = Database['public']['Tables']['stock_items']['Update'];

export function toStockItemDomain(row: StockItemRow): StockItem {
  return {
    id: row.id,
    name: row.name,
    quantity: row.quantity,
    unit: row.unit,
    minQuantity: row.min_quantity,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toStockItemInsert(domain: StockItem): StockItemInsert {
  return {
    id: domain.id,
    name: domain.name,
    quantity: domain.quantity,
    unit: domain.unit,
    min_quantity: domain.minQuantity,
  };
}

export function toStockItemUpdate(patch: Partial<StockItem>): StockItemUpdate {
  const update: StockItemUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.quantity !== undefined) update.quantity = patch.quantity;
  if (patch.unit !== undefined) update.unit = patch.unit;
  if (patch.minQuantity !== undefined) update.min_quantity = patch.minQuantity;
  return update;
}