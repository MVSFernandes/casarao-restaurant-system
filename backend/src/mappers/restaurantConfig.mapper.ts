import { Database } from '../types/database';
import { RestaurantConfig } from '../types/domain';

type ConfigRow = Database['public']['Tables']['restaurant_config']['Row'];
type ConfigInsert = Database['public']['Tables']['restaurant_config']['Insert'];
type ConfigUpdate = Database['public']['Tables']['restaurant_config']['Update'];

export function toRestaurantConfigDomain(row: ConfigRow): RestaurantConfig {
  return {
    id: row.id,
    name: row.name,
    address: row.address,
    phone: row.phone,
    logoUrl: row.logo_url,
    bannerUrl: row.banner_url,
    openingHours: row.opening_hours,
    openingDays: row.opening_days,
    deliveryFee: row.delivery_fee,
    urbanDeliveryFee: row.urban_delivery_fee,
    ruralDeliveryFee: row.rural_delivery_fee,
    enabledPayments: row.enabled_payments,
    updatedAt: new Date(row.updated_at),
  };
}

export function toRestaurantConfigInsert(domain: RestaurantConfig): ConfigInsert {
  return {
    id: domain.id,
    name: domain.name,
    address: domain.address,
    phone: domain.phone,
    logo_url: domain.logoUrl,
    banner_url: domain.bannerUrl,
    opening_hours: domain.openingHours,
    opening_days: domain.openingDays,
    delivery_fee: domain.deliveryFee,
    urban_delivery_fee: domain.urbanDeliveryFee,
    rural_delivery_fee: domain.ruralDeliveryFee,
    enabled_payments: domain.enabledPayments,
  };
}

export function toRestaurantConfigUpdate(patch: Partial<RestaurantConfig>): ConfigUpdate {
  const update: ConfigUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.address !== undefined) update.address = patch.address;
  if (patch.phone !== undefined) update.phone = patch.phone;
  if (patch.logoUrl !== undefined) update.logo_url = patch.logoUrl;
  if (patch.bannerUrl !== undefined) update.banner_url = patch.bannerUrl;
  if (patch.openingHours !== undefined) update.opening_hours = patch.openingHours;
  if (patch.openingDays !== undefined) update.opening_days = patch.openingDays;
  if (patch.deliveryFee !== undefined) update.delivery_fee = patch.deliveryFee;
  if (patch.urbanDeliveryFee !== undefined) update.urban_delivery_fee = patch.urbanDeliveryFee;
  if (patch.ruralDeliveryFee !== undefined) update.rural_delivery_fee = patch.ruralDeliveryFee;
  if (patch.enabledPayments !== undefined) update.enabled_payments = patch.enabledPayments;
  return update;
}