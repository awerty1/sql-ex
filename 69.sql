/*
По таблицам Income и Outcome для каждого пункта приема найти остатки денежных средств на конец каждого дня,
в который выполнялись операции по приходу и/или расходу на данном пункте.
Учесть при этом, что деньги не изымаются, а остатки/задолженность переходят на следующий день.
Вывод: пункт приема, день в формате "dd/mm/yyyy", остатки/задолженность на конец этого дня.
*/

WITH DailyOperations AS (
    SELECT
        point,
        date,
        COALESCE(inc, 0) AS inc,
        COALESCE(out, 0) AS out
    FROM (
        SELECT point, date, inc, NULL AS out FROM Income
        UNION ALL
        SELECT point, date, NULL AS inc, out FROM Outcome
    ) AS Operations
),
DailyBalance AS (
    SELECT
        point,
        date,
        SUM(inc) - SUM(out) AS daily_change
    FROM
        DailyOperations
    GROUP BY
        point, date
),
CumulativeBalance AS (
    SELECT
        point,
        date,
        SUM(daily_change) OVER (PARTITION BY point ORDER BY date) AS balance
    FROM
        DailyBalance
)
SELECT
    point,
    FORMAT(date, 'dd/MM/yyyy') AS day,
    balance
FROM
    CumulativeBalance
ORDER BY
    point,
    date
