/*
Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
определить максимальную цену на его продукцию.
Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, то выводить для этого производителя NULL,
иначе максимальную цену.
*/

SELECT 
    maker,
    CASE 
        WHEN SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) > 0 THEN NULL
        ELSE MAX(price)
    END AS max_price
FROM (
    SELECT maker, price
    FROM Product
    JOIN PC ON Product.model = PC.model
    UNION ALL
    SELECT maker, price
    FROM Product
    JOIN Laptop ON Product.model = Laptop.model
    UNION ALL
    SELECT maker, price
    FROM Product
    JOIN Printer ON Product.model = Printer.model
) AS all_products
GROUP BY maker
