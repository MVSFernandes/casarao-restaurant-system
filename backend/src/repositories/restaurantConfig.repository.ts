import { supabase } from '../lib/supabase';
import { RestaurantConfig } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toRestaurantConfigDomain,
  toRestaurantConfigUpdate,
} from '../mappers/restaurantConfig.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'restaurant_config';

export const restaurantConfigRepository = {
  /**
   * Retorna a única instância de config (singleton).
   * Lança NotFoundError se ainda não foi criada.
   */
  async get(): Promise<RestaurantConfig> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'RestaurantConfig' });
    if (!data) throw new NotFoundError('RestaurantConfig');

    return toRestaurantConfigDomain(data);
  },

  /**
   * Atualiza a config (singleton).
   * Recebe o ID explicitamente para evitar updates acidentais sem WHERE.
   */
  async update(id: string, patch: Partial<RestaurantConfig>): Promise<RestaurantConfig> {
    const payload = toRestaurantConfigUpdate(patch);

    if (Object.keys(payload).length === 0) {
      return this.get();
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'RestaurantConfig' });
    if (!data) throw new NotFoundError('RestaurantConfig', id);

    return toRestaurantConfigDomain(data);
  },
};