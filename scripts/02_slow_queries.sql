-- Query sin índice (lenta)
SELECT CustomerId, SUM(Amount)
FROM Sales
WHERE YEAR(SaleDate) = 2024
GROUP BY CustomerId;
