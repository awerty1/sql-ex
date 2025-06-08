/*
Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
Вывод: страна, сражение
*/

WITH AllCountries AS (
    SELECT DISTINCT country
    FROM Classes
),
AllBattles AS (
    SELECT DISTINCT name AS battle
    FROM Battles
),
CountryBattles AS (
    SELECT
        COALESCE(c.country, 'Unknown') AS country,
        o.battle
    FROM
        Outcomes o
    LEFT JOIN
        Ships s ON o.ship = s.name
    LEFT JOIN
        Classes c ON s.class = c.class OR o.ship = c.class
)
SELECT
    ac.country,
    ab.battle
FROM
    AllCountries ac
CROSS JOIN
    AllBattles ab
LEFT JOIN
    CountryBattles cb ON ac.country = cb.country AND ab.battle = cb.battle
WHERE
    cb.battle IS NULL
ORDER BY
    ac.country,
    ab.battle;