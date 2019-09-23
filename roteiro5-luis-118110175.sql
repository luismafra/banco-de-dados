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
SELECT MIN(d.count) AS qtd
FROM(
    SELECT pno,COUNT(*)
    FROM works_on
    GROUP BY(pno)
) AS d;

--Q7
SELECT pno AS num_proj,COUNT(*) AS qtd_func
FROM works_on
GROUP BY(pno)
HAVING COUNT(*) = (SELECT MIN(d.count) AS qtd
FROM(
    SELECT pno,COUNT(*)
    FROM works_on
    GROUP BY(pno)
) AS d);

--Q8
SELECT w.pno AS num_proj, AVG(salary) AS media_sal
FROM (works_on as w JOIN employee AS e ON w.essn = e.ssn)
GROUP BY w.pno;

--Q9
SELECT w.pno AS num_proj,p.pname AS proj_nome, AVG(salary) AS media_sal
FROM ((works_on as w JOIN employee AS e ON w.essn = e.ssn)
 JOIN project AS p ON w.pno = p.pnumber)
GROUP BY w.pno,p.pname;

--Q10
SELECT e.fname, e.salary
FROM (works_on as w RIGHT OUTER JOIN employee AS e ON w.essn = e.ssn)
WHERE (w.pno != 92 OR w.pno IS NULL) AND e.salary > ALL (SELECT e.salary
FROM(works_on as w JOIN employee AS e ON w.essn = e.ssn)
WHERE w.pno = 92);

--Q11
SELECT ssn, COUNT(pno) AS qtd_proj
FROM (works_on as w RIGHT OUTER JOIN employee AS e ON w.essn = e.ssn)
GROUP BY ssn
ORDER BY COUNT(pno);

--Q12
SELECT w.pno,COUNT(*)
FROM (works_on as w RIGHT OUTER JOIN employee AS e ON w.essn = e.ssn)
GROUP BY(w.pno)
HAVING COUNT(*) < 5
ORDER BY(COUNT(*));

--Q13