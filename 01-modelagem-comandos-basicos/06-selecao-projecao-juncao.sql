
-- Comando SELECT geral: echo da entrada.
SELECT NOW();

SELECT 'ROGERIO ALVES';

SELECT 'BANCO DE DADOS';

-- Na verdade, com SELECT podemos construir a tabela na hora, mesmo que não tenha algumas informações.
SELECT NOW() AS DATA_HORA;
SELECT NOW() AS DATA_HORA, 'ROGERIO' AS USUARIO;

-- Extraindo dados de tabelas
SELECT NOME, SEXO, EMAIL FROM CLIENTE;

-- Trocando a ordem e renomeando as colunas
SELECT NOME AS CLIENTE, EMAIL, SEXO, ENDERECO FROM CLIENTE;

-- Apenas para fins acadêmicos
SELECT * FROM CLIENTE;