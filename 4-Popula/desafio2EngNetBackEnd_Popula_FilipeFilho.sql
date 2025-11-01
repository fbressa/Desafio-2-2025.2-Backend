-- -------------   << Desafio 2 engNet backend POPULA>>   ---------------
--
--                 SCRIPT DE INSERSAO (DML)
--
-- Data de Criacao ........: 31/10/2025
-- Autor(es) ..............: Filipe Bressanelli Azevedo Filho
-- Banco de Dados .........: MySql 8.0
-- Base de Dados (nome) ...: detran
--
-- PROJETO => 01 Base de Dados
--           => 06 Tabelas
--
-- Ultimas Alteracoes
--   
--
-- -------------------------------------------------------

-- SELECIONA O BANCO DE DADOS
USE detran;

-- ----------------------------------------
-- TABELA 1: PROPRIETARIO (Inserir primeiro)
-- ----------------------------------------
INSERT INTO PROPRIETARIO (Cpf, nome, sexo, dataDeNascimento, bairro, cidade, estado) VALUES
('11111111111', 'Ana Silva', 'F', '1980-05-15', 'Centro', 'Sao Paulo', 'SP'),
('22222222222', 'Bruno Costa', 'M', '1992-11-30', 'Tijuca', 'Rio de Janeiro', 'RJ'),
('33333333333', 'Carla Dias', 'F', '1975-02-10', 'Savassi', 'Belo Horizonte', 'MG'),
('44444444444', 'Daniel Moreira', 'M', '2000-07-22', 'Asa Sul', 'Brasilia', 'DF'),
('55555555555', 'Elisa Fernandes', 'F', '1998-01-05', 'Boa Viagem', 'Recife', 'PE'),
('66666666666', 'Felipe Almeida', 'M', '1983-09-12', 'Moinhos de Vento', 'Porto Alegre', 'RS'),
('77777777777', 'Gabriela Lima', 'F', '1995-04-18', 'Batel', 'Curitiba', 'PR'),
('88888888888', 'Hugo Pereira', 'M', '1979-12-01', 'Barra', 'Salvador', 'BA'),
('99999999999', 'Isabela Santos', 'F', '1988-06-25', 'Meireles', 'Fortaleza', 'CE'),
('00000000000', 'Joao Medeiros', 'M', '1990-03-03', 'Ponta Negra', 'Manaus', 'AM');

-- ----------------------------------------
-- TABELA 3: AGENTE (Inserir primeiro)
-- ----------------------------------------
INSERT INTO AGENTE (matricula, nome, dataDeContratacao) VALUES
(1001, 'Agente Silva', '2010-03-01'),
(1002, 'Agente Costa', '2012-05-15'),
(1003, 'Agente Dias', '2008-11-20'),
(1004, 'Agente Moreira', '2015-01-10'),
(1005, 'Agente Fernandes', '2018-07-30'),
(1006, 'Agente Almeida', '2019-02-14'),
(1007, 'Agente Lima', '2005-09-01'),
(1008, 'Agente Pereira', '2020-04-05'),
(1009, 'Agente Santos', '2021-12-01'),
(1010, 'Agente Medeiros', '2011-06-22');

-- ----------------------------------------
-- TABELA 4: LOCAL (Inserir primeiro)
-- ----------------------------------------
-- (id_Local é AUTO_INCREMENT, não precisa ser informado)
INSERT INTO LOCAL (latitude, longitude, velocidadePermitida) VALUES
(-23.550520, -46.633308, 60), -- Av. Paulista, SP
(-22.906847, -43.172896, 70), -- Av. Rio Branco, RJ
(-19.916681, -43.934492, 50), -- Av. Afonso Pena, BH
(-15.780148, -47.929170, 60), -- Eixo Monumental, BSB
(-8.063169, -34.871201, 60),  -- Av. Boa Viagem, Recife
(-30.034647, -51.217658, 40), -- Rua Padre Chagas, POA
(-25.428356, -49.273252, 50), -- Rua XV de Novembro, Curitiba
(-12.971403, -38.512401, 60), -- Av. Oceânica, Salvador
(-3.727572, -38.527739, 60),  -- Av. Beira Mar, Fortaleza
(-3.119028, -60.021731, 50);  -- Av. Djalma Batista, Manaus

