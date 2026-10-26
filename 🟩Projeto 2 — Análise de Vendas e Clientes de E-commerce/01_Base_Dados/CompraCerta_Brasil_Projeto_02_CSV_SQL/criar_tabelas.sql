-- Projeto 2: CompraCerta Brasil
-- Banco indicado para o exercício: SQLite
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id TEXT PRIMARY KEY,
    nome_cliente TEXT NOT NULL,
    cidade TEXT,
    estado TEXT,
    regiao TEXT,
    data_cadastro TEXT,
    segmento_cliente TEXT
);

CREATE TABLE IF NOT EXISTS produtos (
    produto_id TEXT PRIMARY KEY,
    nome_produto TEXT NOT NULL,
    categoria TEXT NOT NULL,
    custo_unitario REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos (
    pedido_id TEXT PRIMARY KEY,
    cliente_id TEXT NOT NULL,
    data_pedido TEXT NOT NULL,
    status_pedido TEXT NOT NULL,
    canal_venda TEXT NOT NULL,
    frete REAL DEFAULT 0,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE IF NOT EXISTS itens_pedido (
    item_id TEXT PRIMARY KEY,
    pedido_id TEXT NOT NULL,
    produto_id TEXT NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario REAL NOT NULL,
    desconto_pct REAL DEFAULT 0,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
    FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);
