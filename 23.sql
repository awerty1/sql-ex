/*
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
*/

SELECT DISTINCT maker
FROM Product
JOIN PC ON Product.model = PC.model
WHERE PC.speed >= 750
INTERSECT
SELECT DISTINCT maker
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.speed >= 750
