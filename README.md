# RestaurantOS — Sistema de Gestão de Restaurante

Sistema web completo para gestão de restaurantes, desenvolvido com **Node.js + Express + TypeScript + Prisma** no backend e **React + TypeScript + TailwindCSS** no frontend.

---

## Sumário

- [Funcionalidades](#funcionalidades)
- [Tecnologias](#tecnologias)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Instalação e Configuração](#instalação-e-configuração)
- [Executando o Projeto](#executando-o-projeto)
- [Credenciais Padrão](#credenciais-padrão)
- [Módulos do Sistema](#módulos-do-sistema)
- [Roles e Permissões](#roles-e-permissões)
- [Endpoints da API](#endpoints-da-api)
- [Migração para MySQL (XAMPP)](#migração-para-mysql-xampp)

---

## Funcionalidades

| Módulo | Funcionalidades |
|---|---|
| **Autenticação** | Login JWT, Refresh Token, Roles (Admin, Caixa, Garçom, Financeiro) |
| **Dashboard** | Resumo do dia: pedidos, mesas, faturamento, estoque baixo |
| **PDV (Caixa)** | Abertura/Fechamento de caixa, mesas, pedidos, pagamento |
| **Garçom** | Visualização de mesas, abertura de pedidos, envio para cozinha |
| **Cardápio Digital** | Página pública para clientes fazerem pedidos online |
| **Gestão de Cardápio** | Categorias e produtos com imagens e preços |
| **Estoque** | Controle de itens, quantidades mínimas e alertas |
| **Financeiro** | Contas a pagar, relatórios de receita/despesa, lucro líquido |
| **Fiado** | Crédito de clientes, controle de saldo devedor |
| **Fornecedores** | Cadastro e comparação de preços entre fornecedores |
| **Configurações** | Dados do restaurante, logo, banner, taxa de entrega |

---

## Tecnologias

### Backend
- **Node.js** + **Express** + **TypeScript**
- **Prisma ORM** (suporte a MySQL e SQLite)
- **JWT** (Access Token + Refresh Token em cookies httpOnly)
- **bcrypt** para hash de senhas
- **express-rate-limit** para proteção contra abusos
- **Socket.io** para comunicação em tempo real

### Frontend
- **React 18** + **TypeScript** + **Vite**
- **TailwindCSS v3** para estilização
- **React Router v6** para roteamento
- **Zustand** para gerenciamento de estado
- **Axios** com interceptors para chamadas à API
- **Lucide React** para ícones

---

## Estrutura do Projeto

```
restaurant-system/
├── backend/
│   ├── prisma/
│   │   ├── schema.prisma       # Modelos do banco de dados
│   │   ├── seed.ts             # Dados iniciais
│   │   └── migrations/        # Migrações do banco
│   ├── src/
│   │   ├── controllers/       # Lógica de cada rota
│   │   ├── middlewares/       # Autenticação e autorização
│   │   ├── routes/            # Definição das rotas da API
│   │   ├── services/          # Regras de negócio
│   │   ├── repositories/      # Acesso ao banco de dados
│   │   ├── lib/               # Instância do Prisma
│   │   ├── websocket/         # Configuração do Socket.io
│   │   ├── app.ts             # Configuração do Express
│   │   └── server.ts          # Ponto de entrada do servidor
│   ├── .env                   # Variáveis de ambiente
│   ├── package.json
│   └── tsconfig.json
│
└── frontend/
    ├── src/
    │   ├── components/
    │   │   └── layout/        # MainLayout, ProtectedRoute
    │   ├── hooks/             # useAuth
    │   ├── pages/
    │   │   ├── auth/          # LoginPage
    │   │   ├── pdv/           # TablesPage, OrdersPage, CashRegisterPage
    │   │   ├── waiter/        # WaiterTablesPage, WaiterHistoryPage
    │   │   ├── menu/          # CategoriesPage, ProductsPage, PublicMenuPage
    │   │   └── finance/       # StockItemsPage, SuppliersPage, FinanceReportsPage,
    │   │                      # PayablesPage, CreditPage, SupplierComparisonPage
    │   ├── services/
    │   │   └── api.ts         # Axios configurado com interceptors
    │   ├── store/
    │   │   └── authStore.ts   # Estado global de autenticação (Zustand)
    │   ├── types/
    │   │   └── index.ts       # Tipos TypeScript globais
    │   └── App.tsx            # Roteamento principal
    ├── .env.development
    ├── .env.production
    ├── tailwind.config.js
    └── package.json
```

---

## Pré-requisitos

- **Node.js** v18 ou superior
- **npm** ou **yarn**
- **MySQL** (via XAMPP, Docker ou servidor dedicado) **ou** SQLite (para desenvolvimento rápido)

---

## Instalação e Configuração

### 1. Clone o repositório

```bash
git clone <url-do-repositório>
cd restaurant-system
```

### 2. Configure o Backend

```bash
cd backend
npm install
```

Edite o arquivo `.env`:

```env
# Para MySQL (XAMPP):
DATABASE_URL="mysql://root:@localhost:3306/restaurant_db"

# Para SQLite (desenvolvimento):
DATABASE_URL="file:./dev.db"

JWT_SECRET="sua-chave-secreta-aqui"
JWT_EXPIRES_IN="1d"
JWT_REFRESH_SECRET="sua-chave-refresh-aqui"
JWT_REFRESH_EXPIRES_IN="7d"
PORT=3001
NODE_ENV=development
```

### 3. Execute as Migrações e o Seed

```bash
# Criar as tabelas no banco de dados
npx prisma migrate dev --name init

# Popular com dados iniciais
npm run prisma:seed
```

### 4. Configure o Frontend

```bash
cd ../frontend
npm install
```

Edite o arquivo `.env.development`:

```env
VITE_API_URL=http://localhost:3001/api
```

---

## Executando o Projeto

### Backend (porta 3001)

```bash
cd backend
npm run dev
```

### Frontend (porta 5173)

```bash
cd frontend
npm run dev
```

Acesse: **http://localhost:5173**

---

## Credenciais Padrão

| Usuário | E-mail | Senha | Role |
|---|---|---|---|
| Admin | admin@admin.com | admin123 | ADMIN |

> **Nota:** O usuário Admin tem acesso a todos os módulos do sistema.

---

## Módulos do Sistema

### Dashboard
Visão geral do dia com métricas em tempo real: pedidos, mesas ocupadas, faturamento e alertas de estoque baixo.

### PDV (Ponto de Venda)
- **Abertura/Fechamento de Caixa**: Controle do turno de trabalho
- **Mesas**: Visualização do status de todas as mesas (disponível, ocupada, fechada)
- **Pedidos**: Criação de pedidos por mesa ou balcão, com seleção de produtos por categoria

### Painel do Garçom
- Visualização de mesas atribuídas
- Abertura de pedidos diretamente na mesa
- Envio de pedidos para a cozinha
- Histórico de pedidos do turno

### Cardápio Digital (Público)
- Acesse em `/cardapio`
- Clientes podem visualizar o cardápio e fazer pedidos online
- Suporte a pedidos de entrega, retirada ou consumo no local

### Gestão de Cardápio
- **Categorias**: Crie e gerencie categorias (ex: Entradas, Pratos Principais, Bebidas)
- **Produtos**: Cadastre produtos com nome, descrição, preço e imagem

### Estoque
- Controle de itens com quantidade atual e mínima
- Alertas automáticos para itens abaixo do mínimo

### Financeiro
- **Contas a Pagar**: Cadastro de despesas com vencimento e fornecedor
- **Relatórios**: Receitas, despesas e lucro líquido por período (hoje, semana, mês, ano)
- **Top Produtos**: Produtos mais vendidos por receita
- **Top Clientes**: Clientes que mais gastaram no período

### Fiado (Crédito)
- Cadastro de clientes com limite de crédito
- Controle de saldo devedor
- Registro de pagamentos parciais ou totais

### Comparação de Fornecedores
- Cadastro de fornecedores com contato
- Registro de preços por item de estoque
- Comparação automática com destaque do menor preço

---

## Roles e Permissões

| Role | Descrição | Acesso |
|---|---|---|
| `ADMIN` | Administrador | Acesso total ao sistema |
| `CASHIER` | Caixa | PDV, Mesas, Pedidos, Pagamentos |
| `WAITER` | Garçom | Painel do Garçom, Mesas, Pedidos |
| `FINANCE` | Financeiro | Estoque, Financeiro, Fornecedores, Fiado |

---

## Endpoints da API

### Autenticação
| Método | Rota | Descrição |
|---|---|---|
| POST | `/api/auth/login` | Login com e-mail e senha |
| POST | `/api/auth/refresh-token` | Renovar access token |
| POST | `/api/auth/logout` | Logout |
| GET | `/api/auth/me` | Dados do usuário logado |

### Mesas
| Método | Rota | Descrição |
|---|---|---|
| GET | `/api/tables` | Listar todas as mesas |
| GET | `/api/tables/:id` | Detalhes de uma mesa |
| POST | `/api/tables` | Criar mesa (Admin) |
| PATCH | `/api/tables/:id/status` | Atualizar status |
| DELETE | `/api/tables/:id` | Excluir mesa (Admin) |

### Pedidos
| Método | Rota | Descrição |
|---|---|---|
| GET | `/api/orders` | Listar pedidos (com filtros) |
| GET | `/api/orders/:id` | Detalhes de um pedido |
| POST | `/api/orders` | Criar pedido (autenticado) |
| POST | `/api/orders/public` | Criar pedido (cardápio digital) |
| PATCH | `/api/orders/:id/status` | Atualizar status |
| POST | `/api/orders/:id/payment` | Processar pagamento |

### Cardápio
| Método | Rota | Descrição |
|---|---|---|
| GET | `/api/categories` | Listar categorias |
| POST | `/api/categories` | Criar categoria (Admin) |
| GET | `/api/products` | Listar produtos |
| POST | `/api/products` | Criar produto (Admin) |
| PUT | `/api/products/:id` | Atualizar produto (Admin) |

### Financeiro
| Método | Rota | Descrição |
|---|---|---|
| GET | `/api/finance/reports` | Relatório financeiro |
| GET | `/api/finance/payables` | Contas a pagar |
| POST | `/api/finance/payables` | Nova conta a pagar |
| PATCH | `/api/finance/payables/:id/pay` | Marcar como paga |

---

## Migração para MySQL (XAMPP)

Para usar MySQL em vez de SQLite:

1. Crie o banco de dados no phpMyAdmin: `restaurant_db`

2. Edite `backend/prisma/schema.prisma`:
```prisma
datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}
```

3. Edite `backend/.env`:
```env
DATABASE_URL="mysql://root:@localhost:3306/restaurant_db"
```

4. Execute a migração:
```bash
cd backend
npx prisma migrate dev --name init
npm run prisma:seed
```

---

## Licença

Este projeto foi desenvolvido para fins educacionais e comerciais. Sinta-se livre para adaptar conforme suas necessidades.
