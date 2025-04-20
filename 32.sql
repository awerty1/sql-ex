/*
Одной из характеристик корабля является половина куба калибра его главных орудий (mw). 
С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, 
у которой есть корабли в базе данных.
*/

Select 
	t1.country,
	cast(avg(power(t1.bore,3)/2) as numeric(6,2)) as weight
From (
	Select c.country, c.bore, s.name
	From Classes c
		Left Join Ships s On c.class=s.class
	Union
	Select c.country, c.bore, o.ship name
	From Classes c
		Left Join Outcomes o on c.class=o.ship
		) t1
Where name is not null
Group by t1.country

