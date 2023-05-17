CREATE DATABASE Projeto
USE Projeto;

CREATE TABLE empregado(
codEmpregado INT NOT NULL PRIMARY KEY,
nomeInic VARCHAR(20) NOT NULL,
nomeInt CHAR(1) NULL,
nomeFin VARCHAR(20) NULL,
dataNasc DATETIME NULL,
endereco VARCHAR(60) NULL,
sexo CHAR(9)NUll,
salario MONEY NULL
)

CREATE TABLE dependente(
codDependente INT NOT NULL PRIMARY KEY,
nomeDependente VARCHAR(60)NOT NULL,
sexoDep CHAR(1)NOT NULL,
dataNascDep DATETIME,
tipoDep CHAR(1)NULL,
codEmpregado INT NOT NULL FOREIGN KEY 
REFERENCES empregado (codEmpregado)
)

CREATE TABLE cidade(
codCidade INT NOT NULL PRIMARY KEY,
nomeCidade VARCHAR(60)NOT NULL
)

CREATE TABLE departamento(
CodDepartamento INT NOT NULL PRIMARY KEY,
nomeDepartamento VARCHAR(60)NOT NULL,
dataInicGer DATE NOT NULL,
codCidade INT NOT NULL FOREIGN KEY 
REFERENCES cidade (codCidade)
)

CREATE TABLE projeto(
codProjeto INT NOT NULL PRIMARY KEY,
nomeProjeto VARCHAR (60) NOT NULL,
codDepartamento INT NOT NULL FOREIGN KEY 
REFERENCES departamento(codDepartamento)
)

CREATE TABLE empregadoProjeto(
horas INT NOT NULL,
codEmpregado INT NULL FOREIGN KEY 
REFERENCES empregado (codEmpregado),
codProjeto INT NOT NULL FOREIGN KEY
REFERENCES projeto (codProjeto)
)
 INSERT cidade (codCidade,nomeCidade) 
 VALUES
 (1,'campo grande'),
 (2,'Dourados'),
 (3,'corumbá '),
 (4,'Três Lagoas'),
 (5,'Ponta Porã'),
 (6,'Rio Verde'),
 (7,'Porto Murtinho'),
 (8,'Bonito'),
 (9,'Paranaiba')

 UPDATE cidade SET nomeCidade = ('Paranaiba') WHERE nomeCidade = ('cassilância') -- SET = (DEFINIÇÃO)

 --UPDATE cidade SET nome_cidade = 'cassilandia' WHERE cod_cidade = 9

 -- 3 
 INSERT departamento
 VALUES 
	 (10,'viva la vida','13-05-2006 14:58:00',1),
	 (11,'ridalgo','16-05-2008 16:00:00',2),
	 (12,'telo','18-05-2006 14:58:00',3),
	 (13,'sunna','23-06-2007 18:20:00',4)

 INSERT projeto 
 VALUES
	(14,'SUPLA',10),
	(15,'SUPLA',11),
	(16,'SUPLA',12),
	(17,'SUPLA',13)

INSERT empregado
VALUES
	(18,'Nicholas','A','Santana','01-05-2006 19:30:00','Rua Saturnino Pereira', 'M', $1000.00),
	(19,'Pedro','H','Raimundo','25-01-2006 16:30:00','Rua de Aruja','M', $3000.00),
	(20,'Yumi','T','de lima','24-01-2006 18:30:00','Guarulhos city', 'F',$2000.00),
	(21,'João','B','Silva','18-04-2006 18:30:00','São Caetano', 'M',$5000.00)


SELECT * FROM empregado
/* erros 
	- O campo SEXO apenas aceita um caractere, então insira apenas uma letra
	- O campo NomeInt, apenas aceita um caractere, mesma coisa do campo SEXO
	- devesse usar $ antes dos numeros em campos do tipo MONEY
*/

INSERT dependente
VALUES
	(22,'Evelyn Santos de Moura', 'F','07-03-2007 15:00:00','A', 18),
	(23,'Enzo Vieira Yoshida', 'M','25-11-2005 21:00:00','B', 19),
	(24,'Lais Joo Un Lee', 'F','17-09-2006 12:00:00','C',20),
	(25,'Caio Henrique Ferreira Dumont', 'M','27-10-2006 08:00:00','D',21)

--4
SELECT * FROM empregado 
--5
SELECT codEmpregado,nomeInic,nomeInt,nomeFin FROM empregado
--6 
SELECT * FROM empregado ORDER BY nomeInt ASC
--7
SELECT dataNasc,endereco FROM empregado WHERE (nomeInic = 'João' AND nomeInt='B' AND nomeFin='Silva')
--8
SELECT DISTINCT nomeInic,nomeInt,nomeFin FROM empregado
--9 
SELECT nomeInic,salario FROM empregado WHERE (salario > 3000 AND salario < 5000)
-- salario >= 3000 AND salario <= 5000 salario BETWEEN 3000 AND 5000
--10 
SELECT nomeInic FROM empregado WHERE nomeFin LIKE ('S%')
--11
SELECT nomeInic,dataNasc FROM empregado ORDER BY (dataNasc) DESC
--12
SELECT nomeInic, (salario * 0.9) FROM empregado
--UPDATE empregado SET salario = * 0,9
