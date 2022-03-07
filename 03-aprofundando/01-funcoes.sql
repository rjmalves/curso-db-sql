SELECT C.NOME,
       C.EMAIL,
       E.ESTADO,
       T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.ID == E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.ID == T.ID_CLIENTE;

/* 
Ao realizar a query acima, vemos que alguns dos valores retornam nulos. Daí,
podemos usar a função IFNULL() para tratar o relatório.

Os argumentos da função são a coluna desejada e o que escrever no lugar das
entradas nulas.
*/

SELECT C.NOME,
       IFNULL(C.EMAIL, '*****') AS EMAIL,
       E.ESTADO,
       T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.ID == E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.ID == T.ID_CLIENTE;

