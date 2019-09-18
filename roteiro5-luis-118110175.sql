--Q1
SELECT COUNT(*)
FROM employee
WHERE sex = 'F';

--Q2
SELECT AVG(salary)
FROM employee
WHERE sex = 'M' AND address LIKE '%TX';

