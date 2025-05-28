/*
Посчитать остаток денежных средств на всех пунктах приема на начало дня 15/04/2001 для базы данных с отчетностью не чаще одного раза в день.
*/

WITH Income AS (
    SELECT point, SUM(inc) AS total_inc
    FROM Income_o
    WHERE date < '2001-04-15'
    GROUP BY point
),
Outcome AS (
    SELECT point, SUM(out) AS total_out
    FROM Outcome_o
    WHERE date < '2001-04-15'
    GROUP BY point
)
SELECT 
    SUM(COALESCE(i.total_inc, 0) - COALESCE(o.total_out, 0)) AS total_balance
FROM Income i
FULL JOIN Outcome o ON i.point = o.point

