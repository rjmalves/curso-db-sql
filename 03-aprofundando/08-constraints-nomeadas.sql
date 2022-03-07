-- Podemos adicionar constraints nomeadas para
-- facilitar a visualização no banco de dados
CREATE TABLE USUARIO(
    ID INT,
    NOME VARCHAR(30)
);

CREATE TABLE CONTATO(
    ID INT,
    NUMERO VARCHAR(11) NOT NULL,
    ID_USUARIO INT
);

-- Dessa forma, quando formos visualizar no dicionário será mais fácil

ALTER TABLE USUARIO
ADD CONSTRAINT PK_USUARIO
PRIMARY KEY(ID);

ALTER TABLE CONTATO
ADD CONSTRAINT FK_USUARIO_CONTATO
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID);


-- Podemos procurar todas as constraints visualizando tabelas default do MySQL
SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| COMERCIO           |
| PROJETO            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+

--  Entraremos no INFORMATION_SCHEMA
USE INFORMATION_SCHEMA;

-- Nesse DB existem muitas tabelas, em particular a TABLE_CONSTRAINTS
DESC TABLE_CONSTRAINTS;

+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_SCHEMA  | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | NO   |     | NULL    |       |
| TABLE_NAME         | varchar(64) | NO   |     | NULL    |       |
| CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+

-- Agora podemos manipular igual as outras tabelas
SELECT CONSTRAINT_SCHEMA AS BANCO,
TABLE_NAME AS TABELA,
CONSTRAINT_TYPE AS TIPO,
CONSTRAINT_NAME AS NOME
FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'COMERCIO';

+----------+------------+-------------+--------------------+
| BANCO    | TABELA     | TIPO        | NOME               |
+----------+------------+-------------+--------------------+
| COMERCIO | CLIENTE    | PRIMARY KEY | PRIMARY            |
| COMERCIO | CONTATO    | FOREIGN KEY | FK_USUARIO_CONTATO |
| COMERCIO | ENDERECO   | UNIQUE      | ID_CLIENTE         |
| COMERCIO | ENDERECO   | PRIMARY KEY | PRIMARY            |
| COMERCIO | ENDERECO   | FOREIGN KEY | ENDERECO_ibfk_1    |
| COMERCIO | PESSOA     | UNIQUE      | COLUNA5            |
| COMERCIO | PESSOA     | PRIMARY KEY | PRIMARY            |
| COMERCIO | TELEFONE   | PRIMARY KEY | PRIMARY            |
| COMERCIO | TELEFONE   | FOREIGN KEY | TELEFONE_ibfk_1    |
| COMERCIO | USUARIO    | PRIMARY KEY | PRIMARY            |
| COMERCIO | VENDEDORES | PRIMARY KEY | PRIMARY            |
+----------+------------+-------------+--------------------+

-- Vemos que as CONSTRAINTS criadas por fora são mais compreensíveis devido aos nomes
