/*
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
*/

SELECT AVG(speed) AS avg_speed
FROM Laptop
WHERE price > 1000;