Create database atividade1;
use atividade1;

Create table CIDADE(
Codigo numeric (4) not null primary key,
nome varchar (30) not null,
);

Create table SOCIO(
Cpf char (11) not null primary key,
nome varchar (30) not null,
data_nasc date not null,
RG varchar (15) not null,
cidade numeric (4) REFERENCES CIDADE,
);

ALTER TABLE CIDADE
ADD UF char (10) not null;

ALTER TABLE SOCIO
ADD fone varchar (10);

ALTER TABLE SOCIO
ADD sexo char (1) not null;


Create table SETOR(
Codigo numeric (3) not null primary key,
nome varchar (30) not null,
);

ALTER TABLE SOCIO
ADD setor numeric (3) not null references SETOR;

Create table DEPENDENTE(
Socio char (11) references SOCIO,
numero numeric (4) not null primary key,
nome varchar (30) not null,
datanasc date  not null,
);

Create table Cargo(
cod_cargo numeric (4) not null Primary key,
salario numeric (8,2),
nm_cargo varchar (30) unique not null,
);

Create table funcionario(
matricula numeric (4) not null primary key,
dt_adm date not null,
cep char (8),
nome_fun varchar (30) not null,
);

insert into CIDADE (Codigo, nome, UF) values
	(5164897203, 'São Paulo', 'São Paulo');

insert into SOCIO (Cpf,nome,data_nasc, RG, cidade, fo, sexo) values
(12965609855, 'kevin fulano', '30/06/1995', '5552640575');

-- Giulia e Bianca