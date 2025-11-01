-- -------------   << Desafio 2 engNet backendF>>   ---------------
--
--                SCRIPT DE CRIACAO (DDL)
--
-- Data de Criacao ........: 31/10/2025
-- Autor(es) ..............: Filipe Bressanelli Azevedo Filho
-- Banco de Dados .........: MySql 8.0
-- Base de Dados (nome) ...: detran
--
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
--
-- Ultimas Alteracoes
--   		- Adição de atributos que anteriormente eu considerei como derivados
--          - Adição de endereço
-- -------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
IF NOT EXISTS detran;

USE detran;

-- ----------------------------------------
-- TABELA 1: PROPRIETARIO
-- ----------------------------------------
CREATE TABLE PROPRIETARIO (
	Cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    sexo CHAR(1),
    dataDeNascimento DATE,
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado CHAR(2)
);
-- ----------------------------------------
-- TABELA 2: VEICULO
-- ----------------------------------------
CREATE TABLE VEICULO(
	Placa CHAR(7) PRIMARY KEY,
    chassi CHAR(17) NOT NULL UNIQUE,
    corPredominante VARCHAR(30),
    modelo VARCHAR(50),
    categoria VARCHAR(20),
    anoFabricacao YEAR,
    FK_PROPRIETARIO_Cpf CHAR(11) NOT NULL,
    CONSTRAINT FK_VEICULO_PROPRIETARIO
		FOREIGN KEY (FK_PROPRIETARIO_Cpf)
        REFERENCES PROPRIETARIO (Cpf)
        ON DELETE RESTRICT
);
-- ----------------------------------------
-- TABELA 3: AGENTE
-- ----------------------------------------
CREATE TABLE AGENTE (
	matricula INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    dataDeContratacao DATE
);

-- ----------------------------------------
-- TABELA 4: LOCAL
-- ----------------------------------------
CREATE TABLE LOCAL (
    id_Local INT PRIMARY KEY AUTO_INCREMENT,
    
    latitude DECIMAL(10, 8), 
    longitude DECIMAL(11, 8),
    velocidadePermitida INT -- em Km/h
);

-- ----------------------------------------
-- TABELA 5: INFRACAO
-- ----------------------------------------
CREATE TABLE INFRACAO (
    id_infracao INT PRIMARY KEY AUTO_INCREMENT,
    
    data DATE NOT NULL,
    hora TIME NOT NULL,
    
    tipoInfracao VARCHAR(100),
    velocidadeAferida INT,
    
    fk_VEICULO_Placa CHAR(7) NOT NULL,
    fk_LOCAL_id INT NOT NULL,
    fk_AGENTE_matricula INT NOT NULL,
    
    CONSTRAINT FK_INFRACAO_VEICULO
        FOREIGN KEY (fk_VEICULO_Placa)
        REFERENCES VEICULO (Placa)
        ON DELETE RESTRICT,
        
    CONSTRAINT FK_INFRACAO_LOCAL
        FOREIGN KEY (fk_LOCAL_id)
        REFERENCES LOCAL (id_Local)
        ON DELETE RESTRICT,
        
    CONSTRAINT FK_INFRACAO_AGENTE
        FOREIGN KEY (fk_AGENTE_matricula)
        REFERENCES AGENTE (matricula)
        ON DELETE RESTRICT
);

-- ----------------------------------------
-- TABELA 6: PROPRIETARIO_TELEFONE (Atributo Multivalorado)
-- ----------------------------------------
CREATE TABLE PROPRIETARIO_TELEFONE (
    fk_PROPRIETARIO_Cpf CHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL, 
    
    PRIMARY KEY (fk_PROPRIETARIO_Cpf, telefone), 
    
    CONSTRAINT FK_TELEFONE_PROPRIETARIO
        FOREIGN KEY (fk_PROPRIETARIO_Cpf)
        REFERENCES PROPRIETARIO (Cpf)
        ON DELETE CASCADE 
);
-- ----------------------------------------
-- Alguns ALTER TABLE pois eu considerei que alguns atributos derivados não precisariam estar na tabela mas depois decidi adicionar
-- ----------------------------------------
ALTER TABLE PROPRIETARIO
  ADD COLUMN endereco VARCHAR(200) AFTER dataDeNascimento,
  ADD COLUMN idade TINYINT UNSIGNED;
  
ALTER TABLE AGENTE
  ADD COLUMN tempoDeServico INT;