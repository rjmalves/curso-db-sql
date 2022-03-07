-- Podemos alterar o delimitador de fim de linha do banco
STATUS

DELIMITER $

-- Isso é necessário para criar PROCEDURES, pois as linhas
-- da função tem que terminar explicitamente com ;

CREATE PROCEDURE NOME()
BEGIN
    QUALQUER PROGRAMACAO;
END
$


CREATE PROCEDURE NOME_EMPRESA()
BEGIN
    SELECT 'ONS' AS EMPRESA;
END
$


-- Para chamar uma PROCEDURE, já pode retornar ao DELIMITER
-- normal. Só é necessária a troca no momento da criação.


-- Uma PROCEDURE pode receber parâmetros

DELIMITER $
CREATE PROCEDURE SOMA(A INT, B INT)
BEGIN
    SELECT A + B AS CONTA;
END
$

DELIMITER ;
CALL SOMA(5, 10);
