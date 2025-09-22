CREATE DATABASE Loja; 

USE Loja; 

 -- Bianca Pereira Cunha e Giulia De Souza

-- Clientes 

CREATE TABLE Cliente ( 

    ClienteID INT PRIMARY KEY, 

    Nome NVARCHAR(50), 

    Cidade NVARCHAR(50) 

); 

 

-- Produtos (Livros) 

CREATE TABLE Produto ( 

    ProdutoID INT PRIMARY KEY, 

    Titulo NVARCHAR(100), 

    Preco DECIMAL(10,2) 

); 

 

-- Pedidos 

CREATE TABLE Pedido ( 

    PedidoID INT PRIMARY KEY, 

    ClienteID INT, 

    DataPedido DATE, 

    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID) 

); 

 

-- Itens do Pedido 

CREATE TABLE ItemPedido ( 

    ItemID INT PRIMARY KEY, 

    PedidoID INT, 

    ProdutoID INT, 

    Quantidade INT, 

    FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID), 

    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID) 

); 

 

 
-- Clientes 

INSERT INTO Cliente VALUES 

(1, 'Ana Souza', 'São Paulo'), 

(2, 'Carlos Lima', 'Rio de Janeiro'), 

(3, 'Fernanda Alves', 'Belo Horizonte'); 

 

-- Produtos 

INSERT INTO Produto VALUES 

(1, 'SQL para Iniciantes', 50.00), 

(2, 'Java Avançado', 120.00), 

(3, 'Python Essencial', 80.00); 

 

-- Pedidos 

INSERT INTO Pedido VALUES 

(1, 1, '2025-08-01'), 

(2, 2, '2025-08-05'), 

(3, 1, '2025-08-10'); 

 

-- Itens do Pedido 

INSERT INTO ItemPedido VALUES 

(1, 1, 1, 2),  -- Ana comprou 2 livros de SQL 

(2, 1, 3, 1),  -- Ana comprou 1 livro de  Python 

(3, 2, 2, 1),  -- Carlos comprou 1 livro de Java 

(4, 3, 3, 3);  -- Ana comprou 3 livro de Python 

--1
SELECT Nome, DataPedido from Pedido p inner join Cliente c on c.ClienteID = p.ClienteID;

--2
SELECT PedidoID,Titulo, Quantidade from ItemPedido i INNER JOIN Produto p on p.ProdutoID = i.PedidoID;

--3
SELECT Nome, Titulo, Quantidade, Preco from ItemPedido i INNER JOIN Pedido p on p.PedidoID = i.PedidoID 
INNER JOIN Cliente c on c.ClienteID = i.PedidoID INNER JOIN Produto o on o.ProdutoID = i.PedidoID;

--4
SELECT Nome, Titulo, Quantidade from ItemPedido i
INNER JOIN Produto p on p.ProdutoID = i.ProdutoID 
INNER JOIN Pedido pe on pe.PedidoID = i.PedidoID
INNER JOIN Cliente c on c.ClienteID = pe.ClienteID WHERE c.ClienteID like 1;

--5
SELECT Nome, Titulo, Cidade from ItemPedido i
INNER JOIN Produto p on p.ProdutoID = i.ProdutoID 
INNER JOIN Pedido pe on pe.PedidoID = i.PedidoID
INNER JOIN Cliente c on c.ClienteID = pe.ClienteID WHERE c.Cidade like '%Rio de Janeiro%';

--6
SELECT SUM(Quantidade * Preco) from ItemPedido i INNER JOIN Produto p on p.ProdutoID = i.ProdutoID;

--7
SELECT c.Nome, SUM(Quantidade * Preco) as total from ItemPedido i INNER JOIN Cliente c on c.ClienteID = i.PedidoID
INNER JOIN Produto p on p.ProdutoID = i.ProdutoID GROUP BY c.Nome ORDER BY total desc;

--8

--9

--10
--Não é possivel realizar.