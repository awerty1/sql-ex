/*
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
*/

WITH ShipData AS (
    SELECT Ships.name AS ship_name, Classes.displacement, Classes.numGuns
    FROM Ships
    JOIN Classes ON Ships.class = Classes.class
    UNION ALL
    SELECT Outcomes.ship AS ship_name, Classes.displacement, Classes.numGuns
    FROM Outcomes
    JOIN Classes ON Outcomes.ship = Classes.class
),
MaxGunsPerDisplacement AS (
    SELECT displacement, MAX(numGuns) AS max_numGuns
    FROM ShipData
    GROUP BY displacement
)
SELECT DISTINCT ShipData.ship_name
FROM ShipData
JOIN MaxGunsPerDisplacement 
    ON ShipData.displacement = MaxGunsPerDisplacement.displacement
    AND ShipData.numGuns = MaxGunsPerDisplacement.max_numGuns

