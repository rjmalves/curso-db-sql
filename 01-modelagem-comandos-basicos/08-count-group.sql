--  O comando COUNT
SELECT COUNT(*) AS QUANTIDADE FROM CLIENTE;

-- O comando GROUP BY
SELECT COUNT(*) AS QUANTIDADE FROM CLIENTE GROUP BY SEXO;
SELECT SEXO, COUNT(*) AS QUANTIDADE FROM CLIENTE GROUP BY SEXO;