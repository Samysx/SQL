-- comentario de uma linha 
/* comentario em bloco*/

/* cria��o de dados
 Cria um novo banco de Dados dentro de um SGBD
 Create database <nome do banco>
 */
 Create database Aula01;

 /* abrir banco
 Use <Nome do Banco>
 */
 Use Aula01;

 -- Volta para o BD Master--
 Use master;
 /* Apaga um banco de dados de sgbd*/
 Drop database Aula01;
 Use Aula01;

 /* cria uma nova tabela em um banco de dados*/
 Create Table Aula01(
 
 )

 -- Cria��o de uma tabela --
 Create Table tipo (
	Codigo Int not null primary key,
	nome varchar(30)
 )

 -- Cria��o de uma tabela com chave primaria composta de 2 campos: --
 Create table totalfaturado(
	mes int not null,
	ano integer,
	valor decimal (12,2),
	primary key (mes,ano)
 )
 --Cria��o de uma tabela com chave estrangeira--

 create Table secao(
 Codigo int not null primary key,
 descricao varchar(20) not null,
 coddepto int foreign key references
 departamento (codigo)
  /*esta dando erro pois a tabela departamento n�o est� criada 
 para funcionar deveria criar a tabela departamento antes
 */
 )

 -- Cria��o de uma tabela com restri��o de preenchimento de campos--
 create table animal(
 codigo int not null primary key,
 nome varchar (40) not null,
 sexo char(1) check(upper(sexo) = 'm' or upper(sexo) = 'f')
 )

 -- cria��o de tabela com algumas regras de integridade -- 
 Create table tblfuncionario(
 codfunc int identity,
 nomefunc varchar(50),
 rgfunc char(15),
 sexofunc char default 'f',
 salfunc dec(10,2) default 240.00,
 constraint pk_func primary key (codfunc),
 constraint uq_func unique(rgfunc),
 constraint ck_func1 check(sexofunc in ('f', 'm')),
 constraint ck_func2 check (salfunc >0)
 )

 -- Exercicios --

 -- Locadora --
 create database locadora;
 --drop database locadora
 --use master
 use locadora;
 create table Cliente(
 id_cliente int primary key,
 nome varchar(50),
 endereco varchar(50)
 )
 Create Index XCliente on Cliente(id_cliente)

 drop table locacao
 create table locacao(
 id_locacao int primary key,
 Cliente_idcliente int foreign key
 references Cliente(id_cliente)
 )
 Create Index Xlocacao on locacao(id_locacao, Cliente_idcliente)

 create table Genero(
	id_Genero int primary key,
	Descricao varchar(20)
 )
 Create Index XGenero on Genero(id_Genero)

 create table Filme(
	id_Filme int primary key,
	Genero_id_Genero integer foreign key 
	references Genero (id_Genero)
 )
 Create Index XFilme on Filme(id_Filme, Genero_id_Genero)

 create table categoria(
	id_categoria int primary key,
	Filme_Genero_id_Genero integer foreign key 
	references Filme(id_Filme)
 )
 Create index Xcategoria on categoria(id_categoria, Filme_Genero_id_Genero)

 -- Veiculo --

 Create database Veiculo;
 --DROP DATABASE Veiculo;
 --Use master
 use Veiculo;
 create table Cliente(
	id_Cliente int primary key,
	Nome varchar(50),
	endereco int not null
 )
  Create index XCliente on Cliente(id_Cliente)

create table Veiculo(
	id_veiculo int primary key,
	Cliente_id_cliente integer foreign key 
	references Cliente(id_Cliente)
)
Create index XVeiculo on Veiculo(id_veiculo, Cliente_id_cliente)

create table Pedido(
	id_Pedido int primary key,
	Cliente_id_cliente integer foreign key
	references Cliente(id_Cliente)
)
 Create index XPedido on Pedido(id_Pedido, Cliente_id_cliente)

create table Detalhe_Pedido(
	id_detalhe_pedido int primary key,
	Pedido_cliente_id_cliente integer foreign key
	references Pedido(id_Pedido)
)
 Create index XDetalhe_Pedido on Detalhe_Pedido(id_detalhe_pedido, Pedido_cliente_id_cliente)

