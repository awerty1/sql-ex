/*
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз 
(первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).
*/

WITH IncomeAgg AS (
    SELECT point, date, SUM(inc) AS total_income
    FROM Income
    GROUP BY point, date
),
OutcomeAgg AS (
    SELECT point, date, SUM(out) AS total_outcome
    FROM Outcome
    GROUP BY point, date
)
SELECT 
    COALESCE(IncomeAgg.point, OutcomeAgg.point) AS point,
    COALESCE(IncomeAgg.date, OutcomeAgg.date) AS date,
    OutcomeAgg.total_outcome,
    IncomeAgg.total_income
FROM IncomeAgg
FULL JOIN OutcomeAgg 
    ON IncomeAgg.point = OutcomeAgg.point 
    AND IncomeAgg.date = OutcomeAgg.date
