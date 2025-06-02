create database serie;
use serie;

create table atores(
cod_ator numeric(8) primary key not null,
nome varchar (50) not null, 
data_nasc date,
);

create table episodio(
nome_ep varchar (15),
temporada numeric (5),
cod_ep numeric (8) primary key not null,
duracao numeric,
sinopse varchar (250),
);

create table direcao(
nome_diretor varchar (20) not null,
cod_diretor numeric (8) primary key not null, 
cod_ep numeric (8) foreign key,
);

create table avaliacao(
cod_av numeric (8) not null primary key,
nota numeric (5) not null,
comentário varchar (200),
cod_ep numeric (8) foreign key,
);