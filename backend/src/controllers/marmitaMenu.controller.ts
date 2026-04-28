import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

const getBrazilWeekDay = () => {
  const day = new Intl.DateTimeFormat('en-US', {
    weekday: 'short',
    timeZone: 'America/Sao_Paulo',
  }).format(new Date());

  const map: Record<string, number> = {
    Sun: 0,
    Mon: 1,
    Tue: 2,
    Wed: 3,
    Thu: 4,
    Fri: 5,
    Sat: 6,
  };

  return map[day] ?? 1;
};

export const getTodayMarmitaMenu = async (_req: Request, res: Response) => {
  try {
    const jsDay = getBrazilWeekDay(); // 0=Dom, 1=Seg, ..., 6=Sáb

    let targetDay = jsDay;

    // Domingo usa sábado
    if (jsDay === 0) {
      targetDay = 6;
    }

    let items = await prisma.marmitaMenuItem.findMany({
      where: {
        dayOfWeek: targetDay,
        isActive: true,
      },
      orderBy: [{ group: 'asc' }, { sortOrder: 'asc' }, { name: 'asc' }],
    });

    // Se não tiver no dia atual, tenta sábado
    if (items.length === 0 && targetDay !== 6) {
      items = await prisma.marmitaMenuItem.findMany({
        where: {
          dayOfWeek: 6,
          isActive: true,
        },
        orderBy: [{ group: 'asc' }, { sortOrder: 'asc' }, { name: 'asc' }],
      });
    }

    // Se ainda não tiver, tenta segunda
    if (items.length === 0) {
      items = await prisma.marmitaMenuItem.findMany({
        where: {
          dayOfWeek: 1,
          isActive: true,
        },
        orderBy: [{ group: 'asc' }, { sortOrder: 'asc' }, { name: 'asc' }],
      });
    }

    res.json(items);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar cardápio da marmita de hoje.' });
  }
};

export const getMarmitaMenuByDay = async (req: Request, res: Response) => {
  try {
    const dayOfWeek = Number(req.params.dayOfWeek);

    const items = await prisma.marmitaMenuItem.findMany({
      where: {
        dayOfWeek,
        isActive: true,
      },
      orderBy: [{ group: 'asc' }, { sortOrder: 'asc' }, { name: 'asc' }],
    });

    res.json(items);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao buscar cardápio da marmita.' });
  }
};

export const createMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    const { dayOfWeek, name, group, price, sortOrder } = req.body;

    const item = await prisma.marmitaMenuItem.create({
      data: {
        dayOfWeek: Number(dayOfWeek),
        name,
        group,
        price: Number(price || 0),
        sortOrder: Number(sortOrder || 0),
      },
    });

    res.status(201).json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar item da marmita.' });
  }
};

export const updateMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { dayOfWeek, name, group, price, isActive, sortOrder } = req.body;

    const item = await prisma.marmitaMenuItem.update({
      where: { id },
      data: {
        dayOfWeek: dayOfWeek !== undefined ? Number(dayOfWeek) : undefined,
        name,
        group,
        price: price !== undefined ? Number(price) : undefined,
        isActive,
        sortOrder: sortOrder !== undefined ? Number(sortOrder) : undefined,
      },
    });

    res.json(item);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao atualizar item da marmita.' });
  }
};

export const deleteMarmitaMenuItem = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    await prisma.marmitaMenuItem.delete({
      where: { id },
    });

    res.status(204).send();
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao excluir item da marmita.' });
  }
};