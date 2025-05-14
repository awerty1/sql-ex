/*
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.
*/

SELECT DISTINCT Classes.class
FROM Outcomes
LEFT JOIN Ships ON Outcomes.ship = Ships.name
JOIN Classes ON COALESCE(Ships.class, Outcomes.ship) = Classes.class
WHERE Outcomes.result = 'sunk'
