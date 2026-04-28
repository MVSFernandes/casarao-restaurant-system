import { Router } from 'express';
import bcrypt from 'bcrypt';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import { prisma } from '../lib/prisma';

const router = Router();

router.use(authenticate);

router.get('/', authorize('ADMIN'), async (req, res) => {
  try {
    const { role, search } = req.query;

    const users = await prisma.user.findMany({
      where: {
        ...(role ? { role: String(role) } : {}),
        ...(search
          ? {
              OR: [
                { name: { contains: String(search) } },
                { email: { contains: String(search) } },
              ],
            }
          : {}),
      },
      select: { id: true, name: true, email: true, role: true, createdAt: true, updatedAt: true },
      orderBy: { name: 'asc' },
    });

    res.json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar usuários' });
  }
});

router.post('/', authorize('ADMIN'), async (req, res) => {
  try {
    const { name, email, password, role } = req.body;

    if (!name || !email || !password || !role) {
      return res.status(400).json({ message: 'Nome, email, senha e perfil são obrigatórios' });
    }

    if (!['WAITER', 'CASHIER', 'FINANCE', 'ADMIN'].includes(role)) {
      return res.status(400).json({ message: 'Perfil inválido' });
    }

    const existingUser = await prisma.user.findUnique({ where: { email } });
    if (existingUser) {
      return res.status(409).json({ message: 'Já existe um usuário com este email' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = await prisma.user.create({
      data: {
        name,
        email,
        password: hashedPassword,
        role,
      },
      select: { id: true, name: true, email: true, role: true, createdAt: true, updatedAt: true },
    });

    res.status(201).json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar usuário' });
  }
});

router.put('/:id', authorize('ADMIN'), async (req, res) => {
  try {
    const { id } = req.params;
    const { name, email, password, role } = req.body;

    if (!name || !email || !role) {
      return res.status(400).json({ message: 'Nome, email e perfil são obrigatórios' });
    }

    if (!['WAITER', 'CASHIER', 'FINANCE', 'ADMIN'].includes(role)) {
      return res.status(400).json({ message: 'Perfil inválido' });
    }

    const existingUser = await prisma.user.findFirst({
      where: {
        email,
        NOT: { id },
      },
    });

    if (existingUser) {
      return res.status(409).json({ message: 'Já existe um usuário com este email' });
    }

    const data: { name: string; email: string; role: string; password?: string } = { name, email, role };

    if (password && String(password).trim().length > 0) {
      if (String(password).trim().length < 4) {
        return res.status(400).json({ message: 'A senha deve ter no mínimo 4 caracteres' });
      }
      data.password = await bcrypt.hash(String(password), 10);
    }

    const user = await prisma.user.update({
      where: { id },
      data,
      select: { id: true, name: true, email: true, role: true, createdAt: true, updatedAt: true },
    });

    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar usuário' });
  }
});

router.delete('/:id', authorize('ADMIN'), async (req, res) => {
  try {
    const { id } = req.params;

    const userWithRelations = await prisma.user.findUnique({
      where: { id },
      include: {
        orders: { select: { id: true }, take: 1 },
        waiterOrders: { select: { id: true }, take: 1 },
        auditLogs: { select: { id: true }, take: 1 },
      },
    });

    if (!userWithRelations) {
      return res.status(404).json({ message: 'Usuário não encontrado' });
    }

    const hasLinkedRecords =
      userWithRelations.orders.length > 0 ||
      userWithRelations.waiterOrders.length > 0 ||
      userWithRelations.auditLogs.length > 0;

    if (hasLinkedRecords) {
      return res.status(400).json({
        message: 'Este usuário já possui histórico no sistema e não pode ser excluído. Edite o cadastro em vez de excluir.',
      });
    }

    await prisma.user.delete({ where: { id } });

    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir usuário' });
  }
});

export default router;
