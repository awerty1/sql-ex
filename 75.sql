/*
Для тех производителей, у которых есть продукты с известной ценой хотя бы в одной из таблиц Laptop, PC, Printer найти максимальные цены на каждый из типов продукции.
Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, максимальная цена на принтеры.
Для отсутствующих продуктов/цен использовать NULL.
*/

WITH ProductPrices AS (
    SELECT
        p.maker,
        p.type,
        CASE
            WHEN p.type = 'Laptop' THEN l.price
            WHEN p.type = 'PC' THEN pc.price
            WHEN p.type = 'Printer' THEN pr.price
        END AS price
    FROM
        Product p
    LEFT JOIN
        Laptop l ON p.model = l.model
    LEFT JOIN
        PC pc ON p.model = pc.model
    LEFT JOIN
        Printer pr ON p.model = pr.model
),
MaxPrices AS (
    SELECT
        maker,
        MAX(CASE WHEN type = 'Laptop' THEN price END) AS max_laptop,
        MAX(CASE WHEN type = 'PC' THEN price END) AS max_pc,
        MAX(CASE WHEN type = 'Printer' THEN price END) AS max_printer
    FROM
        ProductPrices
    GROUP BY
        maker
)
SELECT
    maker,
    max_laptop,
    max_pc,
    max_printer
FROM
    MaxPrices
WHERE
    max_laptop IS NOT NULL
    OR max_pc IS NOT NULL
    OR max_printer IS NOT NULL;