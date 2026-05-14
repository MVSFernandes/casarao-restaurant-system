import { supabase } from '../lib/supabase';
import { AuditLog } from '../types/domain';
import { mapSupabaseError } from '../middlewares/errorHandler.middleware';
import { toAuditLogDomain, toAuditLogInsert } from '../mappers/auditLog.mapper';

const TABLE = 'audit_logs';

export const auditLogRepository = {
  /**
   * Registra uma ação no audit log.
   * Deve ser chamado pelos Services após operações críticas.
   * Nunca lança erro para o caller — falha silenciosa (não pode
   * bloquear a operação principal por falha de log).
   */
  async log(entry: AuditLog): Promise<void> {
    const payload = toAuditLogInsert(entry);
    const { error } = await supabase.from(TABLE).insert(payload);
    if (error) {
      // Log silencioso: não propaga erro pro caller
      console.error('[auditLog] Failed to write audit entry:', error.message, entry);
    }
  },

  async findByEntity(entity: string, entityId: string): Promise<AuditLog[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('entity', entity)
      .eq('entity_id', entityId)
      .order('created_at', { ascending: false });

    if (error) throw mapSupabaseError(error, { entity: 'AuditLog' });
    return (data ?? []).map(toAuditLogDomain);
  },

  async findByUser(userId: string, limit = 50): Promise<AuditLog[]> {
    const { data, error } = await supabase
      .from(TABLE)
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false })
      .limit(limit);

    if (error) throw mapSupabaseError(error, { entity: 'AuditLog' });
    return (data ?? []).map(toAuditLogDomain);
  },
};