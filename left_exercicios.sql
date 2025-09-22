CREATE DATABASE escola
use escola

CREATE TABLE componente (
cd_compo numeric (3) PRIMARY KEY,
nome_compo varchar (20),
);

CREATE TABLE aluno (
Rm numeric (6) PRIMARY KEY,
nome_aluno varchar (20)
);

CREATE TABLE avaliacao (
nota1 char(2),
nota2 char(2),
media char(2),
situacao varchar (30),
cd_compo numeric (3),
Rm numeric (6) references aluno, FOREIGN KEY(cd_compo) REFERENCES componente (cd_compo)
);

insert into componente values(1, 'BDII');
insert into componente values(2, 'PWII');
insert into componente values(3, 'PAMI');
insert into componente values(4, 'MATEMATICA');
insert into aluno values(20, 'Marcel');
insert into aluno values(21, 'Simone');
insert into aluno values(22, 'Carla');
insert into aluno values(23, 'José');
insert into avaliacao values('R', 'B', 'B', 'Aprovado', 1, 20);
insert into avaliacao values('B', 'B', 'B', 'Aprovado', 2, 20);
insert into avaliacao values('I', 'I', 'I', 'Reprovado', 1, 21);
insert into avaliacao values('R', 'I', 'I', 'Reprovado', 2, 21);
insert into avaliacao values('R', 'B', 'B', 'Aprovado', 3, 21);
insert into avaliacao values('MB', 'B', 'B', 'Aprovado', 1, 22);
insert into avaliacao values('R', 'MB', 'B', 'Aprovado', 2, 22);
insert into avaliacao values(null, null, null, null, 2, 23);


/* a.Criar um relatório que mostre quais os componentes (nome) que os alunos (nome) estão cursando.

b.Mostrar o nome dos alunos, seus componentes (nome) e suas notas.

c.Exibir quais são os componentes (nome) que não possuem nenhum aluno (nome) cursando.

d.Mostre os alunos (nome) que não tenham nota em algum componente (nome)
*/


SELECT al.nome_aluno, c.nome_compo From aluno al
LEFT JOIN avaliacao a on a.Rm = al.Rm 
LEFT JOIN componente c on c.cd_compo = a.cd_compo;

SELECT al.nome_aluno, c.nome_compo, av.nota1, av.nota2, av.media From avaliacao av 
LEFT JOIN aluno al on av.Rm = al.Rm
LEFT JOIN componente c on c.cd_compo = av.cd_compo;

SELECT c.nome_compo FROM avaliacao av 
RIGHT JOIN componente c on c.cd_compo = av.cd_compo
WHERE av.cd_compo is null;

SELECT DISTINCT al.nome_aluno, av.nota1, av.nota2, av.media FROM aluno al
RIGHT JOIN avaliacao av on av.Rm = al.Rm
RIGHT JOIN componente c on c.cd_compo = av.cd_compo
WHERE av.nota1 is null or av.nota2 is null or av.media is null;
