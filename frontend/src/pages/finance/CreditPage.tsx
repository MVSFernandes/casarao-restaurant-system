import React, { useEffect, useMemo, useState } from 'react';
import api from '../../services/api';
import type { CreditTransaction, Customer } from '../../types';
import {
  Plus,
  CreditCard,
  AlertTriangle,
  CheckCircle,
  MessageCircle,
  Receipt,
  Wallet,
  Pencil,
  Trash2,
  X,
} from 'lucide-react';

const formatMoney = (value: number) =>
  value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });

const formatPhoneForWhatsApp = (phone?: string) => {
  const digits = String(phone || '').replace(/\D/g, '');

  if (!digits) return '';

  if (digits.startsWith('55')) return digits;

  return `55${digits}`;
};

const formatDate = (value?: string) => {
  if (!value) return '-';
  return new Date(value).toLocaleString('pt-BR');
};

const getRestaurantName = () => {
  const raw = localStorage.getItem('restaurant_config');
  if (!raw) return 'restaurante';
  try {
    const parsed = JSON.parse(raw);
    return parsed?.name || 'restaurante';
  } catch {
    return 'restaurante';
  }
};

const buildWhatsAppMessage = (customer: Customer) => {
  const restaurantName = getRestaurantName();
  const openCharges = (customer.creditTxs || []).filter((tx) => tx.type === 'CHARGE');
  const debtList =
    openCharges.length > 0
      ? openCharges
          .map(
            (tx, index) =>
              `${index + 1}. ${tx.description || 'Lançamento no fiado'} - ${formatMoney(tx.amount)} (${formatDate(tx.createdAt)})`
          )
          .join('\n')
      : `1. Saldo em aberto - ${formatMoney(customer.creditUsed)}`;

  return `Olá, ${customer.name}! Tudo bem?\n\nEstamos entrando em contato para lembrar que há pendências em aberto no seu cadastro no ${restaurantName}.\n\nLançamentos em aberto:\n${debtList}\n\nTotal em aberto: ${formatMoney(customer.creditUsed)}.\n\nSe o pagamento já foi realizado, por favor desconsidere esta mensagem.\n\nAgradecemos pela atenção e ficamos à disposição.`;
};

