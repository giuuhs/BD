--Bianca Pereira e Giulia de Souza
CREATE DATABASE etec;
USE etec;


CREATE TABLE Aluno ( 
	id_aluno INT PRIMARY KEY, 
	nome VARCHAR(50) 
); 

 
CREATE TABLE Disciplina ( 
    id_disciplina INT PRIMARY KEY, 
    nome VARCHAR(50) 
); 

 

CREATE TABLE Nota ( 
    id_nota INT PRIMARY KEY, 
    id_aluno INT, 
    id_disciplina INT, 
    nota DECIMAL(4,2), 
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno), 
    FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina) 
);  


INSERT INTO Aluno VALUES  
(1, 'Ana'), (2, 'Bruno'), (3, 'Carla'), (4, 'Diego'); 

 INSERT INTO Disciplina VALUES  
(10, 'Matem�tica'), (20, 'Portugu�s'), (30, 'Hist�ria'); 

 INSERT INTO Nota VALUES  
(100, 1, 10, 8.5), 
(101, 1, 20, 7.0), 
(102, 2, 10, 5.5), 
(103, 3, 30, 9.0) 


--Atividade 3 � Relat�rios usando Inner Join 
-- 1-> Liste o nome dos alunos e suas notas (qualquer disciplina).
SELECT nome, nota from Aluno as a INNER JOIN Nota as n on a.id_aluno = n.id_aluno order by nome;

-- 2->Liste o nome dos alunos e a disciplina correspondente da nota. 
SELECT a.nome, d.nome as disciplina from Aluno as a INNER JOIN Disciplina as d order by a.nome

-- 3-> Mostre todos os alunos que t�m nota em Matem�tica. 
 SELECT a.nome from Aluno as a INNER JOIN Nota as n on a.id_aluno = n.id_aluno WHERE n.id_disciplina = 10


-- Atividade 4 � Relat�rios usando left e right Join 
-- 1-> Liste todos os alunos e suas notas (mesmo que algum aluno n�o tenha nota registrada). 


-- 2-> Liste todas as disciplinas e os alunos que j� t�m nota nelas (mesmo que algum aluno n�o tenha feito prova nessa disciplina).


-- Exiba os alunos que n�o possuem nenhuma nota registrada. 


-- Exiba as disciplinas que ainda n�o t�m nenhum aluno avaliado 



-- Atividade 5 � Relat�rios combinando joins m�ltiplos e fun��es agregadas.
-- 1-> Mostre a m�dia das notas por disciplina.


-- 2-> Mostre a m�dia geral de cada aluno (mesmo que n�o tenha nota em todas as disciplinas).


-- 3-> Exiba os alunos que t�m m�dia maior ou igual a 7. 


-- 4-> Liste os alunos que est�o sem nota em alguma disciplina (comparando todas as disciplinas dispon�veis). 


-- 5->Crie uma consulta que traga a rela��o: Aluno | Disciplina | Nota (se houver, sen�o mostrar NULL) para todos os alunos e todas 
--as disciplinas existentes. 
