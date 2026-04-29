import { Database } from '../types/database';
import { Category } from '../types/domain';

/**
 * Linhas brutas da tabela categories (snake_case, vem do Supabase).
 */
type CategoryRow = Database['public']['Tables']['categories']['Row'];
type CategoryInsert = Database['public']['Tables']['categories']['Insert'];
type CategoryUpdate = Database['public']['Tables']['categories']['Update'];

/**
 * Converte uma linha do banco em uma entidade de domínio.
 *
 * Usado por: repository.findById(), findAll(), findByName()
 */
export function toCategoryDomain(row: CategoryRow): Category {
  return {
    id: row.id,
    name: row.name,
    isMealCategory: row.is_meal_category,
    pricePerKg: row.price_per_kg,
    selfServicePricePerKg: row.self_service_price_per_kg,
  };
}

/**
 * Converte uma entidade de domínio em payload de INSERT.
 *
 * Usado por: repository.create()
 */
export function toCategoryInsert(domain: Category): CategoryInsert {
  return {
    id: domain.id,
    name: domain.name,
    is_meal_category: domain.isMealCategory,
    price_per_kg: domain.pricePerKg,
    self_service_price_per_kg: domain.selfServicePricePerKg,
  };
}

/**
 * Converte um patch parcial em payload de UPDATE.
 *
 * Aceita campos opcionais — só inclui no payload os que vierem definidos.
 * Usado por: repository.update()
 */
export function toCategoryUpdate(patch: Partial<Category>): CategoryUpdate {
  const update: CategoryUpdate = {};

  if (patch.name !== undefined) update.name = patch.name;
  if (patch.isMealCategory !== undefined) update.is_meal_category = patch.isMealCategory;
  if (patch.pricePerKg !== undefined) update.price_per_kg = patch.pricePerKg;
  if (patch.selfServicePricePerKg !== undefined) {
    update.self_service_price_per_kg = patch.selfServicePricePerKg;
  }

  return update;
}