create database faculdadeluz;

show databases;

use faculdadeluz;

create table endereco (
	id_endereco integer auto_increment primary key,
    numero varchar(10) not null,
    bairro varchar(100) not null,
    cidade varchar(50) not null,
    estado varchar(50) not null,
    cep varchar(8) not null
);

create table curso (
	id_curso integer auto_increment primary key,
    nome_curso varchar(100) not null,
    codigo_curso varchar(5),
    periodo varchar(15) not null
);
    
create table aluno ( 
	id_aluno integer auto_increment primary key,
    nome_completo varchar(100) not null,
    cpf varchar(11) not null,
    data_nascimento date not null,
    telefone varchar(20),
    email varchar(320),
    matricula varchar(10),
    id_endereco integer,
    foreign key (id_endereco) references endereco(id_endereco),
    id_curso integer,
    foreign key (id_curso) references curso(id_curso)
);
    
create table professor (
	id_professor integer auto_increment primary key,
    nome_completo varchar(100),
    cpf varchar (11),
    telefone varchar(20),
    email varchar(320),
    id_endereco integer,
    foreign key (id_endereco) references endereco(id_endereco)
);
    
create table materias (
	id_materias integer auto_increment primary key,
    nome_materia varchar(50),
    carga_horaria integer,
    professor varchar (100),
    id_curso integer,
    foreign key (id_curso) references curso(id_curso),
    id_professor integer,
    foreign key (id_professor) references professor(id_professor)
);
    
insert into
	endereco (numero, bairro, cidade, estado, cep) 
values
	(101, 'Centro', 'São Paulo', 'SP', '01000000'),
	(202, 'Mooca', 'São Paulo', 'SP', '03100000'),
	(303, 'Vila Mariana', 'São Paulo', 'SP', '04000000'),
	(404, 'Santana', 'São Paulo', 'SP', '02000000'),
	(505, 'Liberdade', 'São Paulo', 'SP', '01500000')
;

select * from endereco;

insert into
	curso (nome_curso, codigo_curso, periodo)
values
	('Análise e Desenvolvimento de Sistemas', '11101', 'Noturno'),
	('Engenharia de Software', '22102', 'Matutino'),
	('Ciência da Computação', '33103', 'Integral'),
	('Sistemas de Informação', '44104', 'Noturno'),
	('Banco de Dados', '55105', 'Matutino')
;
    
select * from curso;

insert into
	aluno (nome_completo, cpf, data_nascimento, telefone, email, matricula, id_endereco, id_curso)
values
    ('Ana Clara Souza', '12345678901', '1999-03-15', '11987654321', 'anaclara.souza@outlook.com', '20240001', '1', '4'),
    ('João Pedro Lima', '23456789012', '2000-07-22', '11976543210', 'joao.pedro.lima@gmail.com', '20240002', '2', '2'),
    ('Maria Fernanda Oliveira', '34567890123', '1998-11-05', '11965432109', 'maria.fernanda@hotmail.com', '20240003', '1', '5'),
    ('Lucas Gabriel Santos', '45678901234', '1997-04-10', '11954321098', 'lucas.gabriel@gmail.com', '20240004', '5', '1'),
    ('Beatriz Alves Ferreira', '56789012345', '2001-02-28', '11943210987', 'beatriz.alves@gmail.com', '20240005', '4', '3'),
    ('Andre Oliveira Silva', '67890123456', '1998-12-01', '11987813456', 'tony.oliveira@gmail.com', '20240006', '2', '5')
;
    
select * from aluno;

insert into
	professor (nome_completo, cpf, telefone, email, id_endereco)
values
	('Carlos Eduardo Silva', '12345678901', '11987654321', 'carlos.eduardo.prof@gmail.com', 1),
	('Mariana Oliveira Souza', '23456789012', '11976543210', 'mari.oliveira@hotmail.com', 3),
	('Roberto Almeida Santos', '34567890123', '11965432109', 'roberto.almeida015@hotmail.com', 2),
	('Fernanda Lima Pereira', '45678901234', '11954321098', 'fernanda.lima87@gmail.com', 5),
	('Paula Rodrigues Alves', '56789012345', '11943210987', 'paula.rodrigues@outlook.com', 4)
;
    
select * from professor;

insert into
	materias (nome_materia, carga_horaria, professor, id_curso, id_professor)
values
	
-- Análise e Desenvolvimento de Sistemas
	('Programação Estruturada', 60, 'Carlos Eduardo', 1, 1),
	('Banco de Dados I', 70, 'Mariana Oliveira', 1, 2),
	('Engenharia de Software', 120, 'Roberto Almeida', 1, 3),
	('Algoritmos e Lógica', 80, 'Fernanda Lima', 1, 4),
	('Desenvolvimento Web', 60, 'Paula Rodrigues', 1, 5),

-- Engenharia de Software
	('Engenharia de Requisitos', 80, 'Carlos Eduardo', 2, 1),
	('Modelagem de Sistemas', 40, 'Mariana Oliveira', 2, 2),
	('Gestão de Projetos', 30, 'Roberto Almeida', 2, 3),
	('Qualidade de Software', 70, 'Fernanda Lima', 2, 4),
	('Testes de Software', 60, 'Paula Rodrigues', 2, 5),

-- Ciência da Computação
	('Cálculo I', 60, 'Carlos Eduardo', 3, 1),
	('Estruturas de Dados', 50, 'Mariana Oliveira', 3, 2),
	('Compiladores', 60, 'Roberto Almeida', 3, 3),
	('Redes de Computadores', 45, 'Fernanda Lima', 3, 4),
	('Sistemas Operacionais', 60, 'Paula Rodrigues', 3, 5),

-- Sistemas de Informação
	('Administração de Sistemas', 60, 'Carlos Eduardo', 4, 1),
	('Segurança da Informação', 90, 'Mariana Oliveira', 4, 2),
	('Big Data', 60, 'Roberto Almeida', 4, 3),
	('Gestão de Redes', 60, 'Fernanda Lima', 4, 4),
	('Sistemas Distribuídos', 60, 'Paula Rodrigues', 4, 5),

-- Banco de Dados
	('Modelagem de Dados', 60, 'Carlos Eduardo', 5, 1),
	('Banco de Dados II', 70, 'Mariana Oliveira', 5, 2),
	('SQL Avançado', 100, 'Roberto Almeida', 5, 3),
	('Data Warehousing', 50, 'Fernanda Lima', 5, 4),
	('Mineração de Dados', 60, 'Paula Rodrigues', 5, 5)
;

select * from materias;

