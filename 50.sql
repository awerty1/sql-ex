/*
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
*/

SELECT DISTINCT Outcomes.battle
FROM Outcomes
JOIN Ships ON Outcomes.ship = Ships.name
WHERE Ships.class = 'Kongo'
