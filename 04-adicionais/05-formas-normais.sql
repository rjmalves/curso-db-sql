
-- Supondo um esquema de dependências da seguinte forma:

CREATE TABLE PACIENTE(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR,
    SEXO CHAR(1),
    EMAIL VARCHAR,
    NASCIMENTO DATETIME
);

CREATE TABLE MEDICO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR,
    SEXO CHAR(1),
    ESPECIALIDADE VARCHAR,
    FUNCIONARIO VARCHAR
);

CREATE TABLE HOSPITAL(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR,
    BAIRRO VARCHAR
    CIDADE VARCHAR
    ESTADO CHAR(2)
);

-- Supondo que devemos criar uma entidade CONSULTA, que depende
-- das três entidades acima. O identificador único poderia ser, portanto,
-- uma tripla dos 3 IDs das classes superiores.
CREATE TABLE CONSULTA(
    ID_PACIENTE INT NOT NULL UNIQUE,
    ID_MEDICO INT NOT NULL UNIQUE,
    ID_HOSPITAL INT NOT NULL UNIQUE,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR,
    INTERNACAO INT,
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID),
    FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID),
    FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(ID)
);


-- Todavia, uma pessoa pode se consultar mais de 1x com o mesmo médico,
-- no mesmo hospital. Portanto, isso não é suficiente para identificar uma consulta.
-- Precisamos criar uma chave primária de qualquer forma.
CREATE TABLE CONSULTA(
    ID_PACIENTE INT NOT NULL UNIQUE,
    ID_MEDICO INT NOT NULL UNIQUE,
    ID_HOSPITAL INT NOT NULL UNIQUE,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR,
    INTERNACAO INT,
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID),
    FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID),
    FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(ID)
);

-- SEGUNDA FORMA NORMAL:
-- Campos não chave devem depender da totalidade das CHAVES. 
-- O campo DATA depende da existência das três chaves. Qualquer uma que falte torna insuficiente
-- a especificação de uma CONSULTA.

-- TERCEIRA FORMA NORMAL:
-- Campos não chave que dependem de outros campos não chave devem ser movido para outra tabela.
-- O campo INTERNACAO depende de DIAGNOSTICO, que é um campo não chave. Logo, deve sair da tabela
-- CONSULTA e virar outra tabela, que referencia CONSULTA.

CREATE TABLE CONSULTA(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_PACIENTE INT NOT NULL UNIQUE,
    ID_MEDICO INT NOT NULL UNIQUE,
    ID_HOSPITAL INT NOT NULL UNIQUE,
    DATA DATETIME,
    DIAGNOSTICO VARCHAR,
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID),
    FOREIGN KEY (ID_MEDICO) REFERENCES MEDICO(ID),
    FOREIGN KEY (ID_HOSPITAL) REFERENCES HOSPITAL(ID)
);

CREATE TABLE INTERNACAO(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ID_CONSULTA INT NOT NULL UNIQUE,
    QUARTO INT,
    ENTRADA DATETIME,
    SAIDA DATETIME,
    OBSERVACOES VARCHAR,
    FOREIGN KEY (ID_CONSULTA) REFERENCES CONSULTA(ID),
);
