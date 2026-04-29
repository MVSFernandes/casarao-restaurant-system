import { Database } from '../types/database';
import { MarmitaMenuItem } from '../types/domain';

type MarmitaRow = Database['public']['Tables']['marmita_menu_items']['Row'];
type MarmitaInsert = Database['public']['Tables']['marmita_menu_items']['Insert'];
type MarmitaUpdate = Database['public']['Tables']['marmita_menu_items']['Update'];

export function toMarmitaMenuItemDomain(row: MarmitaRow): MarmitaMenuItem {
  return {
    id: row.id,
    name: row.name,
    group: row.group,
    price: row.price,
    dayOfWeek: row.day_of_week,
    sortOrder: row.sort_order,
    isActive: row.is_active,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toMarmitaMenuItemInsert(domain: MarmitaMenuItem): MarmitaInsert {
  return {
    id: domain.id,
    name: domain.name,
    group: domain.group,
    price: domain.price,
    day_of_week: domain.dayOfWeek,
    sort_order: domain.sortOrder,
    is_active: domain.isActive,
  };
}

export function toMarmitaMenuItemUpdate(patch: Partial<MarmitaMenuItem>): MarmitaUpdate {
  const update: MarmitaUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.group !== undefined) update.group = patch.group;
  if (patch.price !== undefined) update.price = patch.price;
  if (patch.dayOfWeek !== undefined) update.day_of_week = patch.dayOfWeek;
  if (patch.sortOrder !== undefined) update.sort_order = patch.sortOrder;
  if (patch.isActive !== undefined) update.is_active = patch.isActive;
  return update;
}