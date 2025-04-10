/*
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.
*/
SELECT Product.maker, MAX(PC.price) AS max_price
FROM Product
JOIN PC ON Product.model = PC.model
GROUP BY Product.maker;