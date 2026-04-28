import { Request, Response } from 'express';
import { prisma } from '../lib/prisma';
import { PdfService } from '../services/pdf.service';

const getLowStockItemsData = async () => {
  const items = await prisma.stockItem.findMany({
    orderBy: { name: 'asc' },
  });

  return items.filter((item) => Number(item.quantity) <= Number(item.minQuantity));
};

const emitStockUpdate = async (req: Request) => {
  const io = req.app.get('io');
  if (!io) return;

  const lowStockItems = await getLowStockItemsData();

  io.emit('stock:updated');
  io.emit('stock:low', lowStockItems);
};

const getItemMultiplier = (
  item: { quantity?: number; weight?: number | null },
  product?: { isByWeight?: boolean | null }
) => {
  if (product?.isByWeight) {
    return Number(item.weight || 0) / 1000;
  }

  return Number(item.quantity || 1);
};

const consumeStockFromItems = async (
  items: Array<{
    productId: string;
    quantity?: number;
    weight?: number | null;
  }>
) => {
  for (const item of items) {
    const product = await prisma.product.findUnique({
      where: { id: item.productId },
    });

    if (!product) continue;

    const multiplier = getItemMultiplier(item, product);

    const productStockItems = await prisma.productStockItem.findMany({
      where: { productId: item.productId },
    });

    for (const psi of productStockItems) {
      await prisma.stockItem.update({
        where: { id: psi.stockItemId },
        data: {
          quantity: {
            decrement: psi.quantity * multiplier,
          },
        },
      });
    }
  }
};

const restoreStockFromOrderItems = async (
  items: Array<{
    productId: string;
    quantity: number;
    weight?: number | null;
    product?: { isByWeight?: boolean | null };
  }>
) => {
  for (const item of items) {
    const product =
      item.product ||
      (await prisma.product.findUnique({
        where: { id: item.productId },
      }));

    if (!product) continue;

    const multiplier = getItemMultiplier(item, product);

    const productStockItems = await prisma.productStockItem.findMany({
      where: { productId: item.productId },
    });

    for (const psi of productStockItems) {
      await prisma.stockItem.update({
        where: { id: psi.stockItemId },
        data: {
          quantity: {
            increment: psi.quantity * multiplier,
          },
        },
      });
    }
  }
};

const ensureCashRegisterOpen = async () => {
  const currentCash = await prisma.cashRegisterSession.findFirst({
    where: { status: 'OPEN' },
    orderBy: { openedAt: 'desc' },
  });

  return currentCash;
};

const getCategoryPricing = async (productId: string) => {
  const product = await prisma.product.findUnique({
    where: { id: productId },
    include: { category: true },
  });

  if (!product) return null;

  return { product, category: product.category };
};

const resolveOrderItemPricing = async (item: any) => {
  const result = await getCategoryPricing(item.productId);

  if (!result) {
    return null;
  }

  const { product, category } = result;
  const saleType = item.saleType || (product.isByWeight ? 'WEIGHT' : 'UNIT');

  let unitPrice =
    item.unitPrice !== undefined && item.unitPrice !== null
      ? Number(item.unitPrice)
      : Number(product.price);

  if ((item.unitPrice === undefined || item.unitPrice === null || Number(item.unitPrice) === 0) && product.isByWeight && category?.isMealCategory) {
    if (
      saleType === 'SELF_SERVICE' &&
      category.selfServicePricePerKg !== null &&
      category.selfServicePricePerKg !== undefined
    ) {
      unitPrice = Number(category.selfServicePricePerKg);
    } else if (category.pricePerKg !== null && category.pricePerKg !== undefined) {
      unitPrice = Number(category.pricePerKg);
    }
  }

  let itemPrice = 0;
  // --- INÍCIO DA LÓGICA DE PREÇO MANUAL ---
  let manualPrice = item.manualPrice !== undefined && item.manualPrice !== null ? Number(item.manualPrice) : null;

  if (manualPrice !== null) {
    itemPrice = manualPrice; // Ignora o peso e quantidade, cobra o preço fixo
  } else if (product.isByWeight) {
    const weightInKg = Number(item.weight || 0) / 1000;
    itemPrice = unitPrice * weightInKg;
  } else {
    itemPrice = unitPrice * Number(item.quantity || 1);
  }
  // --- FIM DA LÓGICA ---

  return {
    product,
    category,
    saleType,
    unitPrice,
    itemPrice,
    manualPrice,
  };
};