create table Produto(
	id_Produto int primary key, 
	Marca varchar(50),
	id_detalhe_pedido integer foreign key
	references Detalhe_Pedido(id_detalhe_pedido)
)
Create index XProduto on Produto(id_Produto, id_detalhe_pedido)

-- Imovel --
create database Imovel;
use Imovel;
create table Vendedor(
	id_Vendedor int primary key,
	nome varchar(50),
	telefone int not null
)
create index XVendedor on Vendedor(id_Vendedor)

create table Imovel(
	id_Imovel int primary key, 
	Vendedor_id_vendedor integer foreign key
	references Vendedor(id_Vendedor) 
)
create index XImovel on Imovel(id_imovel, Vendedor_id_vendedor)

create table Bairro(
	id_Bairro int primary key,
	Imovel_vendedor_id_vendedor integer foreign key
	references Imovel (id_Imovel)
)
create index XBairro on Bairro(id_Bairro, Imovel_vendedor_id_vendedor)

create table Cidade(
	id_cidade int primary key,
	bairro_imovel_id_imovel integer foreign key
	references Bairro (id_Bairro)
)
create index XCidade on Cidade(id_cidade, bairro_imovel_id_Imovel)

create table Estado(
	Siglaest varchar(50),
	Cidade_Bairro_id_Bairro integer foreign key
	references Cidade (id_cidade)
)
Create index XEstado on Estado(Cidade_Bairro_id_Bairro)

create table Comprador(
	id_Comprador int primary key
)
create index Xcomprador on Comprador(id_comprador)

create table Oferta(
	Imovel_id_imovel integer foreign key
	references Imovel(id_Imovel),
	Comprador_id_Comprador integer foreign key 
	references  Comprador(id_Comprador)
)
create index XOferta on Oferta(imovel_id_imovel,comprador_id_comprador)

create table Faixa(
	id_Faixa int primary key
)
Create index XFaixa on Faixa(id_Faixa)


/*Index (referencial, coloco ele dentro da tabela)
Create Index <nome index> on <nome_table>(Campo chave PK/FK)
Create Index XFilme on tblFilme(ID_Filme, c2,c3) os campos se separam por virgula 
*/

CREATE DATABASE Detran

Use Detran

CREATE TABLE tblProp(
	CPF int PRIMARY KEY NOT NULL,
	nome VARCHAR(50),
	endereco VARCHAR(150),

)

