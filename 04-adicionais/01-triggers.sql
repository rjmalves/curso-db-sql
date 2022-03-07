-- Podemos preparar o banco para reagir a certas ações
-- com o uso de TRIGGERS

-- A criação é parecida com PROCEDURE

CREATE DATABASE BANCO;

USE BANCO;

CREATE TABLE PRODUTO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    PRECO FLOAT (10, 2) NOT NULL
);

CREATE TABLE BKP_PRODUTO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IDPRODUTO INT,
    NOME VARCHAR(30),
    PRECO FLOAT(10, 2)
);

-- Criaremos uma TRIGGER para fazer backup dos produtos
-- sempre que forem criados

DELIMITER $
CREATE TRIGGER BACKUP_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
    INSERT INTO BKP_PRODUTO
    VALUES(NULL, NEW.ID, NEW.NOME, NEW.PRECO);
END
$

DELIMITER ;

INSERT INTO PRODUTO VALUES(NULL, 'Livro', 50.0);
INSERT INTO PRODUTO VALUES(NULL, 'Cadeira', 100.0);
INSERT INTO PRODUTO VALUES(NULL, 'Arroz', 20.0);
INSERT INTO PRODUTO VALUES(NULL, 'Carro', 50000.0);

-- Ao conferir a tabela de backup:
SELECT * FROM BKP_PRODUTO;

+----+-----------+---------+----------+
| ID | IDPRODUTO | NOME    | PRECO    |
+----+-----------+---------+----------+
|  1 |         1 | Livro   |    50.00 |
|  2 |         2 | Cadeira |   100.00 |
|  3 |         3 | Arroz   |    20.00 |
|  4 |         4 | Carro   | 50000.00 |
+----+-----------+---------+----------+


-- Uma TRIGGER suporta ser chamada BEFORE/AFTER as operações de INSERT/UPDATE/DELETE