const releaseTableIfNoActiveOrders = async (tableId?: string | null) => {
  if (!tableId) return;

  const activeOrders = await prisma.order.count({
    where: {
      tableId,
      status: { in: ['NEW', 'IN_PROGRESS', 'READY', 'DELIVERED'] },
    },
  });

  if (activeOrders === 0) {
    await prisma.table.update({
      where: { id: tableId },
      data: { status: 'AVAILABLE' },
    });
  }
};

export const getOrders = async (req: Request, res: Response) => {
  try {
    const { tableId, status, myOrders, waiterId, search, today } = req.query;
    const user = (req as any).user;
    const userId = user?.id;

    const currentCash = await ensureCashRegisterOpen();

    if (!currentCash) {
      return res.json([]);
    }

    const where: any = {
      cashRegisterSession: {
        is: { id: currentCash.id },
      },
    };

    if (tableId) where.tableId = tableId as string;
    if (waiterId) where.waiterId = waiterId as string;

    if (status) {
      const statuses = (status as string).split(',');
      where.status = { in: statuses };
    } else {
      where.status = {
        notIn: ['FINISHED', 'CANCELED'],
      };
    }

    if (myOrders === 'true' && userId) {
      where.waiterId = userId;
    }

    if (user?.role === 'WAITER' && userId) {
      where.waiterId = userId;
    }

    if (today === 'true') {
      const startDate = new Date();
      startDate.setHours(0, 0, 0, 0);
      where.createdAt = {
        ...(where.createdAt || {}),
        gte: startDate,
      };
    }

    if (search) {
      where.OR = [
        { waiter: { name: { contains: String(search), mode: 'insensitive' } } },
        { user: { name: { contains: String(search), mode: 'insensitive' } } },
        { customerName: { contains: String(search), mode: 'insensitive' } },
      ];
    }

    const orders = await prisma.order.findMany({
      where,
      orderBy: { createdAt: 'desc' },
      include: {
        items: { include: { product: true } },
        table: true,
        user: { select: { id: true, name: true } },
        waiter: { select: { id: true, name: true } },
        customer: true,
        payment: true,
      },
    });

    return res.json(orders);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao buscar pedidos' });
  }
};

export const getOrderById = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        items: { include: { product: true } },
        table: true,
        user: { select: { id: true, name: true } },
        waiter: { select: { id: true, name: true } },
        customer: true,
        payment: true,
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    return res.json(order);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao buscar pedido' });
  }
};

export const createOrder = async (req: Request, res: Response) => {
  try {
    const {
      type,
      tableId,
      customerId,
      customerName,
      deliveryStreet,
      deliveryNumber,
      deliveryNeighborhood,
      deliveryReference,
      deliveryPhone,
      deliveryNotes,
      items,
      waiterId,
      deliveryFee,
      deliveryType,
    } = req.body;

    const user = (req as any).user;
    const userId = user.id;

    const finalWaiterId = user.role === 'WAITER' ? userId : waiterId || null;

    if (type === 'TAKE_AWAY' && !String(customerName || '').trim()) {
      return res.status(400).json({ message: 'Informe o nome do cliente para retirada.' });
    }

    if (type === 'DELIVERY' && !String(customerName || '').trim()) {
      return res.status(400).json({ message: 'Informe o nome do cliente para entrega.' });
    }

    const currentCash = await ensureCashRegisterOpen();

    if (!currentCash) {
      return res
        .status(400)
        .json({ message: 'Não é possível lançar pedidos com o caixa fechado.' });
    }

    let total = 0;
    const orderItems = [];

    for (const item of items) {
      const pricing = await resolveOrderItemPricing(item);

      if (!pricing) {
        return res.status(404).json({ message: `Produto ${item.productId} não encontrado` });
      }

      total += pricing.itemPrice;

      orderItems.push({
        productId: item.productId,
        quantity: item.quantity || 1,
        weight: item.weight || null,
        price: pricing.itemPrice,
        unitPrice: pricing.unitPrice,
        manualPrice: pricing.manualPrice,
        saleType: pricing.saleType,
        notes: item.notes || '',
      });
    }

    const normalizedDeliveryFee = type === 'DELIVERY' ? Number(deliveryFee || 0) : 0;
    total += normalizedDeliveryFee;

    const order = await prisma.order.create({
      data: {
        type,
        status: 'NEW',
        total,
        userId,
        waiterId: finalWaiterId,
        tableId: tableId || undefined,
        customerId: customerId || undefined,
        customerName: customerName || undefined,
        deliveryStreet: deliveryStreet || undefined,
        deliveryNumber: deliveryNumber || undefined,
        deliveryNeighborhood: deliveryNeighborhood || undefined,
        deliveryReference: deliveryReference || undefined,
        deliveryPhone: deliveryPhone || undefined,
        deliveryNotes: deliveryNotes || undefined,
        deliveryFee: normalizedDeliveryFee,
        deliveryType: deliveryType || undefined,
        cashRegisterSessionId: currentCash.id,
        items: { create: orderItems },
      },
      include: {
        items: { include: { product: true } },
        table: true,
        waiter: { select: { name: true } },
      },
    });

    await consumeStockFromItems(orderItems);

    if (type === 'DINE_IN' && tableId) {
      await prisma.table.update({
        where: { id: tableId },
        data: { status: 'OCCUPIED' },
      });
    }

    await emitStockUpdate(req);

    return res.status(201).json(order);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao criar pedido' });
  }
};

