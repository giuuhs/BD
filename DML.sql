create database etechas;
use etechas;

create table aluno(
rm numeric (5) primary key,
nome varchar (50) not null,
telefone varchar (13) not null
);
/*  DML -> Data manipulation language 
	-> linguagem de manipulação de dados
	-> Create
	-> Read
	-> Update
	-> Delete
*/
-- insert into TABLA (campos) VALUE (valor)

rm nome telefone
insert into aluno (rm,nome,telefone) values
	(241012, 'kevin fulano', '111234560');
insert into aluno 
	values (241013, 'kamila beltrana', '167594757')
	
	-- consulta: select * from nomeTabela
	select * from aluno 
	
	