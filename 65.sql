/*
Пронумеровать уникальные пары {maker, type} из Product, упорядочив их следующим образом:
- имя производителя (maker) по возрастанию;
- тип продукта (type) в порядке PC, Laptop, Printer.
Если некий производитель выпускает несколько типов продукции, то выводить его имя только в первой строке;
остальные строки для ЭТОГО производителя должны содержать пустую строку символов ('').
*/

WITH UniquePairs AS (
    SELECT DISTINCT maker, type
    FROM Product
),
OrderedPairs AS (
    SELECT 
        maker, 
        type,
        ROW_NUMBER() OVER (PARTITION BY maker ORDER BY 
            CASE 
                WHEN type = 'PC' THEN 1
                WHEN type = 'Laptop' THEN 2
                WHEN type = 'Printer' THEN 3
            END) AS rn
    FROM UniquePairs
)
SELECT 
    ROW_NUMBER() OVER (ORDER BY maker, 
        CASE 
            WHEN type = 'PC' THEN 1
            WHEN type = 'Laptop' THEN 2
            WHEN type = 'Printer' THEN 3
        END) AS num,
    CASE 
        WHEN rn = 1 THEN maker 
        ELSE '' 
    END AS maker,
    type
FROM OrderedPairs
ORDER BY maker, 
    CASE 
        WHEN type = 'PC' THEN 1
        WHEN type = 'Laptop' THEN 2
        WHEN type = 'Printer' THEN 3
    END
