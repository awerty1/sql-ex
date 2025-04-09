/*
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
*/

SELECT maker, COUNT(model) AS model_count
FROM Product
WHERE type = 'PC'
GROUP BY maker
HAVING COUNT(model) >= 3