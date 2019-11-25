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

--C
CREATE VIEW vw_deptstats AS
SELECT p.dnum,d.dname,COUNT(*)
FROM Project AS p,Department AS d,WORKS_ON as w
WHERE w.pno = p.pnumber AND p.dnum = d.dnumber
GROUP BY(p.dnum,d.dname);

--D
CREATE VIEW vw_projstats AS
SELECT pno,COUNT(*)
FROM WORKS_ON
GROUP BY pno;


DROP VIEW vw_dptmgr;
DROP VIEW vw_empl_houston;
DROP VIEW vw_deptstats;
DROP VIEW vw_projstats;

CREATE FUNCTION check_age(ssn_a CHAR(9)) RETURNS VARCHAR(7) AS $$

DECLARE 
idade integer;

BEGIN
    SELECT EXTRACT(year FROM age(bdate)) INTO idade FROM Employee WHERE ssn = ssn_a;
    IF(idade < 0) THEN
        RETURN 'INVALID';
    ELSIF(idade IS NULL) THEN
        RETURN 'UNKNOWN';
    ELSIF(idade >= 50) THEN
        RETURN 'SENIOR';
    ELSIF(idade < 50) THEN
        RETURN 'YOUNG';
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION check_mgr() RETURNS TRIGGER AS $check_mgr$

DECLARE
dept int;

BEGIN
    SELECT e.dno INTO dept FROM Employee AS e WHERE ssn = NEW.mgrssn;
    IF (NEW.dnumber != dept) THEN
        RAISE EXCEPTION "manager must be a department's employee"
    IF(NEW.mgrssn IS NULL) THEN
        RAISE EXCEPTION "mgrssn cannot be null"
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_mgr
    BEFORE INSERT OR UPDATE ON Department
    FOR EACH ROW
    EXECUTE PROCEDURE check_mgr();