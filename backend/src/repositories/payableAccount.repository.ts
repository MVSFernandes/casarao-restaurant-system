import { supabase } from '../lib/supabase';
import { PayableAccount } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toPayableAccountDomain,
  toPayableAccountInsert,
  toPayableAccountUpdate,
} from '../mappers/payableAccount.mapper';
import { NotFoundError } from '../types/errors';

const TABLE = 'payable_accounts';

export const payableAccountRepository = {
  async findAll(): Promise<PayableAccount[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .order('due_date', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    return (data ?? []).map(toPayableAccountDomain);
  },

  async findById(id: string): Promise<PayableAccount | null> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    return data ? toPayableAccountDomain(data) : null;
  },

  /**
   * Lista contas em aberto (não pagas), ordenadas pela data de vencimento.
   */
  async findUnpaid(): Promise<PayableAccount[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('paid', false)
      .order('due_date', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    return (data ?? []).map(toPayableAccountDomain);
  },

  /**
   * Lista contas vencidas (não pagas + due_date < hoje).
   */
  async findOverdue(): Promise<PayableAccount[]> {
    const today = new Date().toISOString();
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('paid', false)
      .lt('due_date', today)
      .order('due_date', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    return (data ?? []).map(toPayableAccountDomain);
  },

  /**
   * Marca uma conta como paga, registrando paid_at = agora.
   */
  async markAsPaid(id: string): Promise<PayableAccount> {
    const { data, error } = await supabase
      .from(TABLE)
      .update({
        paid: true,
        paid_at: new Date().toISOString(),
      })
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    if (!data) throw new NotFoundError('PayableAccount', id);

    return toPayableAccountDomain(data);
  },

  async create(account: PayableAccount): Promise<PayableAccount> {
    const payload = toPayableAccountInsert(account);
    const { data, error } = await supabase
      .from(TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    return toPayableAccountDomain(data);
  },

  async update(id: string, patch: Partial<PayableAccount>): Promise<PayableAccount> {
    const payload = toPayableAccountUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findById(id);
      if (!current) throw new NotFoundError('PayableAccount', id);
      return current;
    }

    const { data, error } = await supabase
      .from(TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    if (!data) throw new NotFoundError('PayableAccount', id);

    return toPayableAccountDomain(data);
  },

  async delete(id: string): Promise<void> {
    const { error, count } = await supabase
      .from(TABLE)
      .delete({ count: 'exact' })
      .eq('id', id);

    if (error) throw mapSupabaseError(error, { entity: 'PayableAccount' });
    if (count === 0) throw new NotFoundError('PayableAccount', id);
  },
};