Create database exercicio02;
use exercicio02;

Create table Cds(
matr_empr char (6) primary key,
nm_empr varchar (12) not null,
dtCompra date () not null,
ValorPg numeric (8,2) not null,
Localcomp varchar (20) not null,
Album char (1) not null,
);

sp_help;