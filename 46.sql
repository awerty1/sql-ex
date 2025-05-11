/*
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.
*/

Select 
	otc.ship, displacement, numGuns From (
Select name, displacement, numGuns from Ships sh
	Join Classes cls On sh.class=cls.class
Union
Select class as name, displacement, numGuns from Classes) as sel1
Right Join Outcomes otc On sel1.name=otc.ship
Where otc.battle = 'Guadalcanal'