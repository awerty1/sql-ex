/*
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).
*/

Select 
	c.class 
From Classes c
Left Join (Select class, name 
	From Ships
	Union
Select 
	Classes.class as class, Outcomes.ship as name
From Outcomes
Join Classes ON Outcomes.ship = Classes.class) as s On c.class = s.class
Group by c.class
Having count(s.name)=1
