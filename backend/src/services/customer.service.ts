import { supabase } from '../lib/supabase';
import { Customer } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toCustomerDomain,
  toCustomerInsert,
  toCustomerUpdate,
} from '../mappers/customer.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'customers';

export const customerRepository = {
  async findAll(): Promise<Customer[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('name', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    return (data ?? []).map(toCustomerDomain);
  },

  async findById(id: string): Promise<Customer | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    return data ? toCustomerDomain(data) : null;
  },

  /**
   * Busca cliente por nome (case-insensitive, partial match).
   * Usa o índice GIN trigram (idx_customers_name_trgm) para performance.
   *
   * Ex: searchByName('jão') retorna 'João Silva', 'Jãozinho', etc.
   */
  async searchByName(query: string): Promise<Customer[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .ilike('name', `%${query}%`)
      .order('name', { ascending: true })
      .limit(50);

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    return (data ?? []).map(toCustomerDomain);
  },

  /**
   * Lista clientes que têm dívida ativa (credit_used > 0).
   * Útil pra tela de "Fiados em aberto" no painel admin.
   */
  async findWithCreditDebt(): Promise<Customer[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .gt('credit_used', 0)
      .order('credit_used', { ascending: false });

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    return (data ?? []).map(toCustomerDomain);
  },

  /**
   * Busca cliente pelo telefone (usado em pedidos públicos do cardápio online).
   * Retorna null se não encontrar (não lança erro).
   */
  async findByPhone(phone: string): Promise<Customer | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('phone', phone)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    return data ? toCustomerDomain(data) : null;
  },

  async create(customer: Customer): Promise<Customer> {
    const payload = toCustomerInsert(customer);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'Customer', field: 'name' });
    return toCustomerDomain(data);
  },

  async update(id: string, patch: Partial<Customer>): Promise<Customer> {
    const payload = toCustomerUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('Customer', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    if (!data) throw new NotFoundError('Customer', id);

    return toCustomerDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'Customer' });
    if (count === 0) throw new NotFoundError('Customer', id);
  },
};