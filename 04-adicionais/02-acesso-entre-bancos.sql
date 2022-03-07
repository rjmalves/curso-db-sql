-- Vamos criar um BACKUP em banco separado com TRIGGER

-- Primeiro, limpamos as tabelas e triggers anteriores

DROP TABLE PRODUTO;
CREATE TABLE PRODUTO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    PRECO FLOAT (10, 2) NOT NULL
);


CREATE DATABASE BACKUP;

USE BACKUP;

CREATE TABLE BKP_PRODUTO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30) NOT NULL,
    PRECO FLOAT (10, 2) NOT NULL
);

USE BANCO;

-- Podemos acessar uma tabela de outro banco com BANCO.TABELA

DELIMITER $
CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON BANCO.PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BACKUP.BKP_PRODUTO
    VALUES(NULL, NEW.ID, NEW.NOME, NEW.PRECO);
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL, 'Livro', 50.0);
INSERT INTO PRODUTO VALUES(NULL, 'Cadeira', 100.0);
INSERT INTO PRODUTO VALUES(NULL, 'Arroz', 20.0);
INSERT INTO PRODUTO VALUES(NULL, 'Carro', 50000.0);

-- Ao conferir a tabela de backup:
SELECT * FROM BACKUP.BKP_PRODUTO;
+----+-----------+---------+----------+
| ID | IDPRODUTO | NOME    | PRECO    |
+----+-----------+---------+----------+
|  1 |         1 | Livro   |    50.00 |
|  2 |         2 | Cadeira |   100.00 |
|  3 |         3 | Arroz   |    20.00 |
|  4 |         4 | Carro   | 50000.00 |
+----+-----------+---------+----------+


-- Além de backup, é possível usar TRIGGER para auditoria com as funções
SELECT NOW();
SELECT CURRENT_USER();
