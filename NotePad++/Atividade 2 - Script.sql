 -- atividade 2 --
 
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
