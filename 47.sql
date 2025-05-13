/*
Определить страны, которые потеряли в сражениях все свои корабли.
*/

with a_ships as
(SELECT ship, country from outcomes o
 JOIN classes c ON (c.class = o.ship)
 UNION
 SELECT name, country FROM ships s
 JOIN classes c ON (c.class = s.class)
), countries_count as (select country,c =count(ship) from a_ships group by country)
,sunk_ships as (select ship from outcomes where result like 'sunk')
,sunk_ships_per_country as (select country,s=sum(iif(ss.ship is not null,1,0)) from a_ships s left join sunk_ships ss on ss.ship = s.ship group by country)
select cc.country 
from countries_count cc 
	left join sunk_ships_per_country sspc on sspc.country like cc.country
where c-s = 0