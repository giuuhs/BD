create database Exercicios
GO
use Exercicios
GO

CREATE TABLE clientes (
    id_clie INT PRIMARY KEY,
    nome_clie VARCHAR(100)
);

INSERT INTO clientes VALUES
(1, 'Ana'),
(2, 'Bruno'),
(3, 'Carla'),
(4, 'Diego');

-- Tabela de produtos
CREATE TABLE produtos (
    id_prod INT PRIMARY KEY,
    nome_prod VARCHAR(100),
    preco DECIMAL(10, 2)
);

INSERT INTO produtos VALUES
(1, 'Notebook', 3000.00),
(2, 'Mouse', 50.00),
(3, 'Teclado', 120.00);


-- Tabela de pedidos
CREATE TABLE pedidos (
    id_ped INT PRIMARY KEY,
    clienteped_id INT,
    produtoped_id INT,
    quantidade INT,
    FOREIGN KEY (clienteped_id) REFERENCES clientes(id_clie),
    FOREIGN KEY (produtoped_id) REFERENCES produtos(id_prod)
);

INSERT INTO pedidos VALUES
(1, 1, 1, 1), -- Ana comprou 1 Notebook
(2, 1, 2, 2), -- Ana comprou 2 Mouses
(3, 2, 3, 1), -- Bruno comprou 1 Teclado
(4, 3, 2, 1); -- Carla comprou 1 Mouse
-- Diego (id=4) não fez pedidos

INSERT INTO clientes VALUES
(5, 'Eduarda'),
(6, 'Fernanda'),
(7, 'Felipe'),
(8, 'João');

-- Novos produtos
INSERT INTO produtos VALUES
(4, 'Monitor', 800.00),
(5, 'Headset', 200.00),
(6, 'Impressora', 900.00);

-- Novos pedidos
INSERT INTO pedidos VALUES
(5, 5, 4, 1), -- Eduarda comprou 1 Monitor
(6, 6, 2, 3), -- Fernanda comprou 3 Mouses
(7, 7, 5, 2), -- Felipe comprou 2 Headsets
(8, 8, 6, 1), -- João comprou 1 Impressora
(9, 1, 3, 1), -- Ana comprou 1 Teclado
(10, 1, 2, 1); -- Ana comprou +1 Mouse

--Liste todas as combinações possíveis entre clientes e produtos. Cada linha deve mostrar o nome do cliente e o nome do produto.
select nome_clie, nome_prod from clientes CROSS JOIN produtos;

--Mostra apenas quem comprou algo
select nome_clie from clientes c inner join pedidos p on c.id_clie = p.clienteped_id;

--Todos os clientes e seus pedidos (mesmo quem não comprou nada)
select nome_clie, nome_prod, quantidade from clientes c left join pedidos p on c.id_clie = p.clienteped_id
left join produtos pr on p.produtoped_id = pr.id_prod;

--Todos os produtos e seus pedidos (mesmo os nunca vendidos)
select  nome_clie, nome_prod, quantidade from clientes c left join pedidos p on c.id_clie = p.clienteped_id 
left join produtos pr on p.produtoped_id = pr.id_prod;

--Clientes que nunca compraram nada
select nome_clie, quantidade, nome_prod from clientes c left join pedidos p on c.id_clie = p.clienteped_id 
left join produtos pr on p.produtoped_id = pr.id_prod where id_ped is null;

--Podutos não vendidos
select nome_prod, quantidade from produtos pr left join pedidos p on pr.id_prod = p.produtoped_id where p.produtoped_id is null;

--Quantidade total de cada produto vendido por cliente
select c.nome_clie, pr.nome_prod,sum(p.quantidade) as total_conta from clientes c 
INNER JOIN pedidos p on c.id_clie = p.clienteped_id
INNER JOIN produtos pr ON p.produtoped_id = pr.id_prod
GROUP BY c.nome_clie, pr.nome_prod;

--Total gasto por cada cliente
select c.nome_clie, sum(p.quantidade * pr.preco) as total_gasto from produtos pr 
left join pedidos p on pr.id_prod = p.produtoped_id
left join clientes c on p.clienteped_id = c.id_clie
group by c.nome_clie;

--Produto mais caro comprado por cada cliente
select c.nome_clie, max(pr.preco)as prod_caro from clientes c 
inner join pedidos p on p.clienteped_id = c.id_clie 
inner join produtos pr on p.produtoped_id = pr.id_prod
GROUP BY c.nome_clie;

--Quantidade total vendida de cada produto                          
select pr.nome_prod, sum(p.quantidade) as total from pedidos p 
left join produtos pr on p.produtoped_id = pr.id_prod
group by pr.nome_prod;

--Clientes cujo nome começa com "A"
select * from clientes where nome_clie LIKE 'A%';

--Clientes cujo nome termina com "a"
select * from clientes where nome_clie LIKE '%A';

--Produtos cujo nome contém "o"
select * from produtos where nome_prod like '%o%';

--Pedidos feitos por clientes cujo nome começa com "F"
select c.nome_clie, p.quantidade, pr.nome_prod from pedidos p left join clientes c on p.clienteped_id = c.id_clie 
left join produtos pr on p.produtoped_id = pr.id_prod
where nome_clie like 'F%';
