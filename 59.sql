/*
Посчитать остаток денежных средств на каждом пункте приема для базы данных с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
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
	group by point
) in1
Left Join
(
	Select point, sum(out) sum1 
	from Outcome_o 
	group by point
) out1
On out1.point=in1.point
