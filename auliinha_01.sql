/*Basinha de dadinho*/
---comentario de uma linha


	Create table Cliente(
	cpf_clie char(11) primary key,
		---campo tipo restrição;
	dt_nasc date not null, 
	nm_clie varchar(30) not null,
	end_clie varchar (50),
	cep_clie varchar (8)
	);

	Create database exemplo2;
	use exemplo2;
	Create table Produto(
	cd_prod numeric (6) primary key,
	ds_prod varchar (50) not null,
	preco numeric (12,2) not null,
	qtde numeric (10,2) not null,
	);

