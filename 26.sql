/*
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
*/

SELECT AVG(price) AS avg_price
FROM (
    SELECT price
    FROM PC
    JOIN Product ON PC.model = Product.model
    WHERE Product.maker = 'A'
    UNION ALL
    SELECT price
    FROM Laptop
    JOIN Product ON Laptop.model = Product.model
    WHERE Product.maker = 'A'
) AS all_products