use sports_betting;

CREATE TEMPORARY TABLE demographics
SELECT p.*, i.med_income AS med_income
FROM population p
JOIN income i
ON(p.year = i.year and p.state = i.state);
CREATE TEMPORARY TABLE demographics2
SELECT p.*, i.med_income AS med_income
FROM population p
JOIN income i
ON(p.year = i.year and p.state = i.state);

DROP TEMPORARY TABLE demographics;
SELECT * FROM demographics;

SELECT w.*, 
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

SELECT w2.*, 
d2.population AS population, 
d2.poverty AS poverty,
d2.unemployed AS unemployed,
d2.med_income AS med_income,
s2.online AS online,
s2.in_person AS in_person
FROM wager w2
RIGHT JOIN demographics2 d2
ON(w2.year = d2.year and w2.state = d2.state)
LEFT JOIN status s2
ON(s2.state = d2.state);

select * from income;
select * from wager;
select * from status;
select * from population;


