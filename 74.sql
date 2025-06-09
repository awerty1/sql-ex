/*
Вывести все классы кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
Вывод: страна, класс
*/

WITH RussianClasses AS (
    SELECT
        country,
        class
    FROM
        Classes
    WHERE
        country = 'Russia'
)
SELECT
    country,
    class
FROM
    RussianClasses
UNION ALL
SELECT
    country,
    class
FROM
    Classes
WHERE
    NOT EXISTS (SELECT 1 FROM RussianClasses)
