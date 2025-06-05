/*
Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
*/

WITH PcModels AS (
    SELECT DISTINCT model
    FROM PC
),
MakerModels AS (
    SELECT
        maker,
        model
    FROM
        Product
    WHERE
        type = 'PC'
),
MakerMissingModels AS (
    SELECT
        maker
    FROM
        MakerModels
    WHERE
        model NOT IN (SELECT model FROM PcModels)
)
SELECT DISTINCT maker
FROM MakerModels
WHERE maker NOT IN (SELECT maker FROM MakerMissingModels)
