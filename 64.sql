/*
Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.
*/

WITH IncomeDays AS (
    SELECT point, date, 'inc' AS operation, SUM(inc) AS amount
    FROM Income
    GROUP BY point, date
),
OutcomeDays AS (
    SELECT point, date, 'out' AS operation, SUM(out) AS amount
    FROM Outcome
    GROUP BY point, date
)
SELECT 
    COALESCE(i.point, o.point) AS point,
    COALESCE(i.date, o.date) AS date,
    COALESCE(i.operation, o.operation) AS operation,
    COALESCE(i.amount, o.amount) AS amount
FROM IncomeDays i
FULL JOIN OutcomeDays o ON i.point = o.point AND i.date = o.date
WHERE i.date IS NULL OR o.date IS NULL
ORDER BY point, date
