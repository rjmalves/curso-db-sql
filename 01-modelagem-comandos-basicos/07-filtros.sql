-- O comando WHERE
SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'F';

-- O comando LIKE
SELECT NOME, ENDERECO FROM CLIENTE WHERE ENDERECO = 'RJ';
SELECT NOME, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';

SELECT NOME, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ';

-- O WHERE aceita operadores lógicos
SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'F' AND ENDERECO LIKE '%RJ';

-- Para lidar com valores nulos, use sempre IS, não =
SELECT NOME, ENDERECO FROM CLIENTE WHERE EMAIL IS NULL;
SELECT NOME, ENDERECO FROM CLIENTE WHERE EMAIL IS NOT NULL;