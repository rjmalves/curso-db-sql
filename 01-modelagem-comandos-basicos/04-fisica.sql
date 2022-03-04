-- Criando o banco de dados
CREATE DATABASE PROJETO;

-- Conectando ao banco
USE PROJETO;

-- Criando a tabela de clientes
CREATE TABLE CLIENTE(
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

-- Verificando as tabelas
SHOW TABLES; -- APENAS MYSQL

-- Verificando a estrutura de uma tabela
DESC CLIENTE;