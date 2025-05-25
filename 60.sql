/*
Посчитать остаток денежных средств на начало дня 15/04/2001 на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. 
Вывод: пункт, остаток.
Замечание. Не учитывать пункты, информации о которых нет до указанной даты.
*/

Select
	in1.point,
	in1.sum1-
(Case When out1.sum1 is Null Then 0
	Else out1.sum1
	End)
From
(
	Select point, sum(inc) sum1 
	from Income_o 
	Where date < '2001-04-15'
	group by point
) in1
Left Join
(
	Select point, sum(out) sum1 
	from Outcome_o 
	Where date < '2001-04-15'
	group by point
) out1
On out1.point=in1.point

