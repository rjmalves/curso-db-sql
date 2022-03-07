
-- Revisão de edição de tabelas
CREATE TABLE TABELA(
    COLUNA1 VARCHAR(30),
    COLUNA2 VARCHAR(30),
    COLUNA3 VARCHAR(30)
);

-- Podemos adicionar uma propriedade com ADD
ALTER TABLE TABELA
ADD PRIMARY KEY (COLUNA1);

-- Também podemos adicionar uma nova coluna
ALTER TABLE TABELA
ADD COLUNA4 VARCHAR(30);

-- Podemos adicionar uma coluna em uma certa posição
ALTER TABLE TABELA
ADD COLUNA5 VARCHAR(30) NOT NULL UNIQUE
AFTER COLUNA4;

-- Podemos modificar o tipo de um campo
ALTER TABLE TABELA
MODIFY COLUNA2 DATE NOT NULL;

-- E renomear a tabela
ALTER TABLE TABELA
RENAME PESSOA;

-- Podemos extrair mais informações sobre uma tabela com SHOW (dicionário de dados)
SHOW CREATE TABLE PESSOA;

| PESSOA | CREATE TABLE `PESSOA` (
  `COLUNA1` varchar(30) NOT NULL,
  `COLUNA2` date NOT NULL,
  `COLUNA3` varchar(30) DEFAULT NULL,
  `COLUNA4` varchar(30) DEFAULT NULL,
  `COLUNA5` varchar(30) NOT NULL,
  PRIMARY KEY (`COLUNA1`),
  UNIQUE KEY `COLUNA5` (`COLUNA5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |

