import { Database } from '../types/database';
import { User, UserRole } from '../types/domain';

type UserRow = Database['public']['Tables']['users']['Row'];
type UserInsert = Database['public']['Tables']['users']['Insert'];
type UserUpdate = Database['public']['Tables']['users']['Update'];

export function toUserDomain(row: UserRow): User {
  return {
    id: row.id,
    name: row.name,
    email: row.email,
    password: row.password,
    role: row.role as UserRole,
    createdAt: new Date(row.created_at),
    updatedAt: new Date(row.updated_at),
  };
}

export function toUserInsert(domain: User): UserInsert {
  return {
    id: domain.id,
    name: domain.name,
    email: domain.email,
    password: domain.password,
    role: domain.role,
  };
}

export function toUserUpdate(patch: Partial<User>): UserUpdate {
  const update: UserUpdate = {};
  if (patch.name !== undefined) update.name = patch.name;
  if (patch.email !== undefined) update.email = patch.email;
  if (patch.password !== undefined) update.password = patch.password;
  if (patch.role !== undefined) update.role = patch.role;
  return update;
}