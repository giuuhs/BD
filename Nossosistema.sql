create database nssProjeto;
use nssProjeto;

create table cliente(
cod_clie numeric (4) primary key,
nome_clie varchar (50) not null,
endereco varchar (30),
cidade varchar (15),
cep char (8),
uf char (2),
cnpj char (16),
ie char (12),
);

create table vendedor(
cod_ven numeric (4) primary key,
salario_fixo numeric (6),
comissao char (1),
nome_ven varchar (50) not null,
);

create table pedido(
num_pedido numeric (4) primary key,
pr_entrega numeric (3) not null,
cod_clieid numeric (4),
cod_venid numeric (4),
foreign key (cod_clieid) references cliente(cod_clie),
foreign key (cod_venid) references vendedor (cod_ven),
);

create table produto(
cod_prod numeric (4) primary key,
unidade varchar (3),
descricao varchar (20),
val_unit numeric (8,2),
);

create table item_pedido(
quant numeric (8,2),
num_pedidoid numeric (4),
cod_prodid numeric (4),
foreign key (num_pedidoid) references pedido(num_pedido),
foreign key (cod_prodid) references produto(cod_prod),
);

INSERT INTO cliente(cod_clie, nome_clie, endereco, cidade, cep, uf, cnpj, ie) VALUES
(720, 'Ana', 'Rua 17 n.19','Niterói', 24358310, 'RJ', 12113231/0001-34, 2134),
(870, 'Flávio', 'Av. Pres. Vargas, 10','São Paulo', 227631, 'SP', 22534126/9387-9, 4631),
(110, 'Jorge', 'Rua Caiapó, 13', 'Curitiba', 30078500, 'PR', 145127649884-9, NULL),
(222, 'Lúcia','Rua Itibira, 123', 'Belo Horizonte', 22124391, 'MG', 283152123/9348-8, 2985),
(830, 'Maurício', 'Av. Paluista, 1236', 'São Paulo', 3012638, 'SP', 32816985/7465-6, 9343),
(130, 'Edmar', 'Rua da Paria,s/n', 'Salvador', 30079300, 'BA', 23463284/234-9, 7121),
(410, 'Rodolfo', 'Largo da Lapa,27', 'Rio de Janeiro', 30078900, 'RJ', 12835128/2346-9, 7431),
(20, 'Beth', 'Av. Climério, 45', 'São Paulo', 25679300, 'SP', 32485126/324-8, 9280),
(157, 'Paulo', 'Trav. Moraes, casa 3', 'Londrina', null, 'PR', 3248223/324-2, 1923),
(180, 'Lívio', 'Av. Beira Mar, 1256','Florianópolis', 30077500, 'SC', 12736571/2347-4, 1111),
(260, 'Susana', 'Rua Lopes Mandes, 12', 'Niterói', 30046500, 'RJ', 21763571/232-9, 2530),
(290, 'Renato', ' Rua Meireles, 123', 'São Paulo', 30225900, 'SP', 13276571/1231-4, 1820),
(390, 'Sebastião', 'Rua da Igreja, 10', 'Uberaba', 30438700, 'MG', 31276547/213-3, 9071),
(234,'José', 'Quadra 3, Bl.3, sl. 1003', 'Brasília', 22841650, 'DF', 21763576/1232-3, 2931);

INSERT INTO vendedor(cod_ven, nome_ven, salario_fixo, comissao) VALUES
(209, 'José', 1800, 'C'),
(111, 'Carlos', 2490, 'A'),
(11, 'João', 2780, 'C'),
(240,'Antonio',9500, 'C'),
(720, 'Felipe', 4600, 'A'),
(213, 'Jonas', 2300, 'A'),
(101, 'João', 2650, 'C'),
(310, 'Josias', 870, 'B'),
(250, 'Maurício', 2930, 'B');

insert into produto (cod_prod, unidade, descricao, val_unit) values
(25, 'KG', 'Queijo', 0.97),
(31, 'Bar', 'Choicolate',0.87),
(78, 'L', 'Vinho', 2.00),
(22, 'M', 'Linho', 0.11),
(11, 'SAC', 'Açúcar', 0.30),
(53, 'M', 'Linha', 1.80),
(13, 'G', 'Ouro', 6.18),
(45, 'M', 'Madeira', 0.25),
(87, 'M', 'Cano', 1.97),
(77, 'M', 'Papel', 1.05);

insert into pedido (num_pedido, pr_entrega, cod_clieid, cod_venid) values
(121, 20, 410, 209),
(97, 20, 720, 101),
(101, 15, 720, 101),
(137, 20, 720, 720),
(148, 20, 720,101),
(189, 15, 870, 213),
(104, 30, 110, 101),
(203, 30, 830, 250),
(98, 20, 410, 209),
(143, 30, 20, 111),
(105, 30, 180, 240),
(111, 15, 260, 240),
(103, 20, 260, 11),
(91, 20, 260, 11),
(138, 20, 260, 11),
(108, 15, 290, 310),
(119, 30, 390, 250),
(127, 10, 410, 11);


insert into item_pedido (num_pedidoid, cod_prodid, quant) values
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(101, 78, 18),
(101, 13, 5),
(98, 77, 5),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 73, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(143, 78, 10);

-- 1 --
SELECT * FROM vendedor;

-- 2 --
SELECT nome_ven, comissao FROM vendedor;

-- 3 --
SELECT nome_ven, salario_fixo FROM vendedor
ORDER BY salario_fixo;

-- 4 --
SELECT * FROM pedido;

-- 5 --
--SELECT num_pedidoid, cod_prodid FROM item_pedido ORDER BY 

-- 6 --
SELECT * FROM pedido ORDER BY cod_venid;

--Exercícios: Base Nosso Sistema

--Criar um relatório que mostre o nome do vendedor e seus pedidos em ordem de pedido de forma crescente.

--Criar um relatório que mostre o número do pedido, nome do vendedor e nome do cliente.

--Mostre o nome do vendedor e o nome dos clientes que ele já atendeu.

--Mostre o pedido (número) e a descrição dos produtos que ele tem.

--Crie um relatório que mostre os produtos comprados por cada cliente.

--Crie um relatório que mostre os produtos vendidos por cada vendedor.

--Qual cliente comprou chocolate?

--Qual vendedor vendeu mais chocolate?

-- INNER JOIN
SELECT nome_ven, num_pedido from vendedor INNER JOIN pedido ON cod_ven = cod_venid;

SELECT nome_ven, num_pedido, nome_clie from vendedor, cliente INNER JOIN pedido ON cod_venid = cod_venid and cod_clie = cod_clieid;

SELECT v.nome_ven, c.nome_clie from pedido as p INNER JOIN vendedor as v ON v.cod_ven = p.cod_venid INNER JOIN cliente as c ON c.cod_clie = p.cod_clieid;

