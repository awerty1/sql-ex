/*
Найти производителей, которые выпускают более одной модели, при этом все выпускаемые 
производителем модели являются продуктами одного типа.
Вывести: maker, type
*/

select q1.maker,q2.type from (
select maker from product
group by maker
having count(model) > 1 and count(distinct type) = 1
) q1 
left join (select distinct maker, type from product) q2 on q1.maker = q2.maker
