/*
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.
*/

SELECT Product.maker, AVG(PC.hd) AS avg_hd
FROM Product
JOIN PC ON Product.model = PC.model
WHERE Product.maker IN (
    SELECT maker
    FROM Product
    WHERE type = 'Printer'
)
GROUP BY Product.maker
