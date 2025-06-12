/*
Определить время, проведенное в полетах, для пассажиров, летавших всегда на разных местах. Вывод: имя пассажира, время в минутах.
*/

WITH UniquePlacePassengers AS (
    SELECT
        ID_psg
    FROM
        Pass_in_trip
    GROUP BY
        ID_psg
    HAVING
        COUNT(DISTINCT place) = COUNT(*)
),
FlightTimes AS (
    SELECT
        pit.ID_psg,
        SUM(
            CASE
                WHEN t.time_in >= t.time_out THEN DATEDIFF(minute, t.time_out, t.time_in)
                ELSE DATEDIFF(minute, t.time_out, DATEADD(day, 1, t.time_in))
            END
        ) AS total_time
    FROM
        Pass_in_trip pit
    JOIN
        Trip t ON pit.trip_no = t.trip_no
    WHERE
        pit.ID_psg IN (SELECT ID_psg FROM UniquePlacePassengers)
    GROUP BY
        pit.ID_psg
)
SELECT
    p.name,
    ft.total_time AS minutes
FROM
    Passenger p
JOIN
    FlightTimes ft ON p.ID_psg = ft.ID_psg
