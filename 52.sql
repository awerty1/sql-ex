/*
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн
*/

Select
	distinct Ships.name
From
	Ships, Classes
Where Ships.class=Classes.class and Classes.type='bb' and
upper(Classes.country) = 'JAPAN' and (Classes.numGuns >= 9 Or Classes.numGuns is Null) and (Classes.bore < 19 Or Classes.bore is Null) and (Classes.displacement <= 65000 Or Classes.displacement  is Null)
