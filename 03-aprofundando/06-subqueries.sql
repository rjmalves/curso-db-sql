
-- Para realizar tarefas mais complexas, é necessário
-- fazer uma query dentro da outra.

-- O vendedor que vendeu menos em Março e o nome dele
SELECT NOME, MIN(MARCO) AS MIN_MARCO
FROM VENDEDORES;

--  Temos um erro!!
ERROR 1140 (42000): In aggregated query without GROUP BY,
expression #1 of SELECT list contains nonaggregated column
'COMERCIO.VENDEDORES.NOME'; this is incompatible with sql_mode=only_full_group_by

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

-- Assim podemos fazer operações em linhas:
SELECT NOME,
       JANEIRO,
       FEVEREIRO,
       MARCO,
       (JANEIRO + FEVEREIRO + MARCO) AS TOTAL
FROM VENDEDORES;
