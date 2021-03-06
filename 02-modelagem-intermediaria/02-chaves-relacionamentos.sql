/*
 Toda tabela deve ter um registro que identifique de maneira única
 (chave primária - PK).

 A relação com elementos de outras tabelas se dá através das chaves
 (chave estrangeira - FK).

 Em um relacionamento 1 x 1:
 A chave estrangeira deve ficar na tabela mais "fraca"!

 Em um relacionamento 1 x N:
 A chave estrangeira deve ficar na cardinalidade N!

*/

CREATE DATABASE COMERCIO;
USE COMERCIO;

CREATE TABLE CLIENTE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    CPF CHAR(11) NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    SEXO ENUM('M', 'F') NOT NULL,
    EMAIL VARCHAR(50)
);

CREATE TABLE ENDERECO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    RUA VARCHAR(30) NOT NULL,
    BAIRRO VARCHAR(30) NOT NULL,
    CIDADE VARCHAR(30) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    ID_CLIENTE INT UNIQUE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID)
);

CREATE TABLE TELEFONE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('COM', 'RES', 'CEL') NOT NULL,
    NUMERO VARCHAR(10),
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(ID)
);


INSERT INTO CLIENTE VALUES(NULL, '12345678900' 'JOAO', 'M', 'JOAO@IG.COM');
INSERT INTO CLIENTE VALUES(NULL, '12345678900', 'CARLOS', 'M', 'CARLOS@IG.COM');
INSERT INTO CLIENTE VALUES(NULL, '12345678900', 'ANA', 'F', 'ANA@IG.COM');
INSERT INTO CLIENTE VALUES(NULL, '12345678900', 'CLARA', 'F', NULL);
INSERT INTO CLIENTE VALUES(NULL, '12345678900', 'JORGE', 'M', 'JORGE@IG.COM');
INSERT INTO CLIENTE VALUES(NULL, '12345678900', 'CELIA', 'F', 'CELIA@IG.COM');

SELECT * FROM CLIENTE;

