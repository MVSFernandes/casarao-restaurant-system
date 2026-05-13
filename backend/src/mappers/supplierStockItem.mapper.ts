import { Database } from '../types/database';
import { SupplierStockItem } from '../types/domain';

type SSIRow = Database['public']['Tables']['supplier_stock_items']['Row'];
type SSIInsert = Database['public']['Tables']['supplier_stock_items']['Insert'];
type SSIUpdate = Database['public']['Tables']['supplier_stock_items']['Update'];

export function toSupplierStockItemDomain(row: SSIRow): SupplierStockItem {
  return {
    id: row.id,
    supplierId: row.supplier_id,
    stockItemId: row.stock_item_id,
    price: row.price,
    updatedAt: new Date(row.updated_at),
  };
}

export function toSupplierStockItemInsert(domain: SupplierStockItem): SSIInsert {
  return {
    id: domain.id,
    supplier_id: domain.supplierId,
    stock_item_id: domain.stockItemId,
    price: domain.price,
  };
}

export function toSupplierStockItemUpdate(patch: Partial<SupplierStockItem>): SSIUpdate {
  const update: SSIUpdate = {};
  if (patch.supplierId !== undefined) update.supplier_id = patch.supplierId;
  if (patch.stockItemId !== undefined) update.stock_item_id = patch.stockItemId;
  if (patch.price !== undefined) update.price = patch.price;
  // updated_at é setado automaticamente pelo trigger trg_supplier_stock_items_updated_at
  return update;
}