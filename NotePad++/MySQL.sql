create table tb_livro(
  id_livro int primary key auto_increment,
  titulo varchar(100) not null,
  autor varchar(50) not null,
  genero varchar(50) not null,
  editora varchar(50) not null,
  numero_exemplar int not null,
  ano_publicacao date not null
);
create table tb_membro(
  id_membro int primary key auto_increment,
  nome varchar(100) not null,
  endereco varchar(100) not null,
  telefone varchar(25) not null,
  email varchar(100) not null,
  data_registro date not null
);
create table tb_emprestimo(
  id_emprestimo int primary key auto_increment,
  data_emprestimo date not null,
  data_devolucao date not null,
  id_membro int not null,
  id_livro int not null,
  foreign key (id_membro) references tb_membro(id_membro),
  foreign key (id_livro) references tb_livro(id_livro)
);
create table tb_genero(
  id_genero int primary key auto_increment,
  nome varchar(100) not null
);


insert into tb_livro( 
  titulo, 
  autor, 
  genero, 
  editora, 
  numero_exemplar, 
  ano_publicacao
)
values(
  'Dom Casmurro', 
  'Machado de Assis', 
  'Romance', 
  'Cia das Letras', 
  1 , 
  2000
);
values(
  'Crime e Castigo',
  'Fiódor Dostoiévski',
  'Suspense',
  'Mimética',
  1,
  2020
);
values(
  'Diário de Anne Frank',
  'Anne Frank',
  'Autobiografia',
  'Record',
  1,
  1947
);
values(
  'Cemitério Maldito',
  'Stephen King',
  'Terror',
  'Bertrand',
  1,
  1983
);
values(
  'O Exorcista',
  'William Peter Blatty',
  'Terror',
  'HarperCollins',
  1,
  1971
);


insert into tb_membro( 
  nome, 
  endereco, 
  telefone, 
  email, 
  data_registro
)
values(
  'Gabriel',
  'Rua Gabriel, 13 - Barueri/SP',
  '11 13131-3131',
  'gabriel13@gmail.com',
  '2024-08-28'
);
values(
  'Giovanna',
  'Rua Giovanna, 7 - Barueri/SP',
  '11 77777-7777',
  'giovanna7@gmail.com',
  '2024-08-28'
);
values(
  'Eduarda',
  'Rua Eduarda, 4 - Barueri/SP',
  '11 44444-4444',
  'eduarda4@gmail.com',
  '2024-08-28'
);
values(
  'Israel',
  'Rua Israel, 1 - Barueri/SP',
  '11 11111-1111',
  'rael1@gmail.com',
  '2024-08-28'
);
values(
  'Letícia',
  'Rua Letícia, 2 - Barueri/SP',
  '11 22222-2222',
  'leticia2@gmail.com',
  '2024-08-28'
);
values(
  'Eduardo',
  'Rua Eduardo, 3 - Barueri/SP',
  '11 33333-3333',
  'dudu3@gmail.com',
  '2024-08-28'
);

insert into tb_emprestimo( 
  data_emprestimo, 
  data_devolucao, 
  id_membro, 
  id_livro
)
values(
  '2024-08-28',
  '2024-09-28',
  2,
  3
);

insert into tb_genero(nome)
values
  ('Romance'), 
  ('Suspense'), 
  ('Terror'),
  ('Autobiografia'),
  ('Ficção');
  
  
alter table tb_livro 
  add foreign key (id_genero)
  references tb_genero(id_genero); 

alter table Manutencoes rename tb_manutencoes;  

grant all privileges on banco.* to 'user'@'localhost';
===================================================================================================================================================================

 -- atividade - 2 --
 
--Criação do Banco de Dados:
CREATE DATABASE Conserto_JA;
	USE ConsertoJA;

--Criação das Tabelas:
CREATE TABLE tb_clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    CPF_CNPJ VARCHAR(30) UNIQUE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(30) NOT NULL, 
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE tb_tecnicos(
    id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    CPF VARCHAR(15) UNIQUE NOT NULL,
    especializacao VARCHAR(150) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE tb_equipamentos(
    id_equipamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(300) NOT NULL,
    numero_serie VARCHAR(70) UNIQUE NOT NULL,
    data_aquisicao DATE NOT NULL,
    status ENUM('em manutenção', 'ativo', 'inativo') NOT NULL
);

CREATE TABLE tb_manutencoes(
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_tecnico INT NOT NULL,
    id_equipamento INT NOT NULL,
    data_manutencao DATE NOT NULL,
    descricao_problema TEXT NOT NULL,
    descricao_solucao TEXT NOT NULL,
    pecas_trocadas TEXT NOT NULL,
    custo DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente),
    FOREIGN KEY (id_tecnico) REFERENCES tb_tecnicos(id_tecnico),
    FOREIGN KEY (id_equipamento) REFERENCES tb_equipamentos(id_equipamento)
);

