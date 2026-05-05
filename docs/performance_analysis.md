# Análisis de Performance

## Problema
La query original utilizaba la función YEAR() sobre la columna SaleDate, lo que impedía el uso de índices.

## Solución
Se reemplazó la condición por un rango de fechas y se creó un índice sobre SaleDate.

## Resultado
- Mejora significativa en el tiempo de ejecución
- Reducción del uso de CPU
