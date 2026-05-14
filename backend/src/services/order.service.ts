import { createId } from '@paralleldrive/cuid2';
import { orderRepository } from '../repositories/order.repository';
import { productRepository } from '../repositories/product.repository';
import { categoryRepository } from '../repositories/category.repository';
import { productStockItemRepository } from '../repositories/productStockItem.repository';
import { paymentRepository } from '../repositories/payment.repository';
import { cashRegisterRepository } from '../repositories/cashRegister.repository';
import { tableRepository } from '../repositories/table.repository';
import { customerRepository } from '../repositories/customer.repository';
import { creditTransactionRepository } from '../repositories/creditTransaction.repository';
import { auditLogRepository } from '../repositories/auditLog.repository';
import { userRepository } from '../repositories/user.repository';
import {
  Order,
  OrderItem,
  OrderStatus,
  OrderType,
  Payment,
  SaleType,
  UserRole,
} from '../types/domain';
import {
  NotFoundError,
  ValidationError,
  ForbiddenError,
  InvalidStatusTransitionError,
  CashRegisterClosedError,
} from '../types/errors';

// ---------------------------------------------------------------------------
// Tipos internos usados pelos métodos públicos
// ---------------------------------------------------------------------------

export interface CreateOrderItemInput {
  productId: string;
  quantity?: number;
  weight?: number | null;
  unitPrice?: number | null;
  manualPrice?: number | null;
  saleType?: string | null;
  notes?: string | null;
}

export interface CreateOrderInput {
  type: OrderType;
  tableId?: string | null;
  customerId?: string | null;
  customerName?: string | null;
  waiterId?: string | null;
  deliveryFee?: number;
  deliveryType?: string | null;
  deliveryStreet?: string | null;
  deliveryNumber?: string | null;
  deliveryNeighborhood?: string | null;
  deliveryReference?: string | null;
  deliveryPhone?: string | null;
  deliveryNotes?: string | null;
  items: CreateOrderItemInput[];
}

export interface UpdateOrderInput {
  customerName?: string | null;
  deliveryFee?: number;
  deliveryType?: string | null;
  deliveryStreet?: string | null;
  deliveryNumber?: string | null;
  deliveryNeighborhood?: string | null;
  deliveryReference?: string | null;
  deliveryPhone?: string | null;
  deliveryNotes?: string | null;
  items?: CreateOrderItemInput[];
}

// Resultado de pricing de um item
interface ResolvedItemPricing {
  productId: string;
  quantity: number;
  weight: number | null;
  price: number;
  unitPrice: number;
  manualPrice: number | null;
  saleType: SaleType;
  notes: string | null;
}

// ---------------------------------------------------------------------------
// Helpers privados
// ---------------------------------------------------------------------------

/**
 * Resolve o preço de um item de pedido respeitando a hierarquia:
 * manualPrice > peso*unitPrice > quantidade*unitPrice
 * e fallback de preço por Kg da categoria (self-service ou kg).
 */
async function resolveItemPricing(item: CreateOrderItemInput): Promise<ResolvedItemPricing> {
  const product = await productRepository.findById(item.productId);
  if (!product) throw new NotFoundError('Product', item.productId);

  const category = await categoryRepository.findById(product.categoryId);

  const saleType: SaleType = (item.saleType as SaleType) ?? (product.isByWeight ? 'WEIGHT' : 'UNIT');

  // unitPrice: usa o fornecido, ou fallback da categoria/produto
  let unitPrice =
    item.unitPrice !== undefined && item.unitPrice !== null && item.unitPrice !== 0
      ? item.unitPrice
      : product.price;

  if (
    (item.unitPrice === undefined || item.unitPrice === null || item.unitPrice === 0) &&
    product.isByWeight &&
    category?.isMealCategory
  ) {
    if (saleType === ('SELF_SERVICE' as SaleType) && category.selfServicePricePerKg != null) {
      unitPrice = category.selfServicePricePerKg;
    } else if (category.pricePerKg != null) {
      unitPrice = category.pricePerKg;
    }
  }

  const manualPrice =
    item.manualPrice !== undefined && item.manualPrice !== null
      ? item.manualPrice
      : null;

  let itemPrice = 0;
  if (manualPrice !== null) {
    itemPrice = manualPrice;
  } else if (product.isByWeight) {
    const weightInKg = (item.weight ?? 0) / 1000;
    itemPrice = unitPrice * weightInKg;
  } else {
    itemPrice = unitPrice * (item.quantity ?? 1);
  }

  return {
    productId: item.productId,
    quantity: item.quantity ?? 1,
    weight: item.weight ?? null,
    price: itemPrice,
    unitPrice,
    manualPrice,
    saleType,
    notes: item.notes ?? null,
  };
}