CREATE TABLE tb_contratos(
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    descricao_servicos TEXT NOT NULL,
    valor_mensal DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

--Inserção de Dados:
INSERT INTO tb_clientes (nome_completo, CPF_CNPJ, endereco, telefone, email)
VALUES ('Gabriel Soares', '13131313131', 'Rua Gabriel, 13', '(13) 13131-3131', 'gabriel13@gmail.com'),
	   ('Eduarda da Jesus', '44444444444', 'Rua Eduarda, 4', '(44) 44444-4444', 'eduarda4@gmail.com'),
       ('Giovanna Xavier', '77777777777', 'Rua Giovanna, 7', '(77) 77777-7777', 'giovanna7@gmail.com'),
	   ('Israel Junior', '33333333333', 'Rua Israel, 3', '(33) 33333-3333', 'israel3@gmail.com');

INSERT INTO tb_tecnicos (nome_completo, CPF, especializacao, telefone, email)
VALUES ('Letícia Souza', '32323232323', 'Hardware', '(32) 32323-2323', 'leticia32@gmail.com'),
       ('Eduardo Couto', '23232323232', 'Software', '(23) 23232-3232', 'eduardo23@gmail.com'),
	   ('Isabelli Silva', '111.111.111-11', 'Software', '(11) 11111-1111', 'isabelli1@gmail.com'),
	   ('Laura Sofia', '222.222.222-22', 'Software', '(22) 22222-2222', 'laura2@gmail.com');
	   
INSERT INTO tb_equipamentos (descricao, numero_serie, data_aquisicao, status)
VALUES ('Computador Dell', 'SN123456', '2023-02-20', 'em manutenção'),
       ('IMac', 'SN654321', '2024-04-01', 'ativo'),
	   ('notebook', 'SN78910', '2023-06-15', 'inativo'),
	   ('MacBook ', 'SN01987', '2024-05-25', 'em manutenção');

INSERT INTO tb_manutencoes (id_cliente, id_tecnico, id_equipamento, data_manutencao, descricao_problema, descricao_solucao, pecas_trocadas, custo)
VALUES (1, 1, 1, '2024-07-07', 'Não liga', 'Substituição da fonte', 'Fonte de energia', 250),
       (2, 2, 2, '2024-07-13', 'Tela Quebrada', 'Trocar a Tela', 'Tela', 450);

INSERT INTO tb_contratos (id_cliente, data_inicio, data_fim, descricao_servicos, valor_mensal)
VALUES (1, '2024-06-30', '2024-07-27', 'Manutenção mensal de equipamentos', 150),
       (2, '2024-07-12', '2025-07-23', 'Suporte técnico e revisão', 250);


--forma crescente:
SELECT * FROM tb_clientes
ORDER BY nome_completo ASC;

--forma decrescente:
SELECT * FROM tb_clientes
ORDER BY nome_completo DESC;

--Listar somente o nome, e-mail e especialização de todos os técnicos da empresa em ordem crescente:
SELECT nome_completo, email, especializacao FROM tb_tecnicos
ORDER BY nome_completo ASC;

--Listar todos os equipamentos onde a data de aquisição foi no ano de 2023:
SELECT * FROM tb_equipamentos
WHERE YEAR(data_aquisicao) = 2023;

--Listar todos os equipamentos que foram adquiridos no primeiro semestre de 2024:
SELECT * FROM tb_equipamentos
WHERE data_aquisicao BETWEEN '2024-01-01' AND '2024-06-30';

--Listar todos os contratos de manutenção onde o valor mensal seja maior do que R$ 200,00:
SELECT * FROM tb_contratos
WHERE valor_mensal > 200.00;

--Listar todos os contratos de manutenção onde o valor mensal seja menor ou igual a R$ 300,00 e que foram contratados no ano de 2024:
SELECT * FROM tb_contratos
WHERE valor_mensal <= 300.00 AND YEAR(data_inicio) = 2024;





ALTER TABLE tb_manutencao
ADD COLUMN id_tecnico INT,
ADD COLUMN id_equipamento INT,
ADD CONSTRAINT fk_tecnico
    FOREIGN KEY (id_tecnico) REFERENCES tb_tecnicos(id_tecnico),
ADD CONSTRAINT fk_equipamento
    FOREIGN KEY (id_equipamento) REFERENCES tb_equipamentos(id_equipamento);

=========================================================================================================================================

 -- atividade - 3 --

-- Criação do Banco de Dados:
CREATE DATABASE startup;
GRANT ALL PRIVILEGES ON startup.* TO 'user'@'localhost';

-- Usando o banco de dados
USE startup;

-- Criação das Tabelas:
CREATE TABLE tb_empresa(
	id_empresa int auto_increment primary key,
	nome_empresa varchar(100) not null,
	CNPJ varchar(50) not null,
	ramo_atividade varchar(100) not null,
	remuneracao varchar(50) not null,
	email_contato varchar(50) not null,
	telefone_contato varchar(30) not null
);

CREATE TABLE tb_area_de_atuacao(
	id_area_atuacao int auto_increment primary key,
	nome_area varchar(100) not null
);

CREATE TABLE tb_nivel_de_escolaridade(
	id_nivel_escolaridade int auto_increment primary key,
	descriacao_nivel varchar(70) not null
);

CREATE TABLE tb_vaga(
	id_vaga int auto_increment primary key,
	titulo varchar(50) not null,
	descricao varchar(100) not null,
	id_empresa int not null,
	id_area_atuacao int not null,
	id_nivel_escolaridade int not null,
	experiencia_necessaria varchar(150) not null,
	remuneracao varchar(50) not null,
	tipo_contratacao varchar(50) not null,
	data_inicio_publicacao date not null,
	data_termino_publicacao date not null,
	CONSTRAINT fk_empresa FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa),
	CONSTRAINT fk_area_atuacao FOREIGN KEY (id_area_atuacao) REFERENCES tb_area_de_atuacao(id_area_atuacao),
	CONSTRAINT fk_nivel_escolaridade FOREIGN KEY (id_nivel_escolaridade) REFERENCES tb_nivel_de_escolaridade(id_nivel_escolaridade)
);

