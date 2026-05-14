import { Database } from '../types/database';
import { Product } from '../types/domain';

type ProductRow = Database['public']['Tables']['products']['Row'];
type ProductInsert = Database['public']['Tables']['products']['Insert'];
type ProductUpdate = Database['public']['Tables']['products']['Update'];

export function toProductDomain(row: ProductRow): Product {
  return {
    id: row.id,
    name: row.name,
    description: row.description,
    price: row.price,
    imageUrl: row.image_url,
    isByWeight: row.is_by_weight,
    categoryId: row.category_id,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toProductInsert(domain: Product): ProductInsert {
  return {
    id: domain.id,
    name: domain.name,
    description: domain.description,
    price: domain.price,
    image_url: domain.imageUrl,
    is_by_weight: domain.isByWeight,
    category_id: domain.categoryId,
  };
}

export function toProductUpdate(patch: Partial<Product>): ProductUpdate {
  const update: ProductUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.description !== undefined) update.description = patch.description;
  if (patch.price !== undefined) update.price = patch.price;
  if (patch.imageUrl !== undefined) update.image_url = patch.imageUrl;
  if (patch.isByWeight !== undefined) update.is_by_weight = patch.isByWeight;
  if (patch.categoryId !== undefined) update.category_id = patch.categoryId;
  return update;
}