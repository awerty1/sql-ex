/*
Посчитать остаток денежных средств на всех пунктах приема для базы данных с отчетностью не чаще одного раза в день.
*/

Select
	sum(t1.sum1)
From
(
	Select point, sum(inc) sum1 
	from Income_o 
	group by point
Union
	Select point, -sum(out) sum1 
	from Outcome_o 
	group by point
) t1