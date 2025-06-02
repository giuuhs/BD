--Bianca e Giulia

Create database Bibioteca;
use Bibioteca;

create table Cliente(
Cod_cliente int primary key,
nome_cliente varchar (30),
email_cliente varchar (100),
rg_cliente varchar (10),
);

create table Editora(
cod_editora int primary key,
nome_editora varchar (20)
);

create table Autores(
cod_autores int primary key,
email_autores varchar(100),
nome_autores varchar (30)
);

create table Livros (
ISBN varchar(20) primary key,
edicao int,
custo numeric,
titulo varchar (20)
);

create table Exemplares(
cod_exemplares int primary key,
data_aquisicao date
);

insert into Cliente (Cod_cliente, nome_cliente, email_cliente, rg_cliente )Values
(1,'Marivaldo Pereira Azevedo', 'mariperei@gmail.com', '11930102918', 'Rua Adelha', '98763-023','Osasco'),
(2, 'Cristina De Paula Medeiros','crisdepaula15@gmail.com', '4473219829', 'Rua BoliBolí', '87320-398','Jardins'),
(3, 'Antonella Ferreira Budri','antferbud@gmail.com','9844988329', 'Rua Bolívia', '75149-169', 'Mairiporã');

INSERT INTO Editora(cod_editora, nome_editora ) Values
(1,'Record'),
(2,'Arqueiro'),
(3,'Intrinseca');
insert into Autores (cod_autores, nome_autores, email_autores) Values
(1,'Colleen Hoover', 'colleenpertubada09@gmail.com'),
(2,'Ali Hazelwood', 'aliromafada@gmail.com'),
(3,'Stephen King', 'kinghorror@gmail.com');

insert into Livros (ISBN, edicao, custo, titulo) Values
('978-1', 1, 29.90, 'Dom Casmurro'),
('978-2', 1, 35.00, 'A Hora da Estrela'),
('978-3', 2, 40.00, 'Alguma Poesia');

insert into Exemplares (cod_exemplares, data_aquisicao) Values
(1, '2023-01-10'),
(2, '2023-05-15'),
(3, '2023-08-20');