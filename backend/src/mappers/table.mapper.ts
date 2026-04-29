import { Database } from '../types/database';
import { Table, TableStatus } from '../types/domain';

type TableRow = Database['public']['Tables']['tables']['Row'];
type TableInsert = Database['public']['Tables']['tables']['Insert'];
type TableUpdate = Database['public']['Tables']['tables']['Update'];

export function toTableDomain(row: TableRow): Table {
  return {
    id: row.id,
    number: row.number,
    status: row.status as TableStatus,
  };
}

export function toTableInsert(domain: Table): TableInsert {
  return {
    id: domain.id,
    number: domain.number,
    status: domain.status,
  };
}

export function toTableUpdate(patch: Partial<Table>): TableUpdate {
  const update: TableUpdate = {};
  if (patch.number !== undefined) update.number = patch.number;
  if (patch.status !== undefined) update.status = patch.status;
  return update;
}