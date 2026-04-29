import { createClient, SupabaseClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';

dotenv.config();

/**
 * Client singleton do Supabase.
 *
 * Usa SERVICE_ROLE_KEY (não a anon/publishable), pois este é o backend.
 * Isso bypassa Row Level Security (RLS) — a autorização continua sendo
 * feita no middleware Express (auth.middleware.ts + authorize(role)).
 *
 * NUNCA expor SERVICE_ROLE_KEY em código frontend ou logs públicos.
 */

const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!SUPABASE_URL) {
  throw new Error(
    'SUPABASE_URL is not defined. Please add it to backend/.env'
  );
}

if (!SUPABASE_SERVICE_ROLE_KEY) {
  throw new Error(
    'SUPABASE_SERVICE_ROLE_KEY is not defined. Please add it to backend/.env'
  );
}

const globalForSupabase = globalThis as unknown as {
  supabase: SupabaseClient | undefined;
};

export const supabase: SupabaseClient =
  globalForSupabase.supabase ??
  createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
    auth: {
      persistSession: false,
      autoRefreshToken: false,
    },
    db: {
      schema: 'public',
    },
  });

if (process.env.NODE_ENV !== 'production') {
  globalForSupabase.supabase = supabase;
}   