CREATE TABLE tb_candidato(
	id_candidato int auto_increment primary key,
	nome_completo varchar(150) not null,
	email varchar(150) not null,
	telefone varchar(30) not null,
	formacao_academica varchar(70) not null,
	experiencia_profissional varchar(200) not null,
	habilidades varchar(150) not null,
	curriculo varchar(100) not null,
	senha varchar(60) not null
);

CREATE TABLE tb_candidatura(
	id_candidatura int auto_increment primary key,
	id_vaga int not null,
	id_candidato int not null,
	data_candidatura date not null,
	CONSTRAINT fk_vaga FOREIGN KEY (id_vaga) REFERENCES tb_vaga(id_vaga),
	CONSTRAINT fk_candidato FOREIGN KEY (id_candidato) REFERENCES tb_candidato(id_candidato)
);

-- GPT:
-- Criação do Banco de Dados:
CREATE DATABASE startup;
GRANT ALL PRIVILEGES ON startup.* TO 'user'@'localhost';

-- Usando o banco de dados
USE startup;

-- Criação das Tabelas:
CREATE TABLE tb_empresa(
	id_empresa int auto_increment primary key,
	nome_empresa varchar(100) not null,
	CNPJ varchar(20) not null,
	ramo_atividade varchar(100) not null,
	remuneracao DECIMAL(10, 2) not null,  -- Ajuste para decimal
	email_contato varchar(50) not null,
	telefone_contato varchar(30) not null
);

CREATE TABLE tb_area_de_atuacao(
	id_area_atuacao int auto_increment primary key,
	nome_area varchar(100) not null
);

CREATE TABLE tb_nivel_de_escolaridade(
	id_nivel_escolaridade int auto_increment primary key,
	descricao_nivel varchar(70) not null
);

