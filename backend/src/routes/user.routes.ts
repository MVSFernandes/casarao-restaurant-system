import { Router } from 'express';
import bcrypt from 'bcrypt';
import { authenticate, authorize } from '../middlewares/auth.middleware';
import { userRepository } from '../repositories/user.repository';
import { createId } from '@paralleldrive/cuid2';

const router = Router();

router.use(authenticate);

router.get('/', authorize('ADMIN'), async (req, res) => {
  try {
    const { role, search } = req.query;

    let users = await userRepository.findAll();

    if (role) {
      users = users.filter((u) => u.role === String(role));
    }

    if (search) {
      const q = String(search).toLowerCase();
      users = users.filter(
        (u) => u.name.toLowerCase().includes(q) || u.email.toLowerCase().includes(q)
      );
    }

    // Remove senha da resposta
    const safe = users.map(({ password: _, ...u }) => u);
    res.json(safe);
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

    const existing = await userRepository.findByEmail(email);
    if (existing) {
      return res.status(409).json({ message: 'Já existe um usuário com este email' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const user = await userRepository.create({
      id: createId(),
      name,
      email,
      password: hashedPassword,
      role,
      createdAt: new Date(),
      updatedAt: new Date(),
    });

    const { password: _, ...safe } = user;
    res.status(201).json(safe);
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

    // Verifica duplicidade de email
    const existing = await userRepository.findByEmail(email);
    if (existing && existing.id !== id) {
      return res.status(409).json({ message: 'Já existe um usuário com este email' });
    }

    const patch: { name: string; email: string; role: string; password?: string } = {
      name, email, role,
    };
    const typedPatch = patch as any;

    if (password && String(password).trim().length > 0) {
      if (String(password).trim().length < 4) {
        return res.status(400).json({ message: 'A senha deve ter no mínimo 4 caracteres' });
      }
      patch.password = await bcrypt.hash(String(password), 10);
    }

    const user = await userRepository.update(id, typedPatch);
    const { password: _, ...safe } = user;
    res.json(safe);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar usuário' });
  }
});

router.delete('/:id', authorize('ADMIN'), async (req, res) => {
  try {
    const { id } = req.params;

    const user = await userRepository.findById(id);
    if (!user) {
      return res.status(404).json({ message: 'Usuário não encontrado' });
    }

    // Verifica se tem pedidos vinculados
    const { supabase } = await import('../lib/supabase');
    const { count: orderCount } = await supabase
      .from('orders')
      .select('id', { count: 'exact', head: true })
      .or(`user_id.eq.${id},waiter_id.eq.${id}`);

    if (orderCount && orderCount > 0) {
      return res.status(400).json({
        message: 'Este usuário já possui histórico no sistema e não pode ser excluído. Edite o cadastro em vez de excluir.',
      });
    }

    await userRepository.delete(id);
    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir usuário' });
  }
});

export default router;