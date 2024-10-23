 -- atividade 1 --

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
