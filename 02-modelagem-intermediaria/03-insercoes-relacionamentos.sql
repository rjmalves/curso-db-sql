--  Inserir em relacionamentos 1 x 1

-- No momento da inserção, a chave especificada deve existir!
INSERT INTO ENDERECO VALUES(NULL, 'RUA ANTONIO SA', 'CENTRO', 'BELO HORIZONTE', 'MG', 1);
INSERT INTO ENDERECO VALUES(NULL, 'RUA CAPITAO HERMES', 'SAVASSI', 'BELO HORIZONTE', 'MG', 2);
INSERT INTO ENDERECO VALUES(NULL, 'RUA PRESIDENTE VARGAS', 'COPACABANA', 'RIO DE JANEIRO', 'RJ', 3);
INSERT INTO ENDERECO VALUES(NULL, 'RUA NOBREGA', 'CENTRO', 'RIO DE JANEIRO', 'RJ', 4);
INSERT INTO ENDERECO VALUES(NULL, 'RUA URUGUAIANA', 'BARRA DA TIJUCA', 'RIO DE JANEIRO', 'RJ', 5);


-- Inserir em relacionamentos 1 x N

INSERT INTO TELEFONE VALUES(NULL, 'CEL', '999998888', 5);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '32220123', 4);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '32229999', 4);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '32220124', 3);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '32229998', 3);
