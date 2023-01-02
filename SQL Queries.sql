use sports_betting;

select w.* , i.med_income AS medium_income, s.online AS online, s.in_person AS inperson
FROM wager w
LEFT OUTER JOIN income i
ON(w.year = i.year AND w.state = i.state)
LEFT JOIN status s
ON(w.state = s.state);


select * from income;
select * from wager;
select * from status;
select * from population;