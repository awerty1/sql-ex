/*
Среди тех, кто пользуется услугами только какой-нибудь одной компании, определить имена разных пассажиров, летавших чаще других.
Вывести: имя пассажира и число полетов.
*/

WITH PassengerFlights AS (
    SELECT
        pit.ID_psg,
        COUNT(*) AS flight_count
    FROM
        Pass_in_trip pit
    JOIN
        Trip t ON pit.trip_no = t.trip_no
    GROUP BY
        pit.ID_psg
),
SingleCompanyPassengers AS (
    SELECT
        pit.ID_psg
    FROM
        Pass_in_trip pit
    JOIN
        Trip t ON pit.trip_no = t.trip_no
    GROUP BY
        pit.ID_psg
    HAVING
        COUNT(DISTINCT t.ID_comp) = 1
),
MaxFlights AS (
    SELECT
        MAX(pf.flight_count) AS max_flights
    FROM
        PassengerFlights pf
    JOIN
        SingleCompanyPassengers scp ON pf.ID_psg = scp.ID_psg
)
SELECT
    p.name,
    pf.flight_count
FROM
    Passenger p
JOIN
    PassengerFlights pf ON p.ID_psg = pf.ID_psg
JOIN
    SingleCompanyPassengers scp ON pf.ID_psg = scp.ID_psg
WHERE
    pf.flight_count = (SELECT max_flights FROM MaxFlights)