const CreditPage: React.FC = () => {
  const [customers, setCustomers] = useState<Customer[]>([]);
  const [loading, setLoading] = useState(true);
  const [showCustomerModal, setShowCustomerModal] = useState(false);
  const [showPayModal, setShowPayModal] = useState(false);
  const [showChargeModal, setShowChargeModal] = useState(false);
  const [selectedCustomer, setSelectedCustomer] = useState<Customer | null>(null);
  const [editingCustomer, setEditingCustomer] = useState<Customer | null>(null);
  const [customerToDelete, setCustomerToDelete] = useState<Customer | null>(null);
  const [deleteLoading, setDeleteLoading] = useState(false);
  const [payAmount, setPayAmount] = useState('');
  const [chargeAmount, setChargeAmount] = useState('');
  const [chargeDescription, setChargeDescription] = useState('');
  const [form, setForm] = useState({
    name: '',
    phone: '',
    email: '',
    address: '',
    creditLimit: '500',
  });

  const fetchCustomers = async () => {
    try {
      const { data } = await api.get('/customers');
      setCustomers(data);
    } catch (error) {
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchCustomers();
  }, []);

  const totals = useMemo(() => {
    return customers.reduce(
      (acc, customer) => {
        acc.limit += Number(customer.creditLimit || 0);
        acc.used += Number(customer.creditUsed || 0);
        if (Number(customer.creditUsed || 0) > 0) acc.withDebt += 1;
        return acc;
      },
      { limit: 0, used: 0, withDebt: 0 }
    );
  }, [customers]);

  const resetCustomerForm = () => {
    setForm({ name: '', phone: '', email: '', address: '', creditLimit: '500' });
    setEditingCustomer(null);
  };

  const openNewCustomerModal = () => {
    resetCustomerForm();
    setShowCustomerModal(true);
  };

  const openEditCustomerModal = (customer: Customer) => {
    setEditingCustomer(customer);
    setForm({
      name: customer.name || '',
      phone: customer.phone || '',
      email: customer.email || '',
      address: customer.address || '',
      creditLimit: String(customer.creditLimit ?? 0),
    });
    setShowCustomerModal(true);
  };

  const handleSave = async () => {
    if (!form.name.trim()) return;

    try {
      const payload = {
        ...form,
        creditLimit: parseFloat(form.creditLimit || '0'),
      };

      if (editingCustomer) {
        await api.put(`/customers/${editingCustomer.id}`, payload);
      } else {
        await api.post('/customers', payload);
      }

      resetCustomerForm();
      setShowCustomerModal(false);
      fetchCustomers();
    } catch (error) {
      console.error(error);
      alert('Não foi possível salvar o cliente.');
    }
  };

  const openDeleteModal = (customer: Customer) => {
    setCustomerToDelete(customer);
  };

  const closeDeleteModal = () => {
    if (deleteLoading) return;
    setCustomerToDelete(null);
  };

  const handleDeleteCustomer = async () => {
    if (!customerToDelete) return;

    try {
      setDeleteLoading(true);
      await api.delete(`/customers/${customerToDelete.id}`);
      if (selectedCustomer?.id === customerToDelete.id) {
        setSelectedCustomer(null);
      }
      setCustomerToDelete(null);
      fetchCustomers();
    } catch (error) {
      console.error(error);
      alert('Não foi possível excluir o cliente. Verifique se seu usuário tem permissão.');
    } finally {
      setDeleteLoading(false);
    }
  };

  const handlePayCredit = async () => {
    if (!selectedCustomer || !payAmount) return;

    try {
      await api.post(`/customers/${selectedCustomer.id}/pay-credit`, {
        amount: parseFloat(payAmount),
      });

      setShowPayModal(false);
      setPayAmount('');
      fetchCustomers();
    } catch (error) {
      console.error(error);
    }
  };

  const handleChargeCredit = async () => {
    if (!selectedCustomer || !chargeAmount) return;

    try {
      await api.post(`/customers/${selectedCustomer.id}/charge-credit`, {
        amount: parseFloat(chargeAmount),
        description: chargeDescription || 'Lançamento manual no fiado',
      });

      setShowChargeModal(false);
      setChargeAmount('');
      setChargeDescription('');
      fetchCustomers();
    } catch (error) {
      console.error(error);
    }
  };

  const openPayModal = (customer: Customer) => {
    setSelectedCustomer(customer);
    setPayAmount('');
    setShowPayModal(true);
  };

  const openChargeModal = (customer: Customer) => {
    setSelectedCustomer(customer);
    setChargeAmount('');
    setChargeDescription('');
    setShowChargeModal(true);
  };

  const openWhatsApp = (customer: Customer) => {
    const phone = formatPhoneForWhatsApp(customer.phone);

    if (!phone) {
      alert('Esse cliente não possui telefone cadastrado.');
      return;
    }

    const message = buildWhatsAppMessage(customer);
    window.open(`https://wa.me/${phone}?text=${encodeURIComponent(message)}`, '_blank');
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-primary-600"></div>
      </div>
    );
  }

  return (
    <div>
      <div className="flex flex-col gap-4 md:flex-row md:items-center md:justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Fiado / Crédito</h1>
          <p className="text-gray-500">Controle clientes, lançamentos e cobranças no WhatsApp</p>
        </div>

        <button
          onClick={openNewCustomerModal}
          className="btn-primary flex items-center gap-2"
        >
          <Plus size={18} /> Novo Cliente
        </button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
        <div className="card">
          <div className="flex items-center gap-3">
            <div className="h-11 w-11 rounded-2xl bg-primary-50 text-primary-600 flex items-center justify-center">
              <CreditCard size={20} />
            </div>
            <div>
              <p className="text-sm text-gray-500">Clientes com fiado</p>
              <p className="text-2xl font-bold text-gray-900">{totals.withDebt}</p>
            </div>
          </div>
        </div>

        <div className="card">
          <div className="flex items-center gap-3">
            <div className="h-11 w-11 rounded-2xl bg-red-50 text-red-600 flex items-center justify-center">
              <Wallet size={20} />
            </div>
            <div>
              <p className="text-sm text-gray-500">Total em aberto</p>
              <p className="text-2xl font-bold text-red-600">{formatMoney(totals.used)}</p>
            </div>
          </div>
        </div>

        <div className="card">
          <div className="flex items-center gap-3">
            <div className="h-11 w-11 rounded-2xl bg-green-50 text-green-600 flex items-center justify-center">
              <CheckCircle size={20} />
            </div>
            <div>
              <p className="text-sm text-gray-500">Limite cadastrado</p>
              <p className="text-2xl font-bold text-gray-900">{formatMoney(totals.limit)}</p>
            </div>
          </div>
        </div>
      </div>

      <div className="grid grid-cols-1 xl:grid-cols-2 gap-4">
        {customers.length === 0 && (
          <div className="col-span-full card text-center py-12 text-gray-400">
            <CreditCard size={48} className="mx-auto mb-3 opacity-50" />
            <p>Nenhum cliente cadastrado.</p>
          </div>
        )}

        {customers.map((customer) => {
          const creditAvailable = Number(customer.creditLimit || 0) - Number(customer.creditUsed || 0);
          const isOverLimit = Number(customer.creditUsed || 0) >= Number(customer.creditLimit || 0) && Number(customer.creditLimit || 0) > 0;
          const usagePercent =
            Number(customer.creditLimit || 0) > 0
              ? Math.min((Number(customer.creditUsed || 0) / Number(customer.creditLimit || 0)) * 100, 100)
              : 0;

          const transactions = (customer.creditTxs || []).slice(0, 6);

          return (
            <div
              key={customer.id}
              className={`card ${isOverLimit ? 'border-2 border-red-300' : ''}`}
            >
              <div className="flex items-start justify-between gap-4 mb-4">
                <div>
                  <p className="font-bold text-gray-900 text-lg">{customer.name}</p>
                  {customer.phone && <p className="text-sm text-gray-500">{customer.phone}</p>}
                  {customer.address && <p className="text-xs text-gray-400 mt-1">{customer.address}</p>}
                </div>

                <div className="flex items-center gap-2">
                  <button
                    onClick={() => openEditCustomerModal(customer)}
                    className="h-10 w-10 rounded-xl border border-blue-200 bg-blue-50 text-blue-600 hover:bg-blue-100 flex items-center justify-center"
                    title="Editar cliente"
                  >
                    <Pencil size={18} />
                  </button>

                  <button
                    onClick={() => openWhatsApp(customer)}
                    className="h-10 w-10 rounded-xl border border-green-200 bg-green-50 text-green-600 hover:bg-green-100 flex items-center justify-center"
                    title="Cobrar no WhatsApp"
                  >
                    <MessageCircle size={18} />
                  </button>

                  <button
                    onClick={() => openDeleteModal(customer)}
                    className="h-10 w-10 rounded-xl border border-red-200 bg-red-50 text-red-600 hover:bg-red-100 flex items-center justify-center"
                    title="Excluir cliente"
                  >
                    <Trash2 size={18} />
                  </button>

                  {isOverLimit && <AlertTriangle className="text-red-500" size={20} />}
                </div>
              </div>

              <div className="mb-4">
                <div className="flex justify-between text-sm mb-1">
                  <span className="text-gray-500">Crédito usado</span>
                  <span className={`font-medium ${isOverLimit ? 'text-red-600' : 'text-gray-700'}`}>
                    {formatMoney(Number(customer.creditUsed || 0))} / {formatMoney(Number(customer.creditLimit || 0))}
                  </span>
                </div>

                <div className="w-full bg-gray-200 rounded-full h-2">
                  <div
                    className={`h-2 rounded-full transition-all ${
                      isOverLimit ? 'bg-red-500' : usagePercent > 80 ? 'bg-yellow-500' : 'bg-green-500'
                    }`}
                    style={{ width: `${usagePercent}%` }}
                  ></div>
                </div>

                <div className="mt-2 flex justify-between text-xs">
                  <span className="text-gray-500">
                    Disponível: <span className="font-semibold">{formatMoney(Math.max(0, creditAvailable))}</span>
                  </span>
                  <span className="text-gray-500">
                    Limite: <span className="font-semibold">{Math.round(usagePercent)}%</span>
                  </span>
                </div>
              </div>

              <div className="rounded-2xl border border-gray-100 bg-gray-50 p-4 mb-4">
                <div className="flex items-center gap-2 mb-3">
                  <Receipt size={16} className="text-gray-500" />
                  <p className="text-sm font-semibold text-gray-700">Contas em aberto / histórico</p>
                </div>

                {transactions.length === 0 ? (
                  <p className="text-sm text-gray-400">Nenhum lançamento registrado ainda.</p>
                ) : (
                  <div className="space-y-2">
                    {transactions.map((tx: CreditTransaction) => (
                      <div
                        key={tx.id}
                        className="flex items-start justify-between gap-3 rounded-xl bg-white px-3 py-2 border border-gray-100"
                      >
                        <div>
                          <p className="text-sm font-medium text-gray-800">
                            {tx.description || (tx.type === 'PAYMENT' ? 'Pagamento' : 'Lançamento')}
                          </p>
                          <p className="text-xs text-gray-500">{formatDate(tx.createdAt)}</p>
                        </div>

                        <span
                          className={`text-sm font-bold ${
                            tx.type === 'PAYMENT' ? 'text-green-600' : 'text-red-600'
                          }`}
                        >
                          {tx.type === 'PAYMENT' ? '-' : '+'}
                          {formatMoney(Number(tx.amount || 0))}
                        </span>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-2">
                <button
                  onClick={() => openEditCustomerModal(customer)}
                  className="btn-secondary py-2 flex items-center justify-center gap-2 text-sm"
                >
                  <Pencil size={16} /> Editar
                </button>

                <button
                  onClick={() => openChargeModal(customer)}
                  className="btn-secondary py-2 flex items-center justify-center gap-2 text-sm"
                >
                  <Plus size={16} /> Lançar Fiado
                </button>

                <button
                  onClick={() => openPayModal(customer)}
                  disabled={Number(customer.creditUsed || 0) <= 0}
                  className="btn-primary py-2 flex items-center justify-center gap-2 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  <CheckCircle size={16} /> Registrar Pagamento
                </button>

                <button
                  onClick={() => openWhatsApp(customer)}
                  disabled={!customer.phone || Number(customer.creditUsed || 0) <= 0}
                  className="py-2 px-3 rounded-xl border border-green-200 bg-green-50 text-green-700 hover:bg-green-100 text-sm font-semibold disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  Cobrar WhatsApp
                </button>

                <button
                  onClick={() => openDeleteModal(customer)}
                  className="py-2 px-3 rounded-xl border border-red-200 bg-red-50 text-red-700 hover:bg-red-100 text-sm font-semibold"
                >
                  Excluir
                </button>
              </div>
            </div>
          );
        })}
      </div>

      {showCustomerModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl p-6 w-full max-w-md">
            <h2 className="text-xl font-bold mb-4">{editingCustomer ? 'Editar Cliente' : 'Novo Cliente'}</h2>

            <div className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input
                  type="text"
                  value={form.name}
                  onChange={(e) => setForm({ ...form, name: e.target.value })}
                  className="input"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Telefone</label>
                <input
                  type="tel"
                  value={form.phone}
                  onChange={(e) => setForm({ ...form, phone: e.target.value })}
                  className="input"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">E-mail</label>
                <input
                  type="email"
                  value={form.email}
                  onChange={(e) => setForm({ ...form, email: e.target.value })}
                  className="input"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Endereço</label>
                <input
                  type="text"
                  value={form.address}
                  onChange={(e) => setForm({ ...form, address: e.target.value })}
                  className="input"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  Limite de Crédito (R$)
                </label>
                <input
                  type="number"
                  min="0"
                  step="0.01"
                  value={form.creditLimit}
                  onChange={(e) => setForm({ ...form, creditLimit: e.target.value })}
                  className="input"
                />
              </div>
            </div>

            <div className="flex gap-3 mt-4">
              <button onClick={handleSave} className="btn-primary flex-1">
                Salvar
              </button>
              <button
                onClick={() => { setShowCustomerModal(false); resetCustomerForm(); }}
                className="btn-secondary flex-1"
              >
                Cancelar
              </button>
            </div>
          </div>
        </div>
      )}

      {showPayModal && selectedCustomer && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl p-6 w-full max-w-sm">
            <h2 className="text-xl font-bold mb-1">Registrar Pagamento</h2>
            <p className="text-gray-500 mb-4">{selectedCustomer.name}</p>

            <div className="mb-4 p-3 bg-gray-50 rounded-lg">
              <p className="text-sm text-gray-500">Saldo devedor</p>
              <p className="text-2xl font-bold text-red-600">
                {formatMoney(Number(selectedCustomer.creditUsed || 0))}
              </p>
            </div>

            <div className="mb-4">
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Valor do Pagamento (R$)
              </label>
              <input
                type="number"
                min="0.01"
                max={selectedCustomer.creditUsed}
                step="0.01"
                value={payAmount}
                onChange={(e) => setPayAmount(e.target.value)}
                className="input"
              />
            </div>

            <div className="flex gap-3">
              <button onClick={handlePayCredit} disabled={!payAmount} className="btn-primary flex-1">
                Confirmar
              </button>
              <button onClick={() => setShowPayModal(false)} className="btn-secondary flex-1">
                Cancelar
              </button>
            </div>
          </div>
        </div>
      )}

      {showChargeModal && selectedCustomer && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white rounded-2xl shadow-2xl p-6 w-full max-w-md">
            <h2 className="text-xl font-bold mb-1">Lançar no Fiado</h2>
            <p className="text-gray-500 mb-4">{selectedCustomer.name}</p>

            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Valor (R$)</label>
                <input
                  type="number"
                  min="0.01"
                  step="0.01"
                  value={chargeAmount}
                  onChange={(e) => setChargeAmount(e.target.value)}
                  className="input"
                />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Descrição</label>
                <input
                  type="text"
                  value={chargeDescription}
                  onChange={(e) => setChargeDescription(e.target.value)}
                  placeholder="Ex.: Consumo do almoço / Pedido balcão"
                  className="input"
                />
              </div>
            </div>

            <div className="flex gap-3 mt-5">
              <button
                onClick={handleChargeCredit}
                disabled={!chargeAmount}
                className="btn-primary flex-1"
              >
                Lançar
              </button>
              <button onClick={() => setShowChargeModal(false)} className="btn-secondary flex-1">
                Cancelar
              </button>
            </div>
          </div>
        </div>
      )}


      {customerToDelete && (
        <div className="fixed inset-0 z-[60] bg-black/60 backdrop-blur-sm flex items-center justify-center p-4">
          <div className="w-full max-w-md overflow-hidden rounded-3xl bg-white shadow-2xl border border-red-100">
            <div className="relative p-6 pb-4 bg-gradient-to-br from-red-50 via-white to-white">
              <button
                onClick={closeDeleteModal}
                className="absolute right-4 top-4 h-9 w-9 rounded-full bg-white text-gray-500 border border-gray-200 hover:bg-gray-50 flex items-center justify-center"
                title="Fechar"
              >
                <X size={16} />
              </button>

              <div className="h-14 w-14 rounded-2xl bg-red-100 text-red-600 flex items-center justify-center shadow-sm mb-4">
                <Trash2 size={24} />
              </div>

              <h3 className="text-xl font-bold text-gray-900">Excluir cliente</h3>
              <p className="text-sm text-gray-500 mt-1">
                Você está prestes a remover este cliente do fiado.
              </p>
            </div>

            <div className="px-6 pb-6">
              <div className="rounded-2xl border border-gray-100 bg-gray-50 p-4 mb-4">
                <p className="text-xs font-semibold uppercase tracking-wide text-gray-500 mb-1">Cliente</p>
                <p className="text-base font-bold text-gray-900">{customerToDelete.name}</p>
                {customerToDelete.phone && (
                  <p className="text-sm text-gray-500 mt-1">{customerToDelete.phone}</p>
                )}
                <div className="mt-3 flex items-center justify-between rounded-xl bg-white border border-gray-100 px-3 py-2">
                  <span className="text-sm text-gray-500">Saldo em aberto</span>
                  <span className={`text-sm font-bold ${Number(customerToDelete.creditUsed || 0) > 0 ? 'text-red-600' : 'text-green-600'}`}>
                    {formatMoney(Number(customerToDelete.creditUsed || 0))}
                  </span>
                </div>
              </div>

              <div className="rounded-2xl border border-amber-200 bg-amber-50 px-4 py-3 mb-5">
                <p className="text-sm font-medium text-amber-800">
                  {Number(customerToDelete.creditUsed || 0) > 0
                    ? 'Esse cliente ainda possui valores em aberto. Exclua apenas se tiver certeza.'
                    : 'Essa ação remove o cadastro do cliente do módulo de fiado.'}
                </p>
              </div>

              <div className="flex gap-3">
                <button
                  onClick={closeDeleteModal}
                  disabled={deleteLoading}
                  className="flex-1 rounded-2xl border border-gray-200 bg-white px-4 py-3 text-sm font-semibold text-gray-700 hover:bg-gray-50 disabled:opacity-50"
                >
                  Cancelar
                </button>
                <button
                  onClick={handleDeleteCustomer}
                  disabled={deleteLoading}
                  className="flex-1 rounded-2xl bg-red-600 px-4 py-3 text-sm font-semibold text-white hover:bg-red-700 disabled:opacity-50"
                >
                  {deleteLoading ? 'Excluindo...' : 'Sim, excluir'}
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default CreditPage;
