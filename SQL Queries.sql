use sports_betting;

SELECT 
w.year AS year,
w.month AS month,
w.state AS state,
w.revenue AS revenue,
w.handle AS handle,
w.hold AS hold,
w.taxes AS taxes,
d.population AS population, 
d.poverty AS poverty,
d.unemployed AS unemployed,
d.med_income AS med_income,
s.online AS online,
s.in_person AS in_person
FROM wager w
LEFT JOIN demographics d
ON(w.year = d.year and w.state = d.state)
LEFT JOIN status s
ON(s.state = w.state)

UNION

SELECT 
d2.year AS year,
w2.month AS month,
d2.state AS state,
w2.revenue AS revenue,
w2.handle AS handle,
w2.hold AS hold,
w2.taxes AS taxes,
d2.population AS population, 
d2.poverty AS poverty,
d2.unemployed AS unemployed,
d2.med_income AS med_income,
s2.online AS online,
s2.in_person AS in_person
FROM wager w2
RIGHT JOIN demographics d2
ON(w2.year = d2.year and w2.state = d2.state)
LEFT JOIN status s2
ON(s2.state = d2.state);


SELECT * FROM demographics;
select * from income;
select * from wager;
select * from status;
select * from population;


