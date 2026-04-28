import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';

export const getConfig = async (req: Request, res: Response) => {
  try {
    let config = await prisma.restaurantConfig.findFirst();
    if (!config) {
      config = await prisma.restaurantConfig.create({
        data: { name: 'Meu Restaurante' }
      });
    }
    res.json(config);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao buscar configuracoes' });
  }
};

export const updateConfig = async (req: Request, res: Response) => {
  try {
    const { name, logoUrl, bannerUrl, address, phone, openingHours, openingDays, deliveryFee, urbanDeliveryFee, ruralDeliveryFee } = req.body;

    let config = await prisma.restaurantConfig.findFirst();
    if (!config) {
      config = await prisma.restaurantConfig.create({
        data: { name: name || 'Meu Restaurante' }
      });
    }

    const updated = await prisma.restaurantConfig.update({
      where: { id: config.id },
      data: {
        name,
        logoUrl,
        bannerUrl,
        address,
        phone,
        openingHours,
        openingDays,
        deliveryFee: deliveryFee ? parseFloat(deliveryFee) : undefined,
        urbanDeliveryFee: urbanDeliveryFee ? parseFloat(urbanDeliveryFee) : undefined,
        ruralDeliveryFee: ruralDeliveryFee ? parseFloat(ruralDeliveryFee) : undefined
      }
    });
    res.json(updated);
  } catch (error) {
    res.status(500).json({ message: 'Erro ao atualizar configuracoes' });
  }
};
