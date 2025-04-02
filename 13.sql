/*
Найдите среднюю скорость ПК, выпущенных производителем A.
*/

SELECT AVG(PC.speed) AS avg_speed
FROM PC
JOIN Product ON PC.model = Product.model
WHERE Product.maker = 'A';