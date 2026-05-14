import { Database } from '../types/database';
import { AuditLog } from '../types/domain';

type AuditLogRow = Database['public']['Tables']['audit_logs']['Row'];
type AuditLogInsert = Database['public']['Tables']['audit_logs']['Insert'];

export function toAuditLogDomain(row: AuditLogRow): AuditLog {
  return {
    id: row.id,
    userId: row.user_id,
    action: row.action,
    entity: row.entity,
    entityId: row.entity_id,
    details: row.details,
    createdAt: new Date(row.created_at),
  };
}

export function toAuditLogInsert(domain: AuditLog): AuditLogInsert {
  return {
    id: domain.id,
    user_id: domain.userId,
    action: domain.action,
    entity: domain.entity,
    entity_id: domain.entityId,
    details: domain.details,
  };
}
// Sem toUpdate — audit logs são imutáveis por definição