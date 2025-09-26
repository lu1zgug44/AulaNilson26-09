/*Criando o Banco de Dados Festa*/
drop database if exists festa;
create database festa;
use festa;

/*Tabela Cliente*/

create table Cliente(
IdCliente int primary key auto_increment,
nomeCliente varchar(50) not null,
email varchar(50) not null
);
insert into Cliente(nomeCliente,email)
values('Luiz','luiz@gmail.com'), ("João","joao@gmail.com"), ("Eric","eric@gmail.com"), ("Augusto","augusto@gmail.com")
, ("Marcos","marcos@gmail.com"), ("Ismael","ismael@gmail.com"), ("Lucas","joao@gmail.com");

select * from Cliente;

select * from Cliente where IdCliente = 1;

update cliente set nomeCliente = "Marcos",
					email="marcos@gmail.com"
                    where IdCliente = 1;
                    
delete from cliente where IdCliente = 1;

/*Tabela Endereço*/

create table Endereco(
IdEndereco int primary key auto_increment,
Logradouro varchar(50) not null,
bairro varchar(15) not null,
cep varchar(15) not null
);
-- CRUD
insert into endereco (Logradouro, bairro, cep)
values("Rua 15","Centro","05875-120"),("Rua florianopolis","morro doce","05235-880"),
("Rua tchudosbangosthudosbagos","morro doce","3455-980"),("Rua naoseioque","naoseioquela","3455-000");
select *from endereco;
select Logradouro, bairro from endereco;

select * from Endereco;
select * from Endereco where IdEndereco = 1;
Delete from endereco where IdEndereco = 2;
update endereco set Logradouro = "Av. Brasil",
					bairro = "Paulista", cep = '98765-432'
                    where IdEndereco = 1;
/*Tabela Residência*/

create table Residencia(
IdResidencia int primary key auto_increment,
IdCliente int not null,
IdEndereco int not null,
Nome varchar(30) not null,
foreign key(IdCliente) references Cliente(IdCliente),
foreign key(IdEndereco) references Endereco(IdEndereco)
);

insert into Residencia(IdCliente,IdEndereco,nome)
			values(3, 1, "casa de sla, bloco B"),
            (4, 3, 'casa de barro'),
            (5,4, 'casa de vidro');

select 
t1.IdResidencia, t2.nomeCliente, t3.Logradouro,
t3.bairro, t3.cep, t1.nome as Complemento, t2.email
from Residencia as t1
inner join cliente as t2 on t1.IdCliente = t2.IdCliente
inner join endereco as t3 on t1.IdEndereco = t3.IdEndereco
where t2.IdCliente = 4;

select 
t1.IdResidencia, t2.nomeCliente, t3.Logradouro,
t3.bairro, t3.cep, t1.nome as Complemento, t2.email
from Residencia as t1
inner join cliente as t2 on t1.IdCliente = t2.IdCliente
inner join endereco as t3 on t1.IdEndereco = t3.IdEndereco
where t1.IdEndereco = 3;

UPDATE Residencia 	SET IdCliente =5,
						IdEndereco = 3,
                        nome = 'CASA III' where IdResidencia = 1;
                        
DELETE FROM Residencia where IdResidencia = 11;
                        
select * from Residencia;

/*Tabela Tema*/

create table Tema(
IdTema int primary key auto_increment,
NomeTema varchar(50) not null
);
insert into tema(NomeTema)
			values('Naruto'),('dragon Ball'),('Homem Aranha'),('Batman'),('One Piece');
            
select * from tema; 
select * from tema where IdTema = 1;
update tema set NomeTema = 'Boruto' where IdTema = 5;
delete from tema where IdTema = 2;

/*Tabela Itens Tema*/

create table Itens_Tema(
IdItem int primary key auto_increment,
IdTema int not null,
NomeItem varchar(50) not null,
foreign key (IdTema) references Tema (IdTema)
); -- CRUD -> Create - Read - Update - Delete

insert into Itens_Tema(IdTema, NomeItem)
			values(1,'sharingan'), (1,'Byakugan'), (1,'Kunai'), (1,'Rinnegan'),
            (1,'Jiraya'), (3,'tela'), (3,'Mary Jane'), (3,'Duende verde'),
            (3,'Venom'), (4,'Robin'), (4,'BateCaverna'), (4,'Batman'), (4,'Coringa');

/* Façam Sozinhos */

create table festa(
IdFesta int primary key auto_increment,
IdCliente int not null,
IdTema int not null,
IdEndereco int not null,
DtFesta date not null,
ValorFesta decimal(10,2) not null
);
-- INSERT
-- SELECT


select
t1.IdItem, t2.NomeTema, t1.NomeItem
from Itens_Tema as t1
inner join tema as t2 on t1.IdTema = t2.IdTema;

select * from Itens_Tema as t1
inner join tema as t2 on t1.IdTema = t2.IdTema;