CREATE TABLE tb_vaga(
	id_vaga int auto_increment primary key,
	titulo varchar(50) not null,
	descricao varchar(100) not null,
	id_empresa int not null,
	id_area_atuacao int not null,
	id_nivel_escolaridade int not null,
	experiencia_necessaria varchar(150) not null,
	remuneracao DECIMAL(10, 2) not null,  -- Ajuste para decimal
	tipo_contratacao varchar(50) not null,
	data_inicio_publicacao date not null,
	data_termino_publicacao date not null,
	CONSTRAINT fk_empresa FOREIGN KEY (id_empresa) REFERENCES tb_empresa(id_empresa),
	CONSTRAINT fk_area_atuacao FOREIGN KEY (id_area_atuacao) REFERENCES tb_area_de_atuacao(id_area_atuacao),
	CONSTRAINT fk_nivel_escolaridade FOREIGN KEY (id_nivel_escolaridade) REFERENCES tb_nivel_de_escolaridade(id_nivel_escolaridade)
);

CREATE TABLE tb_candidato(
	id_candidato int auto_increment primary key,
	nome_completo varchar(150) not null,
	email varchar(150) not null,
	telefone varchar(30) not null,
	formacao_academica varchar(70) not null,
	experiencia_profissional varchar(200) not null,
	habilidades varchar(150) not null,
	curriculo varchar(100) not null,
	senha varchar(60) not null
);

CREATE TABLE tb_candidatura(
	id_candidatura int auto_increment primary key,
	id_vaga int not null,
	id_candidato int not null,
	data_candidatura date not null,
	CONSTRAINT fk_vaga FOREIGN KEY (id_vaga) REFERENCES tb_vaga(id_vaga),
	CONSTRAINT fk_candidato FOREIGN KEY (id_candidato) REFERENCES tb_candidato(id_candidato)
);


-- Inserindo dados na tabela tb_empresa
INSERT INTO tb_empresa (nome_empresa, CNPJ, ramo_atividade, remuneracao, email_contato, telefone_contato)
VALUES 
('Tech Solutions', '12345678910987', 'Tecnologia da Informação', '8500.00', 'contato@techsolutions.com', '(11) 98765-4321'),
('Construtora XYZ', '78910987654321', 'Construção Civil', '10500.00', 'contato@construtoraxyz.com', '(21) 99876-5432');

-- Inserindo dados na tabela tb_area_de_atuacao
INSERT INTO tb_area_de_atuacao (nome_area)
VALUES 
('Desenvolvimento de Software'),
('Marketing'),
('Recursos Humanos');

-- Inserindo dados na tabela tb_nivel_de_escolaridade
INSERT INTO tb_nivel_de_escolaridade (descricao_nivel)
VALUES 
('Ensino Médio Completo'),
('Graduação Completa'),
('Pós-Graduação Completa');

-- Inserindo dados na tabela tb_vaga
INSERT INTO tb_vaga (titulo, descricao, id_empresa, id_area_atuacao, id_nivel_escolaridade, experiencia_necessaria, remuneracao, tipo_contratacao, data_inicio_publicacao, data_termino_publicacao)
VALUES 
('Desenvolvedor Backend', 'Desenvolvimento de APIs e integrações', 1, 1, 2, '2 anos de experiência com Node.js', '8500.00', 'CLT', '2024-09-01', '2024-09-30'),
('Analista de Marketing', 'Planejamento e execução de campanhas', 1, 2, 2, '1 ano de experiência em marketing digital', '6000.00', 'PJ', '2024-09-05', '2024-10-05');

-- Inserindo dados na tabela tb_candidato
INSERT INTO tb_candidato (nome_completo, email, telefone, formacao_academica, experiencia_profissional, habilidades, curriculo, senha)
VALUES 
('Gabriel Silva', 'gabriel.silva@email.com', '(11) 99999-9999', 'Graduação em Ciências da Computação', 'Desenvolvedor Web com 3 anos de experiência', 'JavaScript, Node.js, MySQL', 'curriculo_gabriel.pdf', 'senha123'),
('Giovanna Xavier', 'giovanna.xavier@email.com', '(21) 98888-8888', 'Graduação em Marketing', 'Analista de Marketing com 2 anos de experiência', 'SEO, Google Ads, Redes Sociais', 'curriculo_ana.pdf', 'senha456');

-- Inserindo dados na tabela tb_candidatura
INSERT INTO tb_candidatura (id_vaga, id_candidato, data_candidatura)
VALUES 
(1, 1, '2024-09-10'),
(2, 2, '2024-09-12');

=========================================================================================================================================
 
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 