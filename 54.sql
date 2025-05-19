/*
С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).
*/

WITH ShipData AS (
    SELECT Ships.name AS ship, numGuns 
    FROM Ships
    JOIN Classes ON Ships.class = Classes.class
    WHERE type = 'bb'
    UNION
    SELECT Outcomes.ship, numGuns 
    FROM Outcomes
    JOIN Classes ON Outcomes.ship = Classes.class
    WHERE type = 'bb'
)
SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(10, 2)) AS Avg_numG
FROM ShipData
