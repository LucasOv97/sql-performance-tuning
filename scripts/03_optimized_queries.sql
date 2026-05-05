-- Crear índice
CREATE INDEX idx_sales_date ON Sales(SaleDate);

-- Query optimizada
SELECT CustomerId, SUM(Amount)
FROM Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate < '2026-01-01'
GROUP BY CustomerId;
