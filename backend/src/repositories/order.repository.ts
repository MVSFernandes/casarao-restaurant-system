import { supabase } from '../lib/supabase';
import { Order, OrderItem, OrderStatus } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import { toOrderDomain, toOrderInsert, toOrderUpdate } from '../mappers/order.mapper';
import { toOrderItemDomain, toOrderItemInsert } from '../mappers/orderItem.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'orders';
const ITEMS_TABLE = 'order_items';

export const orderRepository = {
  async findById(id: string): Promise<Order | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    return data ? toOrderDomain(data) : null;
  },

  async findByStatus(status: OrderStatus): Promise<Order[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('status', status)
      .order('created_at', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    return (data ?? []).map(toOrderDomain);
  },

  async findBySession(sessionId: string): Promise<Order[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('cash_register_session_id', sessionId)
      .order('created_at', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    return (data ?? []).map(toOrderDomain);
  },

  async findByCustomer(customerId: string): Promise<Order[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('customer_id', customerId)
      .order('created_at', { ascending: false });

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    return (data ?? []).map(toOrderDomain);
  },

  async create(order: Order): Promise<Order> {
    const payload = toOrderInsert(order);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    return toOrderDomain(data);
  },

  async update(id: string, patch: Partial<Order>): Promise<Order> {
    const payload = toOrderUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Order', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    if (!data) throw new NotFoundError('Order', id);
    return toOrderDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Order' });
    if (count === 0) throw new NotFoundError('Order', id);
  },

  // ---- ORDER ITEMS ----

  async findItems(orderId: string): Promise<OrderItem[]> {
    const { data, error } = await supabase
      .from(ITEMS_TABLE)
      .select('*')
      .eq('order_id', orderId);

    if (error) throw mapSupabaseError(error, { entity: 'OrderItem' });
    return (data ?? []).map(toOrderItemDomain);
  },

  async addItem(item: OrderItem): Promise<OrderItem> {
    const payload = toOrderItemInsert(item);
    const { data, error } = await supabase
      .from(ITEMS_TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'OrderItem' });
    return toOrderItemDomain(data);
  },

  async removeItem(itemId: string): Promise<void> {
    const { error, count } = await supabase
      .from(ITEMS_TABLE)
      .delete({ count: 'exact' })
      .eq('id', itemId);

    if (error) throw mapSupabaseError(error, { entity: 'OrderItem' });
    if (count === 0) throw new NotFoundError('OrderItem', itemId);
  },

  /**
   * Dá baixa no estoque dos insumos do pedido via RPC atômica.
   * items = [{ stock_item_id: string, quantity: number }]
   * Chamada ao confirmar/iniciar produção do pedido.
   */
  async consumeStock(items: { product_id: string; quantity: number; weight?: number | null }[]): Promise<void> {
    const { error } = await supabase.rpc('consume_order_stock', {
      p_items: items,
    });
    if (error) throw mapSupabaseError(error, { entity: 'Order' });
  },

  /**
   * Devolve o estoque consumido pelo pedido via RPC atômica.
   * items = [{ stock_item_id: string, quantity: number }]
   * Chamada ao cancelar o pedido.
   */
  async restoreStock(items: { product_id: string; quantity: number; weight?: number | null }[]): Promise<void> {
    const { error } = await supabase.rpc('restore_order_stock', {
      p_items: items,
    });
    if (error) throw mapSupabaseError(error, { entity: 'Order' });
  },
};