-- ----------------------------------------
-- TABELA 6: PROPRIETARIO_TELEFONE (Depende de PROPRIETARIO)
-- ----------------------------------------
INSERT INTO PROPRIETARIO_TELEFONE (fk_PROPRIETARIO_Cpf, telefone) VALUES
('11111111111', '11987654321'), -- Ana (1)
('11111111111', '1123456789'),  -- Ana (2)
('22222222222', '21988887777'), -- Bruno (1)
('33333333333', '31999998888'), -- Carla (1)
('33333333333', '3133334444'),  -- Carla (2)
('33333333333', '31977776666'), -- Carla (3)
('44444444444', '61981234567'), -- Daniel (1)
('55555555555', '81987651234'), -- Elisa (1)
('66666666666', '51984567890'), -- Felipe (1)
('77777777777', '41991237890'), -- Gabriela (1)
('88888888888', '71988776655'), -- Hugo (1)
('88888888888', '7132324545'),  -- Hugo (2)
('99999999999', '85998877665'), -- Isabela (1)
('00000000000', '92981112233'), -- Joao (1)
('00000000000', '9236365544');  -- Joao (2)

-- ----------------------------------------
-- TABELA 2: VEICULO (Depende de PROPRIETARIO)
-- ----------------------------------------
INSERT INTO VEICULO (Placa, chassi, corPredominante, modelo, categoria, anoFabricacao, FK_PROPRIETARIO_Cpf) VALUES
('BRA2E11', '123ABC456DEF789G1', 'Preto', 'Gol', 'Particular', '2020', '11111111111'),
('BRA2E12', '123ABC456DEF789G2', 'Branco', 'Onix', 'Particular', '2021', '22222222222'),
('BRA2E13', '123ABC456DEF789G3', 'Prata', 'HB20', 'Aluguel', '2019', '33333333333'),
('BRA2E14', '123ABC456DEF789G4', 'Vermelho', 'Mobi', 'Particular', '2022', '44444444444'),
('BRA2E15', '123ABC456DEF789G5', 'Azul', 'Argo', 'Particular', '2020', '55555555555'),
('BRA2E16', '123ABC456DEF789G6', 'Cinza', 'Kwid', 'Aluguel', '2021', '66666666666'),
('BRA2E17', '123ABC456DEF789G7', 'Preto', 'Renegade', 'Particular', '2023', '77777777777'),
('BRA2E18', '123ABC456DEF789G8', 'Branco', 'Compass', 'Particular', '2022', '88888888888'),
('BRA2E19', '123ABC456DEF789G9', 'Prata', 'Corolla', 'Particular', '2021', '99999999999'),
('BRA2E10', '123ABC456DEF789G0', 'Vermelho', 'Civic', 'Particular', '2020', '00000000000');

-- ----------------------------------------
-- TABELA 5: INFRACAO (Inserir por último - Depende de VEICULO, LOCAL, AGENTE)
-- ----------------------------------------
-- (id_infracao é AUTO_INCREMENT, não precisa ser informado)
INSERT INTO INFRACAO (data, hora, tipoInfracao, velocidadeAferida, fk_VEICULO_Placa, fk_LOCAL_id, fk_AGENTE_matricula) VALUES
('2025-10-20', '14:30:00', 'Excesso de velocidade', 80, 'BRA2E11', 1, 1001),
('2025-10-21', '08:15:00', 'Estacionar em local proibido', NULL, 'BRA2E12', 2, 1002),
('2025-10-22', '17:45:00', 'Avançar sinal vermelho', NULL, 'BRA2E13', 3, 1003),
('2025-10-23', '11:05:00', 'Excesso de velocidade', 75, 'BRA2E14', 4, 1004),
('2025-10-24', '22:30:00', 'Dirigir sem cinto', NULL, 'BRA2E15', 5, 1005),
('2025-10-25', '13:20:00', 'Excesso de velocidade', 90, 'BRA2E16', 6, 1006),
('2025-10-26', '16:00:00', 'Uso de celular ao dirigir', NULL, 'BRA2E17', 7, 1007),
('2025-10-27', '09:10:00', 'Excesso de velocidade', 85, 'BRA2E18', 8, 1008),
('2025-10-28', '18:50:00', 'Conversão proibida', NULL, 'BRA2E19', 9, 1009),
('2025-10-29', '10:00:00', 'Excesso de velocidade', 70, 'BRA2E10', 10, 1010);