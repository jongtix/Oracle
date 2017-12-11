-- 01
SET SERVEROUTPUT ON

DECLARE
    v_eno      emp.empno%TYPE;
    v_ename    emp.ename%TYPE;
    v_deptno   emp.deptno%TYPE;
    v_dname    VARCHAR2(20);
BEGIN
    SELECT
        empno,
        ename,
        deptno
    INTO
        v_eno,v_ename,v_deptno
    FROM
        emp
    WHERE
        ename = 'KING';

    IF
        ( v_deptno = 10 )
    THEN
        v_dname := 'ACCOUNTIN';
    ELSIF ( v_deptno = 20 ) THEN
        v_dname := 'RESEARCH';
    ELSIF ( v_deptno = 30 ) THEN
        v_dname := 'SALES';
    ELSIF ( v_deptno = 40 ) THEN
        v_dname := 'OPERATIONS';
    END IF;

    dbms_output.put_line('사번 / 이름 / 부서명');
    dbms_output.put_line(v_eno
    || ' / '
    || v_ename
    || ' / '
    || v_dname);

END;
/

-- 02

DECLARE
    i      NUMBER := 1;
    vsum   NUMBER := 0;
BEGIN
    LOOP
        vsum := vsum + i;
        i := i + 1;
        IF
            i > 10
        THEN
            EXIT;
        END IF;
    END LOOP;

    dbms_output.put_line(vsum);
END;
/

-- 03

DECLARE
    i     NUMBER := 1;
    tot   NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        tot := tot + i;
    END LOOP;
    dbms_output.put_line(tot);
END;
/

-- 04

DECLARE
    i     NUMBER := 1;
    tot   NUMBER := 0;
BEGIN
    WHILE i <= 10 LOOP
        tot := tot + i;
        i := i + 1;
    END LOOP;

    dbms_output.put_line(tot);
END;
/

-- 05

SET SERVEROUTPUT ON

DECLARE
    vemp   emp%rowtype;
    CURSOR c1 IS SELECT
        *
    INTO
        vemp
                 FROM
        emp
                 WHERE
        comm IS NOT NULL
    ORDER BY
        ename;

BEGIN
    dbms_output.put_line('사번    이름  급여');
    dbms_output.put_line('------------------');
    FOR vemp IN c1 LOOP
        dbms_output.put_line(vemp.empno
        || '  '
        || vemp.ename
        || '    '
        || vemp.sal);
    END LOOP;

END;
/