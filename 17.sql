/*
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed
*/

SELECT DISTINCT 'Laptop' AS type, Laptop.model, Laptop.speed
FROM Laptop
WHERE Laptop.speed < (SELECT MIN(PC.speed) FROM PC);