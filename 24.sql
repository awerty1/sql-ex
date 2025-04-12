/*
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.
*/

select model from (
select pc.model,pc.price,type from pc left join product p on p.model = pc.model
union
select l.model,l.price,type from laptop l left join product p on p.model = l.model
union
select pr.model,pr.price,p.type from printer pr left join product p on p.model = pr.model
) q1
where price = 

(select max(price) from (
select pc.model,pc.price,type from pc left join product p on p.model = pc.model
union
select l.model,l.price,type from laptop l left join product p on p.model = l.model
union
select pr.model,pr.price,p.type from printer pr left join product p on p.model = pr.model
) q)


