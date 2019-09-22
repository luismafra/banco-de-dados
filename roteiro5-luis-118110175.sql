--Q1
SELECT COUNT(*)
FROM employee
WHERE sex = 'F';

--Q2
SELECT AVG(salary)
FROM employee
WHERE sex = 'M' AND address LIKE '%TX';

--Q3
SELECT f.superssn as ssn_supervisor, COUNT(*) as qtd_supervisionados
FROM (EMPLOYEE as e RIGHT OUTER JOIN EMPLOYEE as f ON e.ssn = f.superssn)
GROUP BY f.superssn
ORDER BY COUNT(*);

--Q4
SELECT e.fname as nome_supervisor, COUNT(*) as qtd_supervisionados
FROM (EMPLOYEE as e JOIN EMPLOYEE as f ON e.ssn = f.superssn)
GROUP BY e.fname
ORDER BY COUNT(*);

--Q5
SELECT e.fname as nome_supervisor, COUNT(*) as qtd_supervisionados
FROM (EMPLOYEE as e RIGHT OUTER JOIN EMPLOYEE as f ON e.ssn = f.superssn)
GROUP BY e.fname
ORDER BY COUNT(*);

--Q6
