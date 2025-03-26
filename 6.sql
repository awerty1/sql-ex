/*
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт,
найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
*/

SELECT DISTINCT Product.maker, Laptop.speed
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.hd >= 10 AND Product.type = 'Laptop';