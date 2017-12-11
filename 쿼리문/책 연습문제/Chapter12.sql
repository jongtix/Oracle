-- 01
CREATE SEQUENCE emp_seq_sample START WITH 1 INCREMENT BY 1 MAXVALUE 10000;

SELECT
    emp_seq_sample.NEXTVAL
FROM
    dual;

DROP SEQUENCE emp_seq_sample;

-- 02
CREATE TABLE emp001
    AS
        SELECT
            empno,
            ename,
            hiredate
        FROM
            emp
        WHERE
            0 = 1;

INSERT INTO emp001 VALUES (
    emp_seq_sample.NEXTVAL,
    'JULIA',
    TO_DATE('11/05/10','YY/MM/DD')
);

SELECT
    *
FROM
    emp001;

-- 03
CREATE INDEX dix_emp001_ename ON
    emp001 ( ename );