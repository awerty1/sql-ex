/*
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
[т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). 
Использовать таблицы Income_o и Outcome_o.
*/

SELECT 
    COALESCE(Income_o.point, Outcome_o.point) AS point,
    COALESCE(Income_o.date, Outcome_o.date) AS date,
    Income_o.inc AS income,
    Outcome_o.out AS outcome
FROM Income_o
FULL JOIN Outcome_o 
    ON Income_o.point = Outcome_o.point 
    AND Income_o.date = Outcome_o.date
