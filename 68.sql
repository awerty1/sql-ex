/*
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания.
1) A - B и B - A считать ОДНИМ И ТЕМ ЖЕ маршрутом.
2) Использовать только таблицу Trip
*/

WITH NormalizedRoutes AS (
    SELECT
        CASE
            WHEN town_from < town_to THEN town_from
            ELSE town_to
        END AS town1,
        CASE
            WHEN town_from < town_to THEN town_to
            ELSE town_from
        END AS town2
    FROM
        Trip
),
RouteCounts AS (
    SELECT
        town1,
        town2,
        COUNT(*) AS num_flights
    FROM
        NormalizedRoutes
    GROUP BY
        town1,
        town2
),
MaxFlights AS (
    SELECT
        MAX(num_flights) AS max_flights
    FROM
        RouteCounts
)
SELECT
    COUNT(*) AS num_routes
FROM
    RouteCounts
WHERE
    num_flights = (SELECT max_flights FROM MaxFlights)
