import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcrypt';

const prisma = new PrismaClient();

async function main() {
  console.log('Start seeding ...');

  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash('admin123', salt);

  // Create default admin user
  const admin = await prisma.user.upsert({
    where: { email: 'admin@admin.com' },
    update: {},
    create: {
      email: 'admin@admin.com',
      name: 'Admin',
      password: hashedPassword,
      role: 'ADMIN',
    },
  });

  console.log(`Created admin user: ${admin.email}`);

  // Create a default restaurant configuration
  const config = await prisma.restaurantConfig.upsert({
      where: { id: '1' }, // Use a fixed ID for easy retrieval
      update: {},
      create: {
          id: '1',
          name: 'My Awesome Restaurant',
          address: '123 Main Street, Anytown',
          phone: '555-1234',
          openingHours: '18:00-23:00',
          openingDays: 'Tuesday-Sunday',
          enabledPayments: JSON.stringify(['CASH', 'CREDIT_CARD', 'DEBIT_CARD', 'PIX'])
      }
  })

  console.log(`Created restaurant config: ${config.name}`);

  // Create some tables
  for (let i = 1; i <= 10; i++) {
    await prisma.table.upsert({
        where: { number: i },
        update: {},
        create: { number: i }
    });
  }

  console.log('Created 10 tables');


  console.log('Seeding finished.');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

