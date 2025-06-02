Create database exercicio01;
use exercicio01;

Create table Cds(
cod_cd numeric (3) primary key,
nm_cd varchar (50) not null,
dtCompra date () not null,
ValorPg numeric (8,2) not null,
Localcomp varchar (20) not null,
Album char (1) not null,
);

create table music(
CodigoCd numeric (3) references cds(cod_cd),
numero  numeric (2) not null,
nome varchar (50) not null,
artista varchar (50) not null,
duracao numeric (4) not null,
);



