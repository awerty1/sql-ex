/*
Определите среднее число орудий для классов линейных кораблей.
Получить результат с точностью до 2-х десятичных знаков.
*/

SELECT CAST(AVG(numGuns * 1.0) AS DECIMAL(10, 2)) AS avg_numGuns
FROM Classes
WHERE type = 'bb'
