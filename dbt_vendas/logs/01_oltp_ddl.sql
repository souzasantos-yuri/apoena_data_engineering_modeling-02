-- ============================================
-- SETUP: Banco de Dados OLTP — TechShop
-- Arquivo: setup/01_dados_oltp.sql
-- ⏱️  Tempo estimado: 5 minutos
-- 📍 Posição no roteiro: Setup (antes da Parte 1)
-- ============================================
-- Este script simula o banco transacional (OLTP) de uma loja de eletrônicos.
-- Ele representa o sistema de origem que já existia antes do Data Warehouse.
-- ============================================

-- Cria o schema que representa o sistema transacional
CREATE SCHEMA IF NOT EXISTS oltp;

-- ─────────────────────────────────────────
-- TABELA: categorias
-- Representa as categorias dos produtos
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.categorias CASCADE;

CREATE TABLE oltp.categorias (
    id_categoria   SERIAL PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao      TEXT
);

INSERT INTO oltp.categorias (nome_categoria, descricao) VALUES
    ('Notebooks',      'Computadores portáteis'),
    ('Smartphones',    'Telefones celulares'),
    ('Acessórios',     'Periféricos e acessórios diversos');

-- ─────────────────────────────────────────
-- TABELA: produtos
-- Catálogo de produtos vendidos
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.produtos CASCADE;

CREATE TABLE oltp.produtos (
    id_produto    SERIAL PRIMARY KEY,
    nome_produto  VARCHAR(200) NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL,
    id_categoria  INT REFERENCES oltp.categorias(id_categoria),
    estoque       INT DEFAULT 0,
    ativo         BOOLEAN DEFAULT TRUE
);

INSERT INTO oltp.produtos (nome_produto, preco_unitario, id_categoria, estoque, ativo) VALUES
    ('Notebook Pro 15',       4500.00, 1, 30, TRUE),
    ('Notebook Air 13',       3200.00, 1, 45, TRUE),
    ('Notebook Gamer X',      7800.00, 1, 15, TRUE),
    ('Smartphone Galaxy S',   2800.00, 2, 60, TRUE),
    ('Smartphone iPhone 14',  6500.00, 2, 25, TRUE),
    ('Smartphone Moto G',      900.00, 2, 80, TRUE),
    ('Mouse Sem Fio',           150.00, 3, 120, TRUE),
    ('Teclado Mecânico',        350.00, 3, 75, TRUE);

-- ─────────────────────────────────────────
-- TABELA: clientes
-- Cadastro de clientes da loja
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.clientes CASCADE;

CREATE TABLE oltp.clientes (
    id_cliente    SERIAL PRIMARY KEY,
    nome          VARCHAR(200) NOT NULL,
    email         VARCHAR(200),
    telefone      VARCHAR(20),
    cidade        VARCHAR(100),
    estado        CHAR(2),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    ativo         BOOLEAN DEFAULT TRUE
);

INSERT INTO oltp.clientes (nome, email, telefone, cidade, estado, data_cadastro, ativo) VALUES
    ('  Ana Silva    ',        'ANA.SILVA@EMAIL.COM',   '11 99999-0001', 'são paulo',    'SP', '2023-01-15', TRUE),
    ('Carlos Mendes',          'carlos@gmail.com',       '21 98888-0002', 'Rio de Janeiro','RJ', '2023-02-20', TRUE),
    ('FERNANDA COSTA',         'FERNANDA@HOTMAIL.COM',   '31 97777-0003', 'belo horizonte','MG', '2023-03-10', TRUE),
    ('Roberto Lima',           'roberto.lima@email.com', '41 96666-0004', 'Curitiba',      'PR', '2023-04-05', TRUE),
    ('Juliana Pereira',        'ju.pereira@gmail.com',   '51 95555-0005', 'porto alegre',  'RS', '2023-05-22', TRUE),
    ('Marcos Oliveira',        'marcos@email.com',       '85 94444-0006', 'Fortaleza',     'CE', '2023-06-18', FALSE); -- cliente inativo

-- ─────────────────────────────────────────
-- TABELA: vendedores
-- Equipe de vendas
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.vendedores CASCADE;

CREATE TABLE oltp.vendedores (
    id_vendedor   SERIAL PRIMARY KEY,
    nome          VARCHAR(200) NOT NULL,
    email         VARCHAR(200),
    regiao        VARCHAR(50),
    data_admissao DATE
);

INSERT INTO oltp.vendedores (nome, email, regiao, data_admissao) VALUES
    ('Lucas Ferreira',   'lucas@techshop.com',    'Sudeste', '2022-01-10'),
    ('Mariana Santos',   'mariana@techshop.com',  'Sul',     '2022-03-15'),
    ('Paulo Rodrigues',  'paulo@techshop.com',    'Nordeste','2022-06-01');

-- ─────────────────────────────────────────
-- TABELA: pedidos
-- Cabeçalho dos pedidos realizados
-- ⚠️  Dados inseridos via Python (02_ingestao_python.py)
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.pedidos CASCADE;

CREATE TABLE oltp.pedidos (
    id_pedido    SERIAL PRIMARY KEY,
    id_cliente   INT REFERENCES oltp.clientes(id_cliente),
    id_vendedor  INT REFERENCES oltp.vendedores(id_vendedor),
    data_pedido  TIMESTAMP NOT NULL,
    status       VARCHAR(20) DEFAULT 'pendente',  -- pendente, enviado, entregue, cancelado
    valor_total  NUMERIC(10,2)
);

-- ─────────────────────────────────────────
-- TABELA: itens_pedido
-- Itens de cada pedido (um pedido tem N itens)
-- ⚠️  Dados inseridos via Python (02_ingestao_python.py)
-- ─────────────────────────────────────────
DROP TABLE IF EXISTS oltp.itens_pedido CASCADE;

CREATE TABLE oltp.itens_pedido (
    id_item        SERIAL PRIMARY KEY,
    id_pedido      INT REFERENCES oltp.pedidos(id_pedido),
    id_produto     INT REFERENCES oltp.produtos(id_produto),
    quantidade     INT NOT NULL,
    preco_unitario NUMERIC(10,2) NOT NULL,
    subtotal       NUMERIC(10,2) GENERATED ALWAYS AS (quantidade * preco_unitario) STORED
);

-- ─────────────────────────────────────────
-- Verificação rápida — rode isso para confirmar
-- ─────────────────────────────────────────
SELECT
    'clientes'    AS tabela, COUNT(*) AS registros FROM oltp.clientes    UNION ALL
SELECT 'produtos',            COUNT(*) FROM oltp.produtos                UNION ALL
SELECT 'vendedores',          COUNT(*) FROM oltp.vendedores              UNION ALL
SELECT 'categorias',          COUNT(*) FROM oltp.categorias              UNION ALL
SELECT 'pedidos',             COUNT(*) FROM oltp.pedidos                 UNION ALL
SELECT 'itens_pedido',        COUNT(*) FROM oltp.itens_pedido;
-- Esperado após SQL: 6, 8, 3, 3, 0, 0
-- pedidos e itens_pedido são populados via 02_ingestao_python.py