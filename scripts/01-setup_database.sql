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

-- Insertar datos simulados
INSERT INTO Sales (CustomerId, Amount, SaleDate)
SELECT TOP 100000
    ABS(CHECKSUM(NEWID())) % 1000,
    RAND(CHECKSUM(NEWID())) * 1000,
    DATEADD(DAY, -ABS(CHECKSUM(NEWID())) % 365, GETDATE())
FROM sys.objects a, sys.objects b;
