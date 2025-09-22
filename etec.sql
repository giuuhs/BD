CREATE DATABASE etec_food;
Use etec_food;

CREATE TABLE FormaPagamento (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT CK_FormaPagamento_Tipo CHECK (tipo IN ('CARTAO_CREDITO','CARTAO_DEBITO','VALE_REFEICAO'))
);

CREATE TABLE Usuario (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(150) NOT NULL,
    senha VARCHAR(200) NOT NULL,
    tentativasAcesso INT DEFAULT 0,
    dataBloqueio DATETIME NULL,
    dataInativacao DATETIME NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT CK_Usuario_Status CHECK (status IN ('ATIVO','INATIVO','BLOQUEADO'))
);

CREATE TABLE Permissao (
    authority VARCHAR(100) PRIMARY KEY
);

-- Tabela de relacionamento Usuario x Permissao (N:N)
CREATE TABLE Usuario_Permissao (
    usuario_id BIGINT NOT NULL,
    authority VARCHAR(100) NOT NULL,
    PRIMARY KEY (usuario_id, authority),
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (authority) REFERENCES Permissao(authority)
);

CREATE TABLE Restaurante (
    restaurante_id BIGINT PRIMARY KEY IDENTITY,
    cnpj VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(150) NOT NULL,
    descricao VARCHAR(500),
    cep VARCHAR(15),
    endereco VARCHAR(200),
    taxaDeEntrega DECIMAL(10,2),
    tempoDeEntregaMinimo INT,
    tempoDeEntregaMaximo INT,
    aprovado BIT DEFAULT 0,
    tipoDeCozinha VARCHAR(20) NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    CONSTRAINT CK_Restaurante_TipoCozinha CHECK (
        tipoDeCozinha IN ('CHINESA','JAPONESA','MEXICANA','MINEIRA','BAIANA',
                          'LANCHES','HAMBURGER','ARABE','ITALIANA','VARIADA')
    )
);

CREATE TABLE HorarioFuncionamento (
    id BIGINT PRIMARY KEY IDENTITY,
    diaSemana VARCHAR(10) NOT NULL,
    horarioAbertura TIME NOT NULL,
    horarioFechamento TIME NOT NULL,
    restaurante_id BIGINT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id)
);

CREATE TABLE Cardapio (
    id BIGINT PRIMARY KEY IDENTITY,
    restaurante_id BIGINT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id)
);

CREATE TABLE ItemCardapio (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    tipo VARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    precoPromocional DECIMAL(10,2),
    cardapio_id BIGINT NOT NULL,
    FOREIGN KEY (cardapio_id) REFERENCES Cardapio(id),
    CONSTRAINT CK_ItemCardapio_Tipo CHECK (tipo IN ('ENTRADA','PRATO_PRINCIPAL','BEBIDA'))
);

CREATE TABLE Cliente (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    validado BIT DEFAULT 0
);

CREATE TABLE Pedido (
    id BIGINT PRIMARY KEY IDENTITY,
    data DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    restaurante_id BIGINT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id),
    CONSTRAINT CK_Pedido_Status CHECK (
        status IN ('REALIZADO','PAGO','CONFIRMADO','PRONTO','SAIU_PARA_ENTREGA','ENTREGUE')
    )
);


CREATE TABLE ItemPedido (
    id BIGINT PRIMARY KEY IDENTITY,
    quantidade INT NOT NULL,
    observacao VARCHAR(255),
    pedido_id BIGINT NOT NULL,
    itemCardapio_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (itemCardapio_id) REFERENCES ItemCardapio(id)
);

CREATE TABLE Pagamento (
    id BIGINT PRIMARY KEY IDENTITY,
    valor DECIMAL(10,2) NOT NULL,
    nome VARCHAR(100),
    numero VARCHAR(30),
    expiracao VARCHAR(10),
    codigo VARCHAR(10),
    status VARCHAR(20) NOT NULL,
    pedido_id BIGINT NOT NULL,
    formaPagamento_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (formaPagamento_id) REFERENCES FormaPagamento(id),
    CONSTRAINT CK_Pagamento_Status CHECK (status IN ('CRIADO','CONFIRMADO','CANCELADO'))
);

