/*
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
*/

SELECT DISTINCT maker
FROM Product
WHERE maker IN (
    -- Производители, выпускающие принтеры
    SELECT maker
    FROM Product
    WHERE type = 'Printer'
)
AND maker IN (
    -- Производители, выпускающие ПК с минимальным объемом RAM и максимальной скоростью
    SELECT maker
    FROM Product
    JOIN PC ON Product.model = PC.model
    WHERE PC.ram = (SELECT MIN(ram) FROM PC) -- ПК с минимальным объемом RAM
      AND PC.speed = (
          SELECT MAX(speed)
          FROM PC
          WHERE ram = (SELECT MIN(ram) FROM PC) -- Максимальная скорость среди ПК с минимальным объемом RAM
      )
)
