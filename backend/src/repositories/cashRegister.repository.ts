import { supabase } from '../lib/supabase';
import { CashRegisterSession, CashWithdrawal } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import {
  toCashRegisterSessionDomain,
  toCashRegisterSessionInsert,
  toCashRegisterSessionUpdate,
  toCashWithdrawalDomain,
  toCashWithdrawalInsert,
} from '../mappers/cashRegister.mapper';
import { NotFoundError } from '../types/errors';

const SESSION_TABLE = 'cash_register_sessions';
const WITHDRAWAL_TABLE = 'cash_withdrawals';

export const cashRegisterRepository = {
  // ---- SESSIONS ----

  async findSessionById(id: string): Promise<CashRegisterSession | null> {
    const { data, error } = await supabase
      .from(SESSION_TABLE)
      .select('*')
      .eq('id', id)
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'CashRegisterSession' });
    return data ? toCashRegisterSessionDomain(data) : null;
  },

  /**
   * Retorna a sessão de caixa OPEN, se houver.
   * O sistema só permite uma sessão aberta por vez (garantido por CHECK no banco).
   */
  async findOpenSession(): Promise<CashRegisterSession | null> {
    const { data, error } = await supabase
      .from(SESSION_TABLE)
      .select('*')
      .eq('status', 'OPEN')
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'CashRegisterSession' });
    return data ? toCashRegisterSessionDomain(data) : null;
  },

  async findRecentSessions(limit = 10): Promise<CashRegisterSession[]> {
    const { data, error } = await supabase
      .from(SESSION_TABLE)
      .select('*')
      .order('opened_at', { ascending: false })
      .limit(limit);

    if (error) throw mapSupabaseError(error, { entity: 'CashRegisterSession' });
    return (data ?? []).map(toCashRegisterSessionDomain);
  },

  async openSession(session: CashRegisterSession): Promise<CashRegisterSession> {
    const payload = toCashRegisterSessionInsert(session);
    const { data, error } = await supabase
      .from(SESSION_TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'CashRegisterSession' });
    return toCashRegisterSessionDomain(data);
  },

  async updateSession(
    id: string,
    patch: Partial<CashRegisterSession>
  ): Promise<CashRegisterSession> {
    const payload = toCashRegisterSessionUpdate(patch);

    if (Object.keys(payload).length === 0) {
      const current = await this.findSessionById(id);
      if (!current) throw new NotFoundError('CashRegisterSession', id);
      return current;
    }

    const { data, error } = await supabase
      .from(SESSION_TABLE)
      .update(payload)
      .eq('id', id)
      .select()
      .maybeSingle();

    if (error) throw mapSupabaseError(error, { entity: 'CashRegisterSession' });
    if (!data) throw new NotFoundError('CashRegisterSession', id);
    return toCashRegisterSessionDomain(data);
  },

  // ---- WITHDRAWALS ----

  async findWithdrawalsBySession(sessionId: string): Promise<CashWithdrawal[]> {
    const { data, error } = await supabase
      .from(WITHDRAWAL_TABLE)
      .select('*')
      .eq('session_id', sessionId)
      .order('created_at', { ascending: true });

    if (error) throw mapSupabaseError(error, { entity: 'CashWithdrawal' });
    return (data ?? []).map(toCashWithdrawalDomain);
  },

  async addWithdrawal(withdrawal: CashWithdrawal): Promise<CashWithdrawal> {
    const payload = toCashWithdrawalInsert(withdrawal);
    const { data, error } = await supabase
      .from(WITHDRAWAL_TABLE)
      .insert(payload)
      .select()
      .single();

    if (error) throw mapSupabaseError(error, { entity: 'CashWithdrawal' });
    return toCashWithdrawalDomain(data);
  },
};