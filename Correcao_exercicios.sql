create database teste;
use teste;

CREATE TABLE Componente (
	cd_compo numeric(3) PRIMARY KEY,
	nome_compo varchar(20)
);

CREATE TABLE Aluno(
	Rm numeric(6) PRIMARY key,
	nome_aluno varchaR(20)
);

CREATE TABLE Avaliacao (
	nota1 char(2),
	nota2 char(2),
	media char(2),
	situacao varchar (30),
	cd_compo numeric (3),
	Rm numeric (6) references Aluno,
	FOREIGN KEY(cd_compo ) REFERENCES Componente(cd_compo)
);

insert into Componente values(1, 'BDII');
insert into Componente values(2, 'PWII');
insert into Componente values(3, 'PAMI');
insert into Componente values(4, 'MATEMATICA');
insert into Aluno values(20, 'Marcel');
insert into Aluno values(21, 'Simone');
insert into Aluno values(22, 'Carla');
insert into Aluno values(23, 'José');
insert into Avaliacao values('R', 'B', 'B', 'Aprovado', 1, 20);
insert into Avaliacao values('B', 'B', 'B', 'Aprovado', 2, 20);
insert into Avaliacao values('I', 'I', 'I', 'Reprovado', 1, 21);
insert into Avaliacao values('R', 'I', 'I', 'Reprovado', 2, 21);
insert into Avaliacao values('R', 'B', 'B', 'Aprovado', 3, 21);
insert into Avaliacao values('MB', 'B', 'B', 'Aprovado', 1, 22);
insert into Avaliacao values('R', 'MB', 'B', 'Aprovado', 2, 22);
insert into Avaliacao values(null, null, null, null, 2, 23);

--a. Criar um relatório que mostre quais os 
--componentes (nome) que os alunos (nome) estão cursando.

SELECT a.nome_aluno, c.nome_compo
From Aluno a
LEFT JOIN Avaliacao av on av.Rm = a.Rm
LEFT JOIN Componente c on c.cd_compo = av.cd_compo;

--Mostrar o nome dos alunos, seus componentes (nome) e suas notas.

SELECT a.nome_aluno, c.nome_compo, av.nota1, av.nota2, av.media
From Aluno a
LEFT JOIN Avaliacao av on av.Rm = a.Rm
LEFT JOIN Componente c on c.cd_compo = av.cd_compo;

--Exibir quais são os componentes (nome) que não possuem nenhum aluno (nome) cursando.
SELECT c.nome_compo 
From Componente c
LEFT JOIN Avaliacao av on av.cd_compo = c.cd_compo
where av.Rm IS NULL;

--Mostre os alunos (nome) que não tenham nota em algum componente (nome)
SELECT DISTINCT a.nome_aluno, c.nome_compo
From Aluno a
LEFT JOIN Avaliacao av on av.Rm = a.Rm
LEFT JOIN Componente c on c.cd_compo = av.cd_compo
WHERE av.nota1 IS NULL OR av.nota2 IS NULL or av.media is null
