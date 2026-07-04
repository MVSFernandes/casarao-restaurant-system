import { customerRepository } from '../repositories/customer.repository';
import { invoiceRepository } from '../repositories/invoice.repository';
import { supabase } from '../lib/supabase';
import { Customer, CreditTransactionStatus, Invoice } from '../types/domain';
import { NotFoundError } from '../types/errors';

export interface CreditEntryItem {
  id: string;
  productId: string;
  productName: string;
  quantity: number;
  unitPrice: number;
  total: number;
  notes: string | null;
}

export interface CreditEntry {
  id: string;
  orderId: string | null;
  desc: string;
  date: string;
  amount: number;
  settledAmount: number;
  openAmount: number;
  status: CreditTransactionStatus;
  settledAt: string | null;
  items: CreditEntryItem[];
  invoice: Invoice | null;
}

export interface CustomerCreditSummary extends Customer {
  openTotal: number;
  openRows: CreditEntry[];
  paidRows: CreditEntry[];
}

type CreditTransactionRow = {
  id: string;
  customer_id: string;
  order_id: string | null;
  type: string;
  amount: number;
  description: string | null;
  status: CreditTransactionStatus | null;
  settled_amount: number | null;
  settled_at: string | null;
  created_at: string;
};

type OrderRow = {
  id: string;
  type: string;
  table_id: string | null;
  customer_name: string | null;
};

type TableRow = {
  id: string;
  number: number;
};

type OrderItemRow = {
  id: string;
  order_id: string;
  product_id: string;
  quantity: number;
  price: number;
  unit_price: number | null;
  notes: string | null;
  products?: { name?: string | null } | { name?: string | null }[] | null;
};

const getProductName = (row: OrderItemRow) => {
  const product = Array.isArray(row.products) ? row.products[0] : row.products;
  return product?.name || 'Produto';
};

const buildDescription = (
  tx: CreditTransactionRow,
  order: OrderRow | undefined,
  table: TableRow | undefined
) => {
  if (tx.description) return tx.description;
  if (!tx.order_id) return 'Lancamento avulso';
  if (table) return `Pedido no fiado - Mesa ${table.number}`;
  if (order?.customer_name) return `Pedido no fiado - ${order.customer_name}`;
  return 'Pedido no fiado';
};

const toIso = (value: string | null) => (value ? new Date(value).toISOString() : null);

export const creditService = {
  async listCustomerCredits(): Promise<CustomerCreditSummary[]> {
    const customers = await customerRepository.findAll();
    return Promise.all(customers.map((customer) => creditService.getCustomerCredit(customer.id, customer)));
  },

  async getCustomerCredit(
    customerId: string,
    loadedCustomer?: Customer
  ): Promise<CustomerCreditSummary> {
    const customer = loadedCustomer ?? await customerRepository.findById(customerId);
    if (!customer) throw new NotFoundError('Customer', customerId);

    const { data: chargeRows, error: chargeError } = await supabase
      .from('credit_transactions')
      .select('*')
      .eq('customer_id', customerId)
      .eq('type', 'CHARGE')
      .order('created_at', { ascending: false });

    if (chargeError) throw chargeError;

    const charges = (chargeRows ?? []) as unknown as CreditTransactionRow[];
    const orderIds = Array.from(new Set(charges.map((tx) => tx.order_id).filter(Boolean))) as string[];
    const chargeIds = charges.map((tx) => tx.id);

    const [orders, items, invoices] = await Promise.all([
      creditService.loadOrders(orderIds),
      creditService.loadOrderItems(orderIds),
      invoiceRepository.findByCreditTransactionIds(chargeIds),
    ]);

    const tableIds = Array.from(new Set(orders.map((order) => order.table_id).filter(Boolean))) as string[];
    const tables = await creditService.loadTables(tableIds);

    const orderMap = new Map(orders.map((order) => [order.id, order]));
    const tableMap = new Map(tables.map((table) => [table.id, table]));
    const invoiceMap = new Map(invoices.map((invoice) => [invoice.creditTransactionId, invoice]));
    const itemsByOrder = new Map<string, CreditEntryItem[]>();

    for (const item of items) {
      const quantity = Number(item.quantity || 0);
      const total = Number(item.price || 0);
      const unitPrice = Number(item.unit_price ?? (quantity > 0 ? total / quantity : total));
      const list = itemsByOrder.get(item.order_id) ?? [];
      list.push({
        id: item.id,
        productId: item.product_id,
        productName: getProductName(item),
        quantity,
        unitPrice,
        total,
        notes: item.notes,
      });
      itemsByOrder.set(item.order_id, list);
    }

    const openRows: CreditEntry[] = [];
    const paidRows: CreditEntry[] = [];

    for (const charge of charges) {
      const status = (charge.status ?? 'OPEN') as CreditTransactionStatus;
      const settledAmount = Number(charge.settled_amount ?? 0);
      const amount = Number(charge.amount || 0);
      const openAmount = Math.max(0, amount - settledAmount);
      const order = charge.order_id ? orderMap.get(charge.order_id) : undefined;
      const table = order?.table_id ? tableMap.get(order.table_id) : undefined;

      const entry: CreditEntry = {
        id: charge.id,
        orderId: charge.order_id,
        desc: buildDescription(charge, order, table),
        date: new Date(charge.created_at).toISOString(),
        amount,
        settledAmount,
        openAmount,
        status,
        settledAt: toIso(charge.settled_at),
        items: charge.order_id ? itemsByOrder.get(charge.order_id) ?? [] : [],
        invoice: invoiceMap.get(charge.id) ?? null,
      };

      if (status === 'PAID') paidRows.push(entry);
      else openRows.push(entry);
    }

    const openTotal = openRows.reduce((sum, row) => sum + row.openAmount, 0);

    return {
      ...customer,
      creditUsed: openTotal,
      openTotal,
      openRows,
      paidRows,
    };
  },

  async loadOrders(orderIds: string[]): Promise<OrderRow[]> {
    if (orderIds.length === 0) return [];

    const { data, error } = await supabase
      .from('orders')
      .select('id,type,table_id,customer_name')
      .in('id', orderIds);

    if (error) throw error;
    return (data ?? []) as unknown as OrderRow[];
  },

  async loadTables(tableIds: string[]): Promise<TableRow[]> {
    if (tableIds.length === 0) return [];

    const { data, error } = await supabase
      .from('tables')
      .select('id,number')
      .in('id', tableIds);

    if (error) throw error;
    return (data ?? []) as unknown as TableRow[];
  },

  async loadOrderItems(orderIds: string[]): Promise<OrderItemRow[]> {
    if (orderIds.length === 0) return [];

    const { data, error } = await supabase
      .from('order_items')
      .select('id,order_id,product_id,quantity,price,unit_price,notes,products(name)')
      .in('order_id', orderIds);

    if (error) throw error;
    return (data ?? []) as unknown as OrderItemRow[];
  },
};
