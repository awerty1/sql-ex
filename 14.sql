/*
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
*/

SELECT Ships.class, Ships.name, Classes.country
FROM Ships
JOIN Classes ON Ships.class = Classes.class
WHERE Classes.numGuns >= 10;