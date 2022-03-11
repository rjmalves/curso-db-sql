-- CURSOR é o equivalente a array para usar dentro
-- de PROCEDURES. Ele recebe o resultado de uma QUERY.

CREATE TABLE VENDEDORES(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    JAN FLOAT(10, 2),
    FEV FLOAT(10, 2),
    MAR FLOAT(10, 2),
);

CREATE TABLE VENDAS_TOTAL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    JAN FLOAT(10, 2),
    FEV FLOAT(10, 2),
    MAR FLOAT(10, 2),
    TOTAL FLOAT(10, 2),
    MEDIA FLOAT(10, 2)
);

DELIMITER $
CREATE PROCEDURE INSEREDADOS()
BEGIN
    -- Variáveis auxiliares
    DECLARE FIM INT DEFAULT 0;
    DECLARE VAR1, VAR2, VAR3, VTOTAL, VMEDIA INT;
    DECLARE VNOME VARCHAR(50);

    -- Declaração da QUERY recebida pelo cursor
    DECLARE REG CURSOR FOR(
        SELECT NOME, JAN, FEV, MAR FROM VENDEDORES
    );

    -- Usa a variável FIM para sinalizar que o CURSOR terminou
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;

    -- Joga o CURSOR para a RAM
    OPEN REG;

    -- LOOP em si
    REPEAT
        -- Busca o próximo elemento do CURSOR
        FETCH REG INTO VNOME, VAR1, VAR2, VAR3;
        IF NOT FIM THEN
            SET VTOTAL = VAR1 + VAR2 + VAR3;
            SET VMEDIA = VTOTAL / 3;

            INSERT INTO VENDAS_TOTAL VALUES(VNOME, VAR1, VAR2, VAR3, VTOTAL, VMEDIA);
        END IF;
    -- Termina o LOOP
    UNTIL FIM END REPEAT;

    -- Limpa a RAM
    CLOSE REG;

END
$

DELIMITER ;

CALL INSEREDADOS();