CREATE TABLE RestauranteFormaPagamento (
    restaurante_id BIGINT NOT NULL,
    formaPagamento_id BIGINT NOT NULL,
    PRIMARY KEY (restaurante_id, formaPagamento_id),
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id),
    FOREIGN KEY (formaPagamento_id) REFERENCES FormaPagamento(id)
);

CREATE TABLE Avaliacao (
    id BIGINT PRIMARY KEY IDENTITY,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario VARCHAR(255),
    pedido_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id)
);

CREATE TABLE Entregador (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    ativo BIT DEFAULT 1
);

CREATE TABLE Veiculo (
    id BIGINT PRIMARY KEY IDENTITY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    entregador_id BIGINT NOT NULL,
    FOREIGN KEY (entregador_id) REFERENCES Entregador(id),
    CONSTRAINT CK_Veiculo_Tipo CHECK (tipo IN ('MOTO','CARRO','BICICLETA','OUTRO'))
);

CREATE TABLE Entrega (
    id BIGINT PRIMARY KEY IDENTITY,
    cliente_id BIGINT NOT NULL,
    cep VARCHAR(15),
    endereco VARCHAR(200),
    complemento VARCHAR(100),
    pedido_id BIGINT NOT NULL,
    entregador_id BIGINT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (entregador_id) REFERENCES Entregador(id)
);


-- Inserir cardápios
INSERT INTO Cardapio (restaurante_id)
VALUES 
(1),
(2);

-- Inserir itens de cardápio
INSERT INTO ItemCardapio (nome, descricao, tipo, preco, precoPromocional, cardapio_id)
VALUES 
('Frango Xadrez', 'Frango com legumes ao molho oriental', 'ENTRADA', 35.00, 30.00, 1),
('Sushi Variado', 'Diversos tipos de sushi fresquinho', 'PRATO_PRINCIPAL', 45.00, 40.00, 1),
('Pizza Margherita', 'Pizza de mussarela com molho de tomate', 'PRATO_PRINCIPAL', 50.00, NULL, 2),
('Espaguete à Bolonhesa', 'Macarrão com molho bolonhesa caseiro', 'PRATO_PRINCIPAL', 40.00, NULL, 2);

-- Inserir clientes
INSERT INTO Cliente (nome, cpf, email, telefone, validado)
VALUES 
('Carlos Santana', '12345678901', 'carlos.santana@email.com', '(11) 98765-4321', 1),
('Ana Costa', '98765432100', 'ana.costa@email.com', '(21) 91234-5678', 0);

-- Inserir pedidos
INSERT INTO Pedido (data, status, restaurante_id)
VALUES 
('2025-09-22 12:30:00', 'REALIZADO', 1),
('2025-09-22 13:15:00', 'REALIZADO', 2);

/*

CREATE TABLE Cardapio (
    id BIGINT PRIMARY KEY IDENTITY,
    restaurante_id BIGINT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id)
);

CREATE TABLE ItemCardapio (
    id BIGINT PRIMARY KEY IDENTITY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    tipo VARCHAR(20) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    precoPromocional DECIMAL(10,2),
    cardapio_id BIGINT NOT NULL,
    FOREIGN KEY (cardapio_id) REFERENCES Cardapio(id),
    CONSTRAINT CK_ItemCardapio_Tipo CHECK (tipo IN ('ENTRADA','PRATO_PRINCIPAL','BEBIDA'))
);


CREATE TABLE Pedido (
    id BIGINT PRIMARY KEY IDENTITY,
    data DATETIME NOT NULL,
    status VARCHAR(20) NOT NULL,
    restaurante_id BIGINT NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES Restaurante(id),
    CONSTRAINT CK_Pedido_Status CHECK (
        status IN ('REALIZADO','PAGO','CONFIRMADO','PRONTO','SAIU_PARA_ENTREGA','ENTREGUE')
    )
);


*/
--Mostre todos os cardapios que não tem preço promocinal
select * from ItemCardapio CROSS JOIN Cardapio where precoPromocional is null;

--Mostre apenas os items de prato principal  
select * from ItemCardapio CROSS JOIN Cardapio where tipo='PRATO_PRINCIPAL';

--Produto mais caro do cardapio 
select it.nome, max(it.preco)as prod_caro from Cardapio c 
inner join pedidos p on p.clienteped_id = c.id 
inner join ItemCardapio it on p.restaurante_id = it.id
GROUP BY it.nome;