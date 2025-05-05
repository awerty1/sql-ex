/*
Найдите корабли, `сохранившиеся для будущих сражений`; т.е. 
выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.
*/

SELECT DISTINCT o1.ship
FROM Outcomes o1
JOIN Battles b1 ON o1.battle = b1.name
JOIN Outcomes o2 ON o1.ship = o2.ship
JOIN Battles b2 ON o2.battle = b2.name
WHERE o1.result = 'damaged'
  AND b2.date > b1.date