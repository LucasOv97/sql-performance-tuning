CREATE DATABASE PerformanceTest;
GO

USE PerformanceTest;
GO

CREATE TABLE Sales (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CustomerId INT,
    Amount DECIMAL(10,2),
    SaleDate DATETIME
);

-- Insertar datos simulados | Usamos un CTE recursivo o una tabla del sistema para generar filas rápidamente
WITH 
L1 AS (SELECT 1 AS c FROM (VALUES (1), (1), (1), (1), (1), (1), (1), (1), (1), (1)) AS t(c)), -- 10
L2 AS (SELECT 1 AS c FROM L1 AS a CROSS JOIN L1 AS b), -- 100
L3 AS (SELECT 1 AS c FROM L2 AS a CROSS JOIN L2 AS b), -- 10,000
L4 AS (SELECT 1 AS c FROM L3 AS a CROSS JOIN L2 AS b)  -- 1,000,000 (ajusta según necesites)

INSERT INTO Sales (CustomerId, Amount, SaleDate)
SELECT TOP (2000000)
    ABS(CHECKSUM(NEWID())) % 5000 + 1 AS CustomerId, -- IDs entre 1 y 5000
    CAST(RAND(CHECKSUM(NEWID())) * 1000 AS DECIMAL(10,2)) AS Amount,
    DATEADD(SECOND, ABS(CHECKSUM(NEWID())) % 31536000 * -1, GETDATE()) AS SaleDate -- Último año
FROM L4 AS a CROSS JOIN L2 AS b;
