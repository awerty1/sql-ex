/*
Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, 
вывести имя класса и число потопленных кораблей.
*/

with sc as (select c.class from outcomes o 
left join ships s on s.name = o.ship
left join classes c on c.class = s.class or c.class = o.ship
where result like 'sunk')
,cl as (select name,class from ships 
union 
select ship,class from outcomes o
left join classes c on ship = class where class is not null)
,cl1 as (select class from cl group by class having count(name) >= 3)

select c.class,count(sc.class) from classes c
left join sc on c.class=sc.class
where c.class in (select * from cl1)
group by c.class
having count(sc.class) >=1