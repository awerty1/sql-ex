/*
Найдите названия всех кораблей в базе данных, начинающихся с буквы R.
*/

SELECT name AS ship_name
FROM Ships
WHERE name LIKE 'R%'
UNION
SELECT ship AS ship_name
FROM Outcomes
WHERE ship LIKE 'R%'