CREATE TABLE tblModel(
	id_model int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblCategoria(
	id_categoria int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblVeiculo(
	placa CHAR(8) PRIMARY KEY NOT NULL,
	idModel int FOREIGN KEY
	REFERENCES tblModel(id_model),
	idCategoria int FOREIGN KEY
	REFERENCES tblCategoria(id_categoria)
)

CREATE TABLE tblLocal(
	id int PRIMARY KEY NOT NULL,
	coordGeo VARCHAR (80)
)

CREATE TABLE tblAgente(
	matricula int PRIMARY KEY NOT NULL,
	nome VARCHAR(60),
	dataContrac DATE,
	tempServico int	
)

CREATE TABLE tblTipo_Infracao(
	idTipo_Infracao int PRIMARY KEY NOT NULL,
	descricao VARCHAR(80)
)

CREATE TABLE tblMulta(
	placa CHAR(8) FOREIGN KEY 
	REFERENCES tblVeiculo (placa),
	idlocal int FOREIGN KEY 
	REFERENCES tblLocal (id),
	id_infracao int FOREIGN KEY 
	REFERENCES tblTipo_Infracao (idTipo_Infracao)
	matricula int FOREIGN KEY 
	REFERENCES tblAgente(matricula)
)

/* INSERT'S 

INSERT DECLARATIVO- Os campos precisam ser declarados 
   INSERT aluno (Id, nome, endereco) values (1,'lucas', 'av tiradentes 615')

INSERT POSICIONAL - Não é preciso declarar quais campos receberão valores, porém eu preciso saber a ordem 
	INSERT into <NOME DA TBL> values (2,'leonardo', 'av tiradentes 615') 
	INSERT tblFuncionario values (1,'luiz', 615)
*/


CREATE TABLE cliente2(
Cod_cli INT PRIMARY KEY,
nome_cli CHAR(30)
)

/*Declarativo*/
INSERT cliente2 (Cod_cli, nome_cli ) values (1,'Ana de Souza')
INSERT cliente2(Cod_cli, nome_cli) values (2, 'Mariana de souza')
INSERT cliente2 (Cod_cli, nome_cli) values (3,' fabiana de souza')

/*Posicional*/
INSERT INTO cliente2 VALUES (4, 'Rosana de souza')
INSERT INTO cliente2 VALUES (5, ' Adriana de souza')


/*Comando Select

SELECT CodCidade, NomeCidade From tblCidade

SELECT * FROM tBLcidade

SELECT * FROM tblCidade

* = seleciona todas as tabelas do DataBase

SELECT ([colunas]) FROM [tabela] WHERE ([campo = condições])

AND = AS DUAS DELAS 
OR = QUALQUER UMA DELAS 

Exemplos:

SELECT NomeCidade FROM cidade
	Where CodCidade > 4 AND CodCidade <8

	Nota -> (os valores que vão aparecer é valores maior que 4 e menor que 8)

*/

/*
Operadores

igual / =
negação / | 
maior / >
menor / <
diferente / <> ou |=
não maior / |>
não menor / |<
entre /  Between... and
comparação especial / Like
comparação de lista / in([Lista]) 



-IN-Define lista de valores como condição 
SELECT <tbl> WHERE<Campo> IN (Condição 1, Condição 2)

Between - Define uma faixa de valores como condição (só funciona em numero)
select*From <tbl> where <campo> BETWEEN 3 AND 6

Is NULL - Identificam valores nulos dos atributos 
select* from <tbl> WHERE <Campo> IS NULL 
select*from <tbl> WHERE <Campo> IS NOT NULL

Operador LIKE(usado em STRING)
SElECT*FROM <TBL> WHERE <campo> Like (condição)

a% - Conmecam com A 
%ce - comecam com CE
'_o__' - quando eu não sei a primeira só sei a segunda e não sei resto 
'[D-F]%' fecha o intervalo de D até F (as letras começam com D,E,F)
'[^A~C%]' não comece com essas letras
'[A-C,F-G]%' dois intervalos de A até C e de F a G

UPDATE - Atualiza o conteudo de um campo 

update <tbl> SET <campo> = (condição) WHERE <campo> = (condição)
ex: UPDATE alunos SET nome_turma = '3 info A' WHERE codCurso = 1

UPDATE Funcionarios SET salario = salario * 1.1 WHERE depto BETWEEN 1 AND 5

*/

/* Alter table (altera a estrutura da tabela)
	-adicionando um campo
	 ALTER table ADD email VARCHAR(35)

	 -adicionando uma constraint   --o codigo_cliente já deve existir na tabela pedido
	 ALTER <table> pedido ADD CONSTRAINT FOREIGN KEY <TIPO DE DADO>
	(pedido_cliente) REFERENCES tbl_cliente (cod_cliente)

	-alterando tamanho de um campo 
	 ALTER table table tbl empregados ALTER COLUMN nome CHAR(35)

	-removendo uma coluna
	ALTER table tblempregados DROP COLUMN nome -- não funciona com as chaves primarias 

	passo a passo agora:
	cria todas as tabelas 
	depois adiciona as alter table com  as chaves PK e FK 
	vem com os Index 
	e os inserts 

*/

CREATE DATABASE loja
USE loja;

CREATE TABLE tblclientee (
cod_cliente INT NOT NULL,
nomeCliente VARCHAR(50),
enderecoCliente VARCHAR(60)
)

CREATE TABLE tblpedidoo(
codigo_cliente INT NOT NULL,
pedido_cliente INT NOT NULL
)

ALTER TABLE tblpedidoo ADD CONSTRAINT INT FOREIGN KEY (pedido_cliente) 
REFERENCES tblclientee (cod_cliente) 




