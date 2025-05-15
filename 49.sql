/*
Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).
*/

SELECT DISTINCT Ships.name AS ship_name
FROM Ships
JOIN Classes ON Ships.class = Classes.class
WHERE Classes.bore = 16
UNION
SELECT DISTINCT Outcomes.ship AS ship_name
FROM Outcomes
JOIN Classes ON Outcomes.ship = Classes.class
WHERE Classes.bore = 16
