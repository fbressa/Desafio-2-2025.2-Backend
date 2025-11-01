-- -------------   << Desafio 2 engNet backend CONSULTAS >>   ---------------
--
--                 SCRIPT DE CONSULTAS (DQL)
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

USE detran;

-- =======================================================
-- CONSULTA 1: Veículos e seus respectivos proprietários
-- =======================================================
SELECT * 
FROM 
    VEICULO AS V
JOIN 
    PROPRIETARIO AS P 
    ON P.Cpf = V.FK_PROPRIETARIO_Cpf
WHERE
    P.Cpf = '11111111111';

-- =======================================================
-- CONSULTA 2: Pesquisa de proprietários por nome
-- =======================================================
SELECT *
FROM PROPRIETARIO
WHERE nome LIKE '%Pereira%';

-- =======================================================
-- CONSULTA 3: Infrações e dados dos veículos em um período
-- =======================================================
SELECT
    i.id_infracao,
    i.data,
    i.hora,
    i.tipoInfracao,
    i.velocidadeAferida,
    v.Placa,
    v.chassi,
    v.corPredominante,
    v.modelo,
    v.categoria,
    v.anoFabricacao
FROM INFRACAO AS i
JOIN VEICULO AS v
    ON i.fk_VEICULO_Placa = v.Placa
WHERE i.data BETWEEN '2025-10-01' AND '2025-10-31'
ORDER BY i.data, i.hora;

-- =======================================================
-- CONSULTA 4: Número de veículos cadastrados por modelo
-- =======================================================
SELECT 
    modelo,
    COUNT(*) AS quantidade_veiculos
FROM VEICULO
GROUP BY modelo
ORDER BY quantidade_veiculos DESC;
