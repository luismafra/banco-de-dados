--Q1
SELECT * FROM department;

--Q2
SELECT * FROM dependent;

--Q3
SELECT * FROM dept_locations;

--Q4
SELECT * FROM employee;

--Q5
SELECT * FROM project;

--Q6
SELECT * FROM works_on;

--Q7
SELECT e.fname, e.lname
FROM employee AS e
WHERE e.sex = 'M';

--Q8
SELECT e.fname
FROM employee AS e
WHERE e.sex = 'M' AND e.superssn IS NULL;

--Q9
SELECT e.fname as employee_name, d.fname as sup_name
FROM employee AS e, employee as d
WHERE e.superssn = d.ssn;

--Q10
SELECT e.fname
FROM employee AS e, employee as d
WHERE e.superssn = d.ssn AND d.fname = 'Franklin';

--Q11
SELECT d.dname, l.dlocation
FROM department AS d, dept_locations AS l
WHERE d.dnumber = l.dnumber;

--Q12
SELECT d.dname
FROM department AS d, dept_locations AS l
WHERE d.dnumber = l.dnumber AND LEFT(l.dlocation,1) = 'S';

--Q13
SELECT e.fname, e.lname, d.dependent_name
FROM employee AS e, dependent AS d
WHERE e.ssn = d.essn;

--Q14
SELECT e.fname || ' ' || e.minit || ' ' || e.lname as full_name, e.salary
FROM employee AS e
WHERE e.salary > 50000;

--Q15
SELECT p.pname, d.dname
FROM department AS d, project AS p
WHERE d.dnumber = p.dnum;

--Q16
SELECT p.pname, e.fname
FROM project AS p, department AS d, employee AS e
WHERE p.dnum = d.dnumber AND d.mgrssn = e.ssn AND p.pnumber > 30;

--Q17
SELECT p.pname, e.fname
FROM project AS p, employee AS e, works_on AS w
WHERE p.pnumber = w.pno AND w.essn = e.ssn;

--Q18
SELECT e.fname, d.dependent_name, d.relationship
FROM employee AS e, dependent AS d, works_on AS w
WHERE w.pno = 91 AND w.essn = e.ssn AND d.essn = e.ssn;
