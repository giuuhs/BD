CREATE DATABASE SistemaEventos;
USE SistemaEventos;

-- Tabela Usuario
CREATE TABLE Usuario (
    idUsuario INT PRIMARY KEY,
    email VARCHAR(100),
    numCelular INT,
    nome VARCHAR(100),
    senha VARCHAR(100),
    statusUsuario VARCHAR(50),
    numeroCelular INT,
    dataNasc DATE,
    isAdmin ,
    foto VARCHAR(255)
);

-- Tabela Esporte
CREATE TABLE Esporte (
    idEsporte INT PRIMARY KEY,
    nomeEsporte VARCHAR(100),
    descricao VARCHAR(255)
);

-- Tabela Localizacao
CREATE TABLE Localizacao (
    idLocal INT PRIMARY KEY,
    nomeLocal VARCHAR(100),
    cepLocal VARCHAR(20),
    enderecoLocal VARCHAR(150),
    longitudeLocal VARCHAR(50),
    latitudeLocal VARCHAR(50),
    uf VARCHAR(2)
);

-- Tabela Evento
CREATE TABLE Evento (
    idEvento INT PRIMARY KEY,
    idUsuario INT,
    idLocal INT,
    nomeEvento VARCHAR(100),
    dataEvento DATE,
    idEsporte INT,
    participantesEvento VARCHAR(255),
    statusConfirmacao VARCHAR(50),
    status INT,
    create_at DATE,
    finished_at DATE,
    update_at DATE,
    autor VARCHAR(100),
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idLocal) REFERENCES Localizacao(idLocal),
    FOREIGN KEY (idEsporte) REFERENCES Esporte(idEsporte)
);