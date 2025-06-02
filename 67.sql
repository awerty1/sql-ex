/*
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания.
1) A - B и B - A считать РАЗНЫМИ маршрутами.
2) Использовать только таблицу Trip
*/

WITH RouteCounts AS (
    SELECT
        town_from,
        town_to,
        COUNT(*) AS num_flights
    FROM
        Trip
    GROUP BY
        town_from,
        town_to
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
