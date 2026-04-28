import React, { useState, useEffect } from 'react';
import api from '../services/api';
import type { RestaurantConfig } from '../types';
import { Settings, Save } from 'lucide-react';

const SettingsPage: React.FC = () => {
  const [config, setConfig] = useState<Partial<RestaurantConfig>>({});
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    const fetchConfig = async () => {
      try {
        const { data } = await api.get('/config');
        setConfig(data);
      } catch (error) {
        console.error(error);
      } finally {
        setLoading(false);
      }
    };
    fetchConfig();
  }, []);

  const handleSave = async () => {
    setSaving(true);
    try {
      await api.put('/config', config);
      setSaved(true);
      setTimeout(() => setSaved(false), 3000);
    } catch (error) {
      console.error(error);
    } finally {
      setSaving(false);
    }
  };

  if (loading) return <div className="flex items-center justify-center h-64"><div className="animate-spin rounded-full h-10 w-10 border-b-2 border-primary-600"></div></div>;

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Configurações</h1>
          <p className="text-gray-500">Configure as informações do seu restaurante</p>
        </div>
        <button onClick={handleSave} disabled={saving} className="btn-primary flex items-center gap-2">
          <Save size={18} /> {saving ? 'Salvando...' : 'Salvar'}
        </button>
      </div>

      {saved && (
        <div className="mb-4 bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg">
          Configurações salvas com sucesso!
        </div>
      )}

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div className="card">
          <h2 className="text-lg font-semibold text-gray-900 mb-4 flex items-center gap-2">
            <Settings size={20} className="text-primary-500" />
            Informações Gerais
          </h2>
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nome do Restaurante</label>
              <input type="text" value={config.name || ''} onChange={(e) => setConfig({ ...config, name: e.target.value })} className="input" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Telefone</label>
              <input type="tel" value={config.phone || ''} onChange={(e) => setConfig({ ...config, phone: e.target.value })} className="input" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Endereço</label>
              <input type="text" value={config.address || ''} onChange={(e) => setConfig({ ...config, address: e.target.value })} className="input" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Horário de Funcionamento</label>
              <input type="text" value={config.openingHours || ''} onChange={(e) => setConfig({ ...config, openingHours: e.target.value })} className="input" placeholder="Ex: 11h às 23h" />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Dias de Funcionamento</label>
              <input type="text" value={config.openingDays || ''} onChange={(e) => setConfig({ ...config, openingDays: e.target.value })} className="input" placeholder="Ex: Segunda a Domingo" />
            </div>
          </div>
        </div>

        <div className="card">
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Imagens e Entrega</h2>
          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">URL do Logo</label>
              <input type="text" value={config.logoUrl || ''} onChange={(e) => setConfig({ ...config, logoUrl: e.target.value })} className="input" placeholder="https://..." />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">URL do Banner (Cardápio Digital)</label>
              <input type="text" value={config.bannerUrl || ''} onChange={(e) => setConfig({ ...config, bannerUrl: e.target.value })} className="input" placeholder="https://..." />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Taxa de Entrega (R$)</label>
              <input type="number" min="0" step="0.01" value={config.deliveryFee || ''} onChange={(e) => setConfig({ ...config, deliveryFee: parseFloat(e.target.value) })} className="input" />
            </div>
          </div>

          <div className="mt-6 p-4 bg-blue-50 rounded-xl">
            <h3 className="font-semibold text-blue-800 mb-2">Link do Cardápio Digital</h3>
            <p className="text-sm text-blue-600 break-all">
              {window.location.origin}/cardapio
            </p>
            <button
              onClick={() => navigator.clipboard.writeText(`${window.location.origin}/cardapio`)}
              className="mt-2 text-xs btn-secondary py-1 px-3"
            >
              Copiar Link
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SettingsPage;
