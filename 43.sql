/*
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.
*/

SELECT DISTINCT Battles.name
FROM Battles
LEFT JOIN Ships ON YEAR(Battles.date) = Ships.launched
WHERE Ships.launched IS NULL;