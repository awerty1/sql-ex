/*
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.
*/

SELECT maker, AVG(screen) FROM laptop l
LEFT JOIN product p ON p.model = l.model
GROUP BY maker