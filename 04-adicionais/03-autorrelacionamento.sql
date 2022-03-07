-- Algumas entidades podem tem que se relacionar com elas mesmas.

-- Por exemplo, um curso pode se relacionar com outros cursos,
-- como pré-requisitos.

CREATE TABLE CURSOS(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    HORAS INT,
    VALOR FLOAT(10, 2),
    ID_PREREQ INT
);

ALTER TABLE CURSOS ADD CONSTRAINT FK_PREREQ
FOREIGN KEY(ID_PREREQ) REFERENCES CURSOS(ID);

INSERT INTO CURSOS VALUES(NULL, "Python", 10, 50.00, NULL);
INSERT INTO CURSOS VALUES(NULL, "Arquitetura de Software", 30, 200.00, 1);

SELECT * FROM CURSOS;

-- Essa mesma estratégia pode ser usada em JOIN
SELECT C.NOME,
       C.HORAS,
       C.VALOR,
       IFNULL(P.NOME, '----') AS PREREQ
FROM CURSOS C
INNER JOIN CURSOS P
ON C.ID_PREREQ = P.ID;
