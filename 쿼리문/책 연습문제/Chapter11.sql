-- 01
CREATE OR REPLACE VIEW v_em_dno AS
    SELECT
        empno eno,
        ename,
        deptno dno
    FROM
        emp
    WHERE
        deptno = 20;

SELECT
    *
FROM
    v_em_dno;

-- 02
CREATE OR REPLACE VIEW v_em_dno AS
    SELECT
        empno eno,
        ename,
        deptno dno,
        sal salary
    FROM
        emp
    WHERE
        deptno = 20;

SELECT
    *
FROM
    v_em_dno;

-- 03
DROP VIEW v_em_dno;