export const createPublicOrder = async (req: Request, res: Response) => {
  try {
    const {
      customerName,
      customerPhone,
      type,
      paymentMethod,
      items,
      deliveryStreet,
      deliveryNumber,
      deliveryNeighborhood,
      deliveryReference,
      deliveryPhone,
      deliveryNotes,
      deliveryFee,
      deliveryType,
    } = req.body;

    if ((type || 'TAKE_AWAY') !== 'DINE_IN' && !String(customerName || '').trim()) {
      return res.status(400).json({ message: 'Informe o nome do cliente.' });
    }

    const currentCash = await ensureCashRegisterOpen();

    if (!currentCash) {
      return res.status(400).json({
        message: 'Não é possível lançar pedidos com o caixa fechado.',
      });
    }

    let customer = await prisma.customer.findFirst({
      where: { phone: customerPhone },
    });

    if (!customer && customerName) {
      customer = await prisma.customer.create({
        data: {
          name: customerName,
          phone: customerPhone || undefined,
          creditLimit: 0,
          creditUsed: 0,
        },
      });
    }

    const adminUser = await prisma.user.findFirst({
      where: { role: 'ADMIN' },
    });

    if (!adminUser) {
      return res.status(500).json({ message: 'Nenhum usuário admin encontrado' });
    }

    let total = 0;
    const orderItems = [];

    for (const item of items) {
      const pricing = await resolveOrderItemPricing(item);

      if (!pricing) {
        return res.status(404).json({ message: `Produto ${item.productId} não encontrado` });
      }

      total += pricing.itemPrice;

      orderItems.push({
        productId: item.productId,
        quantity: item.quantity || 1,
        weight: item.weight || null,
        price: pricing.itemPrice,
        unitPrice: pricing.unitPrice,
        manualPrice: pricing.manualPrice,
        saleType: pricing.saleType,
        notes: item.notes || '',
      });
    }

    const normalizedDeliveryFee =
      (type || 'TAKE_AWAY') === 'DELIVERY' ? Number(deliveryFee || 0) : 0;

    total += normalizedDeliveryFee;

    const order = await prisma.order.create({
      data: {
        type: type || 'TAKE_AWAY',
        status: 'NEW',
        total,
        userId: adminUser.id,
        customerId: customer?.id || undefined,
        customerName: customerName || undefined,
        deliveryStreet: deliveryStreet || undefined,
        deliveryNumber: deliveryNumber || undefined,
        deliveryNeighborhood: deliveryNeighborhood || undefined,
        deliveryReference: deliveryReference || undefined,
        deliveryPhone: deliveryPhone || customerPhone || undefined,
        deliveryNotes: deliveryNotes || undefined,
        deliveryFee: normalizedDeliveryFee,
        deliveryType: deliveryType || undefined,
        cashRegisterSessionId: currentCash.id,
        items: { create: orderItems },
        payment: paymentMethod
          ? {
              create: {
                method: paymentMethod,
                amount: total,
                status: 'PENDING',
              },
            }
          : undefined,
      },
      include: {
        items: { include: { product: true } },
        customer: true,
      },
    });

    await consumeStockFromItems(orderItems);
    await emitStockUpdate(req);

    return res.status(201).json(order);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao criar pedido público' });
  }
};

