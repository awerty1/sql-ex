/*
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
 Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/

SELECT DISTINCT p1.model AS model1, p2.model AS model2, p1.speed, p1.ram
FROM PC p1
JOIN PC p2 ON p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model
ORDER BY model1 DESC, model2 DESC;