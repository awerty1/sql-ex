/*
Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.
*/

WITH SunkShips AS (
    SELECT Outcomes.ship, Classes.class
    FROM Outcomes
    JOIN Classes ON Outcomes.ship = Classes.class
    WHERE Outcomes.result = 'sunk'
    UNION
    SELECT Outcomes.ship, Ships.class
    FROM Outcomes
    JOIN Ships ON Outcomes.ship = Ships.name
    JOIN Classes ON Ships.class = Classes.class
    WHERE Outcomes.result = 'sunk'
)
SELECT Classes.class, COUNT(SunkShips.ship) AS sunk_ships
FROM Classes
LEFT JOIN SunkShips ON Classes.class = SunkShips.class
GROUP BY Classes.class
