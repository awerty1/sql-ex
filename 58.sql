/*
Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков найти процентное отношение числа моделей данного типа данного производителя к общему числу моделей этого производителя.
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя
*/

with p as(select distinct p1.maker,p2.type from product p1,product p2), 
m as(select p1.maker
,p1.type
,res=cast(cast(count(p1.model) as numeric(6,2)) / cast((select count(model) from product where maker = p1.maker) as numeric(6,2)) * 100 as numeric(6,2))
from product p1
group by p1.type,p1.maker)

select p.maker,p.type,prc=isnull(res,0) from p
left join m on m.maker = p.maker and m.type = p.type
order by p.type,p.maker