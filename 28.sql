/*
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.
*/

SELECT COUNT(*) AS maker_count
FROM (
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(model) = 1
) AS single_model_makers
