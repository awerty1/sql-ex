/*
Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.
*/

SELECT name AS ship_name
FROM Ships
WHERE name LIKE '% % %'
UNION
SELECT ship AS ship_name
FROM Outcomes
WHERE ship LIKE '% % %'