export const updateOrderStatus = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    const user = (req as any).user;

    const existingOrder = await prisma.order.findUnique({
      where: { id },
      include: {
        items: {
          include: {
            product: true,
          },
        },
      },
    });

    if (!existingOrder) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    if (user?.role === 'WAITER') {
      if (existingOrder.waiterId !== user.id) {
        return res
          .status(403)
          .json({ message: 'Você só pode alterar pedidos lançados por você.' });
      }

      if (status !== 'CANCELED') {
        return res
          .status(403)
          .json({ message: 'Garçom só pode cancelar os próprios pedidos.' });
      }

      if (existingOrder.status !== 'NEW') {
        return res.status(400).json({ message: 'Só é possível cancelar pedidos novos.' });
      }
    }

    if (existingOrder.status === 'CANCELED' && status !== 'CANCELED') {
      return res.status(400).json({ message: 'Pedido cancelado não pode ser alterado.' });
    }

    if (existingOrder.status !== 'CANCELED' && status === 'CANCELED') {
      await restoreStockFromOrderItems(existingOrder.items);
    }

    const order = await prisma.order.update({
      where: { id },
      data: { status },
      include: {
        items: { include: { product: true } },
        table: true,
        waiter: { select: { id: true, name: true } },
      },
    });

    if (status === 'FINISHED' || status === 'CANCELED') {
      await releaseTableIfNoActiveOrders(order.tableId);
    }

    await emitStockUpdate(req);

    return res.json(order);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao atualizar status do pedido' });
  }
};

export const processPayment = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { method, amount, customerId } = req.body;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        customer: true,
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    const paymentAmount = amount ? Number(amount) : Number(order.total);

    if (method === 'CREDIT') {
      const finalCustomerId = customerId || order.customerId;

      if (!finalCustomerId) {
        return res.status(400).json({ message: 'Selecione um cliente para lançar no fiado.' });
      }

      const customer = await prisma.customer.findUnique({
        where: { id: finalCustomerId },
      });

      if (!customer) {
        return res.status(404).json({ message: 'Cliente não encontrado para o fiado.' });
      }

      const newCreditUsed = Number(customer.creditUsed) + paymentAmount;

      if (Number(customer.creditLimit) > 0 && newCreditUsed > Number(customer.creditLimit)) {
        return res.status(400).json({
          message: 'O valor ultrapassa o limite de crédito disponível para este cliente.',
        });
      }

      const payment = await prisma.$transaction(async (tx) => {
        const savedPayment = await tx.payment.upsert({
          where: { orderId: id },
          create: {
            orderId: id,
            method,
            amount: paymentAmount,
            status: 'PAID',
          },
          update: {
            method,
            amount: paymentAmount,
            status: 'PAID',
          },
        });

        await tx.order.update({
          where: { id },
          data: {
            status: 'FINISHED',
            customerId: customer.id,
            customerName: order.customerName || customer.name,
          },
        });

        await tx.customer.update({
          where: { id: customer.id },
          data: {
            creditUsed: {
              increment: paymentAmount,
            },
          },
        });

        await tx.creditTransaction.create({
          data: {
            customerId: customer.id,
            type: 'CHARGE',
            amount: paymentAmount,
            description: `Fiado do pedido #${id.slice(-6).toUpperCase()}`,
          },
        });

        return savedPayment;
      });

      await releaseTableIfNoActiveOrders(order.tableId);

      return res.json(payment);
    }

    const payment = await prisma.payment.upsert({
      where: { orderId: id },
      create: {
        orderId: id,
        method,
        amount: paymentAmount,
        status: 'PAID',
      },
      update: {
        method,
        amount: paymentAmount,
        status: 'PAID',
      },
    });

    await prisma.order.update({
      where: { id },
      data: { status: 'FINISHED' },
    });

    await releaseTableIfNoActiveOrders(order.tableId);

    return res.json(payment);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao processar pagamento' });
  }
};

export const deleteOrder = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        items: {
          include: {
            product: true,
          },
        },
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    if (['NEW', 'IN_PROGRESS', 'READY', 'DELIVERED'].includes(order.status)) {
      await restoreStockFromOrderItems(order.items);
    }

    await prisma.orderItem.deleteMany({ where: { orderId: id } });
    await prisma.payment.deleteMany({ where: { orderId: id } });
    await prisma.order.delete({ where: { id } });

    await releaseTableIfNoActiveOrders(order.tableId);
    await emitStockUpdate(req);

    return res.status(204).send();
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao excluir pedido' });
  }
};

