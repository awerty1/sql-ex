/*
Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.
*/

WITH ShipCountries AS (
    SELECT
        o.battle,
        COALESCE(c.country, 'Unknown') AS country,
        o.ship
    FROM
        Outcomes o
    LEFT JOIN
        Ships s ON o.ship = s.name
    LEFT JOIN
        Classes c ON s.class = c.class OR o.ship = c.class
),
CountryCounts AS (
    SELECT
        battle,
        country,
        COUNT(DISTINCT ship) AS ship_count
    FROM
        ShipCountries
    WHERE
        country != 'Unknown'
    GROUP BY
        battle,
        country
)
SELECT
    DISTINCT battle
FROM
    CountryCounts
WHERE
    ship_count >= 3
