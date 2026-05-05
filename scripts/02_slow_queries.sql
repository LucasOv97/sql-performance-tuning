-- Query sin índice (lenta)
SELECT CustomerId, SUM(Amount)
FROM Sales
WHERE YEAR(SaleDate) = 2026
GROUP BY CustomerId;
