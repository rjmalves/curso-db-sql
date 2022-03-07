-- Podemos ordenar a saída obtida do banco por alguma coluna
SELECT * FROM RELATORIO
ORDER BY NOME;

-- Podemos ordenar por múltiplas colunas
SELECT * FROM RELATORIO
ORDER BY NOME, TIPO;

-- Podemos ordenar de modo ascendente ou descendente
SELECT * FROM RELATORIO
ORDER BY NOME ASC, TIPO DESC;
