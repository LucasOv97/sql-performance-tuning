-- Query sin índice (lenta)
SET STATISTICS TIME ON
  
SELECT CustomerId, SUM(Amount)
FROM Sales
WHERE YEAR(SaleDate) = 2026
GROUP BY CustomerId;
