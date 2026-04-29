/**
 * Smoke test do setup Supabase.
 *
 * Roda fora do servidor Express (não usa app.ts).
 * Valida:
 *   1. .env está sendo lido (URL e SERVICE_ROLE_KEY)
 *   2. Client Supabase autentica
 *   3. Consulta básica funciona (lê o admin do banco)
 *
 * Como rodar:
 *   npx ts-node smoke-supabase.ts
 *
 * Esperado:
 *   ✅ Connected to Supabase
 *   ✅ Found admin: { id: 'admin_seed_user_001', name: 'Jessica', ... }
 */

import { supabase } from '../src/lib/supabase';

async function main() {
  console.log('--- Supabase Smoke Test ---');

  // 1. Lê o admin Jessica que cadastramos na Onda 2
  console.log('\n[1/2] Querying admin user...');
  const { data: admin, error: adminError } = await supabase
    .from('users')
    .select('id, name, email, role, created_at, updated_at')
    .eq('id', 'admin_seed_user_001')
    .single();

  if (adminError) {
    console.error('❌ Failed to fetch admin:', adminError.message);
    console.error('   Code:', adminError.code);
    console.error('   Details:', adminError.details);
    process.exit(1);
  }

  if (!admin) {
    console.error('❌ Admin not found (expected id=admin_seed_user_001)');
    process.exit(1);
  }

  console.log('✅ Admin found:');
  console.log('   id:        ', admin.id);
  console.log('   name:      ', admin.name);
  console.log('   email:     ', admin.email);
  console.log('   role:      ', admin.role);
  console.log('   created_at:', admin.created_at);
  console.log('   updated_at:', admin.updated_at);

  // 2. Lê a config do restaurante
  console.log('\n[2/2] Querying restaurant config...');
  const { data: config, error: configError } = await supabase
    .from('restaurant_config')
    .select('id, name, enabled_payments')
    .single();

  if (configError) {
    console.error('❌ Failed to fetch config:', configError.message);
    process.exit(1);
  }

  console.log('✅ Restaurant config found:');
  console.log('   id:               ', config.id);
  console.log('   name:             ', config.name);
  console.log('   enabled_payments: ', config.enabled_payments);

  console.log('\n🎉 All smoke tests passed!');
  console.log('Supabase connection is working correctly.\n');

  process.exit(0);
}

main().catch((err) => {
  console.error('\n💥 Unexpected error:', err);
  process.exit(1);
});