export const getOrderReceipt = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        items: { include: { product: true } },
        table: true,
        waiter: true,
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    const config = await prisma.restaurantConfig.findFirst();

    if (!config) {
      return res.status(404).json({ message: 'Configuração não encontrada' });
    }

    const pdfBuffer = await PdfService.generateOrderReceipt(order as any, config);

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader(
      'Content-Disposition',
      `attachment; filename=pedido-${order.id.slice(-6)}.pdf`
    );

    return res.send(pdfBuffer);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao gerar PDF do pedido' });
  }
};

export const getCompanyReceipt = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const { companyName, companyCnpj } = req.query;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        items: { include: { product: true } },
        table: true,
        waiter: true,
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido não encontrado' });
    }

    const config = await prisma.restaurantConfig.findFirst();

    if (!config) {
      return res.status(404).json({ message: 'Configuração não encontrada' });
    }

    const pdfBuffer = await PdfService.generateCompanyReceipt(order as any, config, {
      name: (companyName as string) || 'N/A',
      cnpj: (companyCnpj as string) || 'N/A',
    });

    res.setHeader('Content-Type', 'application/pdf');
    res.setHeader(
      'Content-Disposition',
      `attachment; filename=recibo-empresa-${order.id.slice(-6)}.pdf`
    );

    return res.send(pdfBuffer);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao gerar recibo para empresa' });
  }
};

export const updateOrder = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;
    const user = (req as any).user;
    const {
      customerName,
      items,
      deliveryFee,
      deliveryStreet,
      deliveryNumber,
      deliveryNeighborhood,
      deliveryReference,
      deliveryPhone,
      deliveryNotes,
      deliveryType,
    } = req.body;

    const order = await prisma.order.findUnique({
      where: { id },
      include: {
        items: {
          include: {
            product: true,
          },
        },
      },
    });

    if (!order) {
      return res.status(404).json({ message: 'Pedido nao encontrado' });
    }

    if (user?.role === 'WAITER' && order.waiterId !== user.id) {
      return res.status(403).json({ message: 'Você só pode editar pedidos lançados por você.' });
    }

    if (order.status !== 'NEW') {
      return res.status(400).json({ message: 'So e possivel editar pedidos no status NEW' });
    }

    const updateData: any = {};

    if (customerName !== undefined) updateData.customerName = customerName;
    if (deliveryStreet !== undefined) updateData.deliveryStreet = deliveryStreet;
    if (deliveryNumber !== undefined) updateData.deliveryNumber = deliveryNumber;
    if (deliveryNeighborhood !== undefined) updateData.deliveryNeighborhood = deliveryNeighborhood;
    if (deliveryReference !== undefined) updateData.deliveryReference = deliveryReference;
    if (deliveryPhone !== undefined) updateData.deliveryPhone = deliveryPhone;
    if (deliveryNotes !== undefined) updateData.deliveryNotes = deliveryNotes;
    if (deliveryType !== undefined) updateData.deliveryType = deliveryType;
    if (deliveryFee !== undefined) updateData.deliveryFee = Number(deliveryFee || 0);

    if (items && Array.isArray(items)) {
      await restoreStockFromOrderItems(order.items);

      await prisma.orderItem.deleteMany({ where: { orderId: id } });

      let newTotal = 0;
      const newItems = [];

      for (const item of items) {
        const pricing = await resolveOrderItemPricing(item);

        if (!pricing) continue;

        newTotal += pricing.itemPrice;

        newItems.push({
          productId: item.productId,
          quantity: item.quantity || 1,
          weight: item.weight || null,
          price: pricing.itemPrice,
          unitPrice: pricing.unitPrice,
          manualPrice: pricing.manualPrice,
          saleType: pricing.saleType,
          notes: item.notes || '',
        });
      }

      updateData.total =
        newTotal + Number(deliveryFee !== undefined ? deliveryFee : order.deliveryFee || 0);
      updateData.items = { create: newItems };

      await consumeStockFromItems(newItems);
    }

    const updatedOrder = await prisma.order.update({
      where: { id },
      data: updateData,
      include: {
        items: { include: { product: true } },
        table: true,
        waiter: { select: { name: true } },
      },
    });

    await emitStockUpdate(req);

    return res.json(updatedOrder);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Erro ao atualizar pedido' });
  }
};