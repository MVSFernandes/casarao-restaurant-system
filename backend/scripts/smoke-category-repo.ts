/**
 * Smoke test do categoryRepository.
 *
 * Testa CRUD completo + caminhos negativos.
 *
 * Como rodar:
 *   npm run smoke:category
 *
 * Esperado: todos os 9 testes passando, sem categorias residuais no banco.
 */

import { categoryRepository } from '../src/repositories/category.repository';
import { NotFoundError } from '../src/types/errors';
import { Category } from '../src/types/domain';

const TEST_ID = 'cat_test_smoke_001';
const TEST_ID_INEXISTENT = 'cat_does_not_exist_999';

let stepsPassed = 0;
let stepsFailed = 0;

function step(label: string, ok: boolean, detail?: string) {
  if (ok) {
    console.log(`✅ [${++stepsPassed + stepsFailed}] ${label}`);
    if (detail) console.log(`     ${detail}`);
  } else {
    console.error(`❌ [${stepsPassed + ++stepsFailed}] ${label}`);
    if (detail) console.error(`     ${detail}`);
  }
}

async function main() {
  console.log('--- Category Repository Smoke Test ---\n');

  // Limpa qualquer resíduo de testes anteriores
  try {
    await categoryRepository.delete(TEST_ID);
  } catch {
    // Ignora se não existir (caminho normal)
  }

  // 1. CREATE
  const newCategory: Category = {
    id: TEST_ID,
    name: 'Test Smoke Category',
    isMealCategory: false,
    pricePerKg: null,
    selfServicePricePerKg: null,
  };

  const created = await categoryRepository.create(newCategory);
  step(
    'CREATE: criou categoria com ID retornado',
    created.id === TEST_ID && created.name === 'Test Smoke Category',
    `id=${created.id}, name="${created.name}"`
  );

  // 2. READ
  const found = await categoryRepository.findById(TEST_ID);
  step(
    'READ: findById retornou a categoria criada',
    found !== null && found.id === TEST_ID,
    `name="${found?.name}", isMealCategory=${found?.isMealCategory}`
  );

  // 3. LIST
  const all = await categoryRepository.findAll();
  const inList = all.some((c) => c.id === TEST_ID);
  step(
    'LIST: findAll inclui a categoria criada',
    inList,
    `total=${all.length} categorias`
  );

  // 4. UPDATE
  const updated = await categoryRepository.update(TEST_ID, {
    name: 'Test Smoke RENAMED',
    pricePerKg: 49.9,
  });
  step(
    'UPDATE: nome e pricePerKg alterados',
    updated.name === 'Test Smoke RENAMED' && updated.pricePerKg === 49.9,
    `name="${updated.name}", pricePerKg=${updated.pricePerKg}`
  );

  // 5. DELETE
  await categoryRepository.delete(TEST_ID);
  step('DELETE: deletou sem lançar erro', true);

  // 6. CONFIRM
  const afterDelete = await categoryRepository.findById(TEST_ID);
  step(
    'CONFIRM: findById retorna null após delete',
    afterDelete === null,
    `result=${afterDelete}`
  );

  // 7. NOT FOUND (READ)
  const inexistent = await categoryRepository.findById(TEST_ID_INEXISTENT);
  step(
    'NOT FOUND: findById retorna null para ID inexistente',
    inexistent === null,
    `result=${inexistent}`
  );

  // 8. NOT FOUND (UPDATE)
  let updateThrewNotFound = false;
  try {
    await categoryRepository.update(TEST_ID_INEXISTENT, { name: 'Foo' });
  } catch (err) {
    updateThrewNotFound = err instanceof NotFoundError;
  }
  step(
    'NOT FOUND: update lança NotFoundError para ID inexistente',
    updateThrewNotFound
  );

  // 9. NOT FOUND (DELETE)
  let deleteThrewNotFound = false;
  try {
    await categoryRepository.delete(TEST_ID_INEXISTENT);
  } catch (err) {
    deleteThrewNotFound = err instanceof NotFoundError;
  }
  step(
    'NOT FOUND: delete lança NotFoundError para ID inexistente',
    deleteThrewNotFound
  );

  // ----- RESULTADO FINAL -----
  console.log('\n--- Summary ---');
  console.log(`✅ Passed: ${stepsPassed}`);
  console.log(`❌ Failed: ${stepsFailed}`);

  if (stepsFailed > 0) {
    console.error('\n💥 Some tests failed!\n');
    process.exit(1);
  } else {
    console.log('\n🎉 All tests passed!\n');
    process.exit(0);
  }
}

main().catch((err) => {
  console.error('\n💥 Unexpected error:', err);
  process.exit(1);
});