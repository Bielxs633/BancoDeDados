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

==========================================================================================================================================

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

