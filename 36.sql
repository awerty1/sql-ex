/*
Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).
*/

SELECT name
FROM Ships
WHERE name = class
UNION
SELECT ship AS name
FROM Outcomes
WHERE ship NOT IN (SELECT name FROM Ships)
  AND ship IN (SELECT class FROM Classes)

