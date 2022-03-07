SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.ID = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.ID = T.ID_CLIENTE;

+-------+------+--------------+------+-----------+-----------------+----------------+--------+
| NOME  | SEXO | EMAIL        | TIPO | NUMERO    | BAIRRO          | CIDADE         | ESTADO |
+-------+------+--------------+------+-----------+-----------------+----------------+--------+
| CLARA | F    | NULL         | CEL  | 999998888 | BARRA DA TIJUCA | RIO DE JANEIRO | RJ     |
| CELIA | F    | CELIA@IG.COM | COM  | 32220123  | CENTRO          | RIO DE JANEIRO | RJ     |
| CELIA | F    | CELIA@IG.COM | RES  | 32229999  | CENTRO          | RIO DE JANEIRO | RJ     |
| JORGE | M    | JORGE@IG.COM | COM  | 32220124  | COPACABANA      | RIO DE JANEIRO | RJ     |
| JORGE | M    | JORGE@IG.COM | RES  | 32229998  | COPACABANA      | RIO DE JANEIRO | RJ     |
+-------+------+--------------+------+-----------+-----------------+----------------+--------+

/*
Para não ter que repetir a QUERY, podemos transformá-la numa VIEW.
*/

CREATE VIEW RELATORIO AS
SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.ID = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.ID = T.ID_CLIENTE;

/*
Agora basta fazer
*/

SELECT * FROM RELATORIO;

/*
Uma VIEW é armazenada como uma tabela. Não tem diferença. Ela aparece
quando é feito SHOW TABLES. Para apagar, basta fazer DROP VIEW RELATORIO;

Para identificar uma VIEW, podemos sempre criar com um prefixo. Por exemplo, V_RELATORIO.


Não é possível fazer INSERT em VIEWS que sejam formadas com JOIN.
Da mesma forma, não é possível fazer DELETE nessas VIEWS.
Porém, o comando UPDATE é permitido!! A VIEW é um ponteiro. Tudo que for alterado nela
será alterado nas tabelas associadas.
*/