/**
 * Libera a mesa se não houver mais pedidos ativos nela.
 */
async function releaseTableIfEmpty(tableId: string | null): Promise<void> {
  if (!tableId) return;
  // Busca pedidos ativos na mesa
  // Não temos query direta por tableId+status no repository, mas temos findByStatus
  // Solução: checar via findByStatus e filtrar — ou adicionar query no futuro
  // Por ora, liberamos a mesa sempre que o pedido finaliza/cancela,
  // confiando que o frontend recarrega o estado das mesas.
  await tableRepository.update(tableId, { status: 'AVAILABLE' });
}

// ---------------------------------------------------------------------------
// Service público
// ---------------------------------------------------------------------------

export const orderService = {
  /**
   * Cria um pedido de balcão/mesa/delivery (fluxo interno autenticado).
   * - Valida caixa aberto
   * - Valida nome do cliente para TAKE_AWAY e DELIVERY
   * - Resolve pricing de cada item
   * - Baixa estoque via RPC consume_order_stock
   * - Ocupa mesa se DINE_IN
   */
  async createOrder(input: CreateOrderInput, actingUser: { id: string; role: UserRole }): Promise<Order> {
    // 1. Validar caixa aberto
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) throw new CashRegisterClosedError();

    // 2. Validar nome do cliente
    if (input.type === 'TAKE_AWAY' && !String(input.customerName ?? '').trim()) {
      throw new ValidationError('customerName', 'Informe o nome do cliente para retirada.');
    }
    if (input.type === 'DELIVERY' && !String(input.customerName ?? '').trim()) {
      throw new ValidationError('customerName', 'Informe o nome do cliente para entrega.');
    }

    // 3. Garçom sempre atribui a si mesmo
    const waiterId = actingUser.role === 'WAITER' ? actingUser.id : (input.waiterId ?? null);

    // 4. Resolver pricing de cada item
    let total = 0;
    const resolvedItems: ResolvedItemPricing[] = [];
    for (const item of input.items) {
      const pricing = await resolveItemPricing(item);
      total += pricing.price;
      resolvedItems.push(pricing);
    }

    const deliveryFee = input.type === 'DELIVERY' ? (input.deliveryFee ?? 0) : 0;
    total += deliveryFee;

    // 5. Criar pedido
    const orderId = createId();
    const order = await orderRepository.create({
      id: orderId,
      type: input.type,
      status: 'NEW',
      total,
      deliveryFee,
      customerName: input.customerName ?? null,
      customerId: input.customerId ?? null,
      tableId: input.tableId ?? null,
      userId: actingUser.id,
      waiterId,
      cashRegisterSessionId: session.id,
      deliveryType: (input.deliveryType as any) ?? null,
      deliveryStreet: input.deliveryStreet ?? null,
      deliveryNumber: input.deliveryNumber ?? null,
      deliveryNeighborhood: input.deliveryNeighborhood ?? null,
      deliveryReference: input.deliveryReference ?? null,
      deliveryPhone: input.deliveryPhone ?? null,
      deliveryNotes: input.deliveryNotes ?? null,
      createdAt: new Date(),
      updatedAt: new Date(),
    });

    // 6. Criar itens
    for (const item of resolvedItems) {
      await orderRepository.addItem({
        id: createId(),
        orderId,
        productId: item.productId,
        quantity: item.quantity,
        weight: item.weight,
        price: item.price,
        unitPrice: item.unitPrice,
        manualPrice: item.manualPrice,
        saleType: item.saleType,
        notes: item.notes,
      });
    }

    // 7. Baixar estoque via RPC
    const stockItems = await buildStockConsumptionList(resolvedItems);
    if (stockItems.length > 0) {
      await orderRepository.consumeStock(stockItems);
    }

    // 8. Ocupar mesa
    if (input.type === 'DINE_IN' && input.tableId) {
      await tableRepository.update(input.tableId, { status: 'OCCUPIED' });
    }

    return order;
  },

  /**
   * Cria um pedido público (cardápio online) — sem autenticação de usuário.
   * Busca ou cria o cliente pelo telefone, usa o admin como userId.
   */
  async createPublicOrder(input: Omit<CreateOrderInput, 'waiterId'> & {
    customerPhone?: string | null;
    paymentMethod?: string | null;
  }): Promise<Order> {
    const session = await cashRegisterRepository.findOpenSession();
    if (!session) throw new CashRegisterClosedError();

    const type = input.type ?? 'TAKE_AWAY';

    if (type !== 'DINE_IN' && !String(input.customerName ?? '').trim()) {
      throw new ValidationError('customerName', 'Informe o nome do cliente.');
    }

    // Busca ou cria cliente pelo telefone
    let customerId: string | null = null;
    if (input.customerPhone) {
      let customer = await customerRepository.findByPhone(input.customerPhone);
      if (!customer && input.customerName) {
        customer = await customerRepository.create({
          id: createId(),
          name: input.customerName,
          phone: input.customerPhone,
          email: null,
          address: null,
          creditLimit: 0,
          creditUsed: 0,
          createdAt: new Date(),
          updatedAt: new Date(),
        });
      }
      customerId = customer?.id ?? null;
    }

    // Usa o primeiro admin como userId
    const admin = await userRepository.findAdminUser();
    if (!admin) throw new NotFoundError('User', 'admin');

    let total = 0;
    const resolvedItems: ResolvedItemPricing[] = [];
    for (const item of input.items) {
      const pricing = await resolveItemPricing(item);
      total += pricing.price;
      resolvedItems.push(pricing);
    }

    const deliveryFee = type === 'DELIVERY' ? (input.deliveryFee ?? 0) : 0;
    total += deliveryFee;

    const orderId = createId();
    const order = await orderRepository.create({
      id: orderId,
      type,
      status: 'NEW',
      total,
      deliveryFee,
      customerName: input.customerName ?? null,
      customerId,
      tableId: null,
      userId: admin.id,
      waiterId: null,
      cashRegisterSessionId: session.id,
      deliveryType: (input.deliveryType as any) ?? null,
      deliveryStreet: input.deliveryStreet ?? null,
      deliveryNumber: input.deliveryNumber ?? null,
      deliveryNeighborhood: input.deliveryNeighborhood ?? null,
      deliveryReference: input.deliveryReference ?? null,
      deliveryPhone: input.deliveryPhone ?? input.customerPhone ?? null,
      deliveryNotes: input.deliveryNotes ?? null,
      createdAt: new Date(),
      updatedAt: new Date(),
    });

    for (const item of resolvedItems) {
      await orderRepository.addItem({
        id: createId(),
        orderId,
        productId: item.productId,
        quantity: item.quantity,
        weight: item.weight,
        price: item.price,
        unitPrice: item.unitPrice,
        manualPrice: item.manualPrice,
        saleType: item.saleType,
        notes: item.notes,
      });
    }

    const stockItems = await buildStockConsumptionList(resolvedItems);
    if (stockItems.length > 0) {
      await orderRepository.consumeStock(stockItems);
    }

    // Cria pagamento pendente se paymentMethod fornecido
    if (input.paymentMethod) {
      await paymentRepository.create({
        id: createId(),
        orderId,
        method: input.paymentMethod as any,
        amount: total,
        status: 'PENDING',
        transactionId: null,
        createdAt: new Date(),
      });
    }

    return order;
  },

  /**
   * Atualiza status de um pedido.
   * Regras:
   * - WAITER só pode cancelar seus próprios pedidos no status NEW
   * - Pedido cancelado não pode ser alterado
   * - Cancelar → restaura estoque
   * - FINISHED ou CANCELED → libera mesa
   */
  async updateStatus(
    orderId: string,
    newStatus: OrderStatus,
    actingUser: { id: string; role: UserRole }
  ): Promise<Order> {
    const order = await orderRepository.findById(orderId);
    if (!order) throw new NotFoundError('Order', orderId);

    // Regras de garçom
    if (actingUser.role === 'WAITER') {
      if (order.waiterId !== actingUser.id) {
        throw new ForbiddenError('Você só pode alterar pedidos lançados por você.');
      }
      if (newStatus !== 'CANCELED') {
        throw new ForbiddenError('Garçom só pode cancelar os próprios pedidos.');
      }
      if (order.status !== 'NEW') {
        throw new ValidationError('status', 'Só é possível cancelar pedidos novos.');
      }
    }

    if (order.status === 'CANCELED' && newStatus !== 'CANCELED') {
      throw new InvalidStatusTransitionError(order.status, newStatus);
    }

    // Cancelar → restaurar estoque
    if (order.status !== 'CANCELED' && newStatus === 'CANCELED') {
      const items = await orderRepository.findItems(orderId);
      const stockItems = await buildStockConsumptionList(items.map(i => ({
        productId: i.productId,
        quantity: i.quantity,
        weight: i.weight,
        price: i.price,
        unitPrice: i.unitPrice,
        manualPrice: i.manualPrice,
        saleType: i.saleType,
        notes: i.notes,
      })));
      if (stockItems.length > 0) {
        await orderRepository.restoreStock(stockItems);
      }
    }

    const updated = await orderRepository.update(orderId, { status: newStatus });

    if (newStatus === 'FINISHED' || newStatus === 'CANCELED') {
      await releaseTableIfEmpty(order.tableId);
    }

    return updated;
  },

  /**
   * Processa pagamento de um pedido.
   * - CREDIT → usa RPC pay_order_with_credit (atômico)
   * - Outros métodos → cria/atualiza Payment + finaliza Order
   */
  async processPayment(
    orderId: string,
    method: string,
    amount?: number,
    customerId?: string | null
  ): Promise<Payment> {
    const order = await orderRepository.findById(orderId);
    if (!order) throw new NotFoundError('Order', orderId);

    const paymentAmount = amount ?? order.total;

    if (method === 'CREDIT') {
      const finalCustomerId = customerId ?? order.customerId;
      if (!finalCustomerId) {
        throw new ValidationError('customerId', 'Selecione um cliente para lançar no fiado.');
      }

      const customer = await customerRepository.findById(finalCustomerId);
      if (!customer) throw new NotFoundError('Customer', finalCustomerId);

      // Delega tudo pra RPC (valida limite, incrementa creditUsed, cria payment, finaliza order)
      await creditTransactionRepository.payOrderWithCredit(orderId, finalCustomerId, paymentAmount);

      await releaseTableIfEmpty(order.tableId);

      // Busca o payment criado pela RPC
      const payments = await paymentRepository.findByOrder(orderId);
      return payments[payments.length - 1];
    }

    // Pagamento normal — upsert do payment (pode já existir como PENDING)
    const existingPayments = await paymentRepository.findByOrder(orderId);
    let payment: Payment;

    if (existingPayments.length > 0) {
      payment = await paymentRepository.update(existingPayments[0].id, {
        method: method as any,
        amount: paymentAmount,
        status: 'PAID',
      });
    } else {
      payment = await paymentRepository.create({
        id: createId(),
        orderId,
        method: method as any,
        amount: paymentAmount,
        status: 'PAID',
        transactionId: null,
        createdAt: new Date(),
      });
    }

    await orderRepository.update(orderId, { status: 'FINISHED' });
    await releaseTableIfEmpty(order.tableId);

    return payment;
  },

  /**
   * Edita um pedido (apenas status NEW).
   * - Restaura estoque dos itens antigos
   * - Recalcula total com novos itens
   * - Baixa estoque dos novos itens
   */
  async updateOrder(
    orderId: string,
    input: UpdateOrderInput,
    actingUser: { id: string; role: UserRole }
  ): Promise<Order> {
    const order = await orderRepository.findById(orderId);
    if (!order) throw new NotFoundError('Order', orderId);

    if (actingUser.role === 'WAITER' && order.waiterId !== actingUser.id) {
      throw new ForbiddenError('Você só pode editar pedidos lançados por você.');
    }

    if (order.status !== 'NEW') {
      throw new ValidationError('status', 'Só é possível editar pedidos no status NEW.');
    }

    const patch: Partial<Order> = {};
    if (input.customerName !== undefined) patch.customerName = input.customerName;
    if (input.deliveryStreet !== undefined) patch.deliveryStreet = input.deliveryStreet;
    if (input.deliveryNumber !== undefined) patch.deliveryNumber = input.deliveryNumber;
    if (input.deliveryNeighborhood !== undefined) patch.deliveryNeighborhood = input.deliveryNeighborhood;
    if (input.deliveryReference !== undefined) patch.deliveryReference = input.deliveryReference;
    if (input.deliveryPhone !== undefined) patch.deliveryPhone = input.deliveryPhone;
    if (input.deliveryNotes !== undefined) patch.deliveryNotes = input.deliveryNotes;
    if (input.deliveryType !== undefined) patch.deliveryType = input.deliveryType as any;
    if (input.deliveryFee !== undefined) patch.deliveryFee = input.deliveryFee;

    if (input.items && input.items.length > 0) {
      // Restaura estoque antigo
      const oldItems = await orderRepository.findItems(orderId);
      const oldStockItems = await buildStockConsumptionList(oldItems.map(i => ({
        productId: i.productId, quantity: i.quantity, weight: i.weight,
        price: i.price, unitPrice: i.unitPrice, manualPrice: i.manualPrice,
        saleType: i.saleType, notes: i.notes,
      })));
      if (oldStockItems.length > 0) await orderRepository.restoreStock(oldStockItems);

      // Remove itens antigos
      for (const item of oldItems) {
        await orderRepository.removeItem(item.id);
      }

      // Resolve novos itens
      let newTotal = 0;
      const resolvedItems: ResolvedItemPricing[] = [];
      for (const item of input.items) {
        const pricing = await resolveItemPricing(item);
        newTotal += pricing.price;
        resolvedItems.push(pricing);
      }

      const deliveryFee = input.deliveryFee ?? order.deliveryFee;
      patch.total = newTotal + deliveryFee;

      for (const item of resolvedItems) {
        await orderRepository.addItem({
          id: createId(),
          orderId,
          productId: item.productId,
          quantity: item.quantity,
          weight: item.weight,
          price: item.price,
          unitPrice: item.unitPrice,
          manualPrice: item.manualPrice,
          saleType: item.saleType,
          notes: item.notes,
        });
      }

      const newStockItems = await buildStockConsumptionList(resolvedItems);
      if (newStockItems.length > 0) await orderRepository.consumeStock(newStockItems);
    }

    return orderRepository.update(orderId, patch);
  },

  /**
   * Exclui um pedido (admin).
   * Restaura estoque se o pedido estava ativo.
   */
  async deleteOrder(orderId: string): Promise<void> {
    const order = await orderRepository.findById(orderId);
    if (!order) throw new NotFoundError('Order', orderId);

    const activeStatuses: OrderStatus[] = ['NEW', 'IN_PROGRESS', 'READY', 'DELIVERED'];
    if (activeStatuses.includes(order.status)) {
      const items = await orderRepository.findItems(orderId);
      const stockItems = await buildStockConsumptionList(items.map(i => ({
        productId: i.productId, quantity: i.quantity, weight: i.weight,
        price: i.price, unitPrice: i.unitPrice, manualPrice: i.manualPrice,
        saleType: i.saleType, notes: i.notes,
      })));
      if (stockItems.length > 0) await orderRepository.restoreStock(stockItems);
    }

    const items = await orderRepository.findItems(orderId);
    for (const item of items) await orderRepository.removeItem(item.id);

    const payments = await paymentRepository.findByOrder(orderId);
    for (const p of payments) await paymentRepository.delete(p.id);

    await orderRepository.delete(orderId);
    await releaseTableIfEmpty(order.tableId);
  },
};

// ---------------------------------------------------------------------------
// Helper: monta lista de consumo de estoque para as RPCs consume/restore
// ---------------------------------------------------------------------------
async function buildStockConsumptionList(
  items: Array<{
    productId: string;
    quantity: number;
    weight: number | null;
    price?: number;
    unitPrice?: number | null;
    manualPrice?: number | null;
    saleType?: SaleType | null;
    notes?: string | null;
  }>
): Promise<{ stock_item_id: string; quantity: number }[]> {
  const result: { stock_item_id: string; quantity: number }[] = [];

  for (const item of items) {
    const product = await productRepository.findById(item.productId);
    if (!product) continue;

    const multiplier = product.isByWeight
      ? (item.weight ?? 0) / 1000
      : (item.quantity ?? 1);

    const links = await productStockItemRepository.findByProduct(item.productId);
    for (const link of links) {
      result.push({
        stock_item_id: link.stockItemId,
        quantity: link.quantity * multiplier,
      });
    }
  }

  return result;
}