 -- atividade 3 --

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
 