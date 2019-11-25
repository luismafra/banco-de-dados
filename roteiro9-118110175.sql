--A
CREATE VIEW vw_dptmgr AS 
SELECT d.Dnumber,e.Fname
FROM Employee AS e,Department AS d
WHERE e.ssn = d.mgrssn;

--B
CREATE VIEW vw_empl_houston AS
SELECT fname,ssn
FROM Employee
WHERE Address LIKE '%Houston%';



--D
CREATE VIEW vw_projstats AS
SELECT pno,COUNT(*)
FROM WORKS_ON
GROUP BY pno;