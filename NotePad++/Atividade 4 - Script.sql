 -- atividade - 4 --
 
-- Criação do Banco de Dados:
CREATE DATABASE comercio;
GRANT ALL PRIVILEGES ON comercio.* TO 'gabriel'@'localhost';

-- Usando o banco de dados
USE comercio;

CREATE TABLE Forma_de_Pagamento (
    id_forma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);
 
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10) NOT NULL
);

CREATE TABLE Vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(15),
    comissao DECIMAL(8, 2) NOT NULL
);
 
CREATE TABLE Tipo_Endereco (
    id_tipo_endereco INT AUTO_INCREMENT PRIMARY KEY,
    tipo_endereco VARCHAR(20) NOT NULL,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);
 
CREATE TABLE Loja (
    id_loja INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);
 
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_loja INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
);
 
CREATE TABLE Item_Pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);
 
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_forma_pagamento INT NOT NULL,
    id_pedido INT NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_forma_pagamento) REFERENCES Forma_de_Pagamento(id_forma_pagamento),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
 
-- Inserindo dados:
-- Inserindo dados na tabela Forma_de_Pagamento
INSERT INTO Forma_de_Pagamento (descricao) VALUES
('Cartão de Crédito'),
('Boleto Bancário'),
('Pix'),
('Transferência Bancária');

-- Inserindo dados na tabela Produto
INSERT INTO Produto (nome, descricao, preco, estoque) VALUES
('Notebook Dell', 'Notebook Dell Inspiron 15, 8GB RAM, 256GB SSD', 3500.00, 15),
('Mouse Logitech', 'Mouse sem fio Logitech, preto', 150.00, 50),
('Teclado Mecânico', 'Teclado mecânico RGB com switches Blue', 250.00, 30);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, cpf, telefone, email) VALUES
('Gabriel Silva', '12345678901', '11987654321', 'gabriel@gmail.com'),
('Giovanna Xavier', '98765432100', '11976543210', 'giovanna@yahoo.com');

-- Inserindo dados na tabela Endereco
INSERT INTO Endereco (logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('Rua das Flores', '123', 'Apto 101', 'Jardim das Rosas', 'São Paulo', 'SP', '12345000'),
('Avenida Paulista', '1000', '', 'Bela Vista', 'São Paulo', 'SP', '01310000');

-- Inserindo dados na tabela Tipo_Endereco
INSERT INTO Tipo_Endereco (tipo_endereco, id_cliente, id_endereco) VALUES
('Entrega', 1, 1),
('Cobrança', 2, 2);

-- Inserindo dados na tabela Vendedor
INSERT INTO Vendedor (nome, cpf, telefone, comissao) VALUES
('Israel Magalhães', '44455566677', '11987651234', 5.5),
('Eduarda de Jesus', '99988877766', '11987650987', 7.0);

-- Inserindo dados na tabela Loja
INSERT INTO Loja (nome, id_endereco) VALUES
('Loja Centro', 1),
('Loja Paulista', 2);

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (data_pedido, id_cliente, id_vendedor, id_loja) VALUES
('2024-10-01', 1, 1, 1),
('2024-10-02', 2, 2, 2);

-- Inserindo dados na tabela Item_Pedido
INSERT INTO Item_Pedido (id_pedido, id_produto, quantidade, valor_unitario) VALUES
(1, 1, 1, 3500.00),
(1, 2, 2, 150.00),
(2, 3, 1, 250.00);

-- Inserindo dados na tabela Pagamento
INSERT INTO Pagamento (id_forma_pagamento, id_pedido, valor_pago) VALUES
(1, 1, 3800.00),
(2, 2, 250.00); 
 
 
-- SELECT e INNER JOIN:
 -- Listar todos os pedidos com informações do cliente, vendedor e loja
SELECT 
    Pedido.id_pedido,
    Pedido.data_pedido,
    Cliente.nome AS nome_cliente,
    Vendedor.nome AS nome_vendedor,
    Loja.nome AS nome_loja
FROM Pedido
INNER JOIN Cliente ON Pedido.id_cliente = Cliente.id_cliente
INNER JOIN Vendedor ON Pedido.id_vendedor = Vendedor.id_vendedor
INNER JOIN Loja ON Pedido.id_loja = Loja.id_loja;

-- Listar itens de pedido com informações do produto
SELECT 
    Item_Pedido.id_item,
    Pedido.id_pedido,
    Produto.nome AS nome_produto,
    Item_Pedido.quantidade,
    Item_Pedido.valor_unitario
FROM Item_Pedido
INNER JOIN Pedido ON Item_Pedido.id_pedido = Pedido.id_pedido
INNER JOIN Produto ON Item_Pedido.id_produto = Produto.id_produto;

-- Listar todos os pagamentos com detalhes do pedido e forma de pagamento
SELECT 
    Pagamento.id_pagamento,
    Pedido.id_pedido,
    Cliente.nome AS nome_cliente,
    Forma_de_Pagamento.descricao AS forma_pagamento,
    Pagamento.valor_pago
FROM Pagamento
INNER JOIN Pedido ON Pagamento.id_pedido = Pedido.id_pedido
INNER JOIN Cliente ON Pedido.id_cliente = Cliente.id_cliente
INNER JOIN Forma_de_Pagamento ON Pagamento.id_forma_pagamento = Forma_de_Pagamento.id_forma_pagamento;

-- Listar clientes com seus respectivos endereços de entrega
SELECT 
    Cliente.nome AS nome_cliente,
    Endereco.logradouro,
    Endereco.numero,
    Endereco.bairro,
    Endereco.cidade,
    Endereco.estado,
    Endereco.cep
FROM Cliente
INNER JOIN Tipo_Endereco ON Cliente.id_cliente = Tipo_Endereco.id_cliente
INNER JOIN Endereco ON Tipo_Endereco.id_endereco = Endereco.id_endereco
WHERE Tipo_Endereco.tipo_endereco = 'Entrega';

-- Listar produtos e o estoque disponível em cada loja
SELECT 
    Produto.nome AS nome_produto,
    Produto.estoque,
    Loja.nome AS nome_loja
FROM Produto
INNER JOIN Item_Pedido ON Produto.id_produto = Item_Pedido.id_produto
INNER JOIN Pedido ON Item_Pedido.id_pedido = Pedido.id_pedido
INNER JOIN Loja ON Pedido.id_loja = Loja.id_loja;

-- Listar todos os vendedores com o total de vendas realizadas
SELECT 
    Vendedor.nome AS nome_vendedor,
    COUNT(Pedido.id_pedido) AS total_vendas
FROM Vendedor
INNER JOIN Pedido ON Vendedor.id_vendedor = Pedido.id_vendedor
GROUP BY Vendedor.nome;


=========================================================================================================================================