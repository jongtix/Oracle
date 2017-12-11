-- 01
/* CREATE OR REPLACE PROCEDURE sp_commission (
    veno     emp.empno%TYPE,
    vename   emp.ename%TYPE,
    vsal     emp.sal%TYPE
) IS

    CURSOR c1 IS SELECT
        empno,
        ename,
        sal
    INTO
        veno,vename,vsal
                 FROM
        emp
                 WHERE
        comm IS NOT NULL
    ORDER BY
        ename;

BEGIN
    dbms_output.put_line('사번    이름  급여');
    dbms_output.put_line('------------------');
    FOR veno IN c1 LOOP
        EXIT WHEN c1%notfound;
        dbms_output.put_line(veno
        || '    '
        || vename
        || '    '
        || vsal);

    END LOOP;

END;
/
*/CREATE OR REPLACE PROCEDURE sp_commission IS
    CURSOR c1 IS SELECT
        *
                 FROM
        emp
                 WHERE
        comm IS NOT NULL;

BEGIN
    dbms_output.put_line('사번    이름  급여');
    dbms_output.put_line('------------------');
    FOR vemp IN c1 LOOP
        EXIT WHEN c1%notfound;
        dbms_output.put_line(vemp.empno
        || '    '
        || vemp.ename
        || '    '
        || vemp.sal);

    END LOOP;

END;
/

SET SERVEROUTPUT ON

DROP PROCEDURE sp_commission;

EXEC sp_commission;

-- 02

CREATE OR REPLACE PROCEDURE sp_commission IS
    CURSOR c1 IS SELECT
        *
                 FROM
        emp
                 WHERE
        comm IS NOT NULL
    ORDER BY
        ename DESC;

BEGIN
    dbms_output.put_line('사번    이름  급여  커미션');
    dbms_output.put_line('--------------------------');
    FOR vemp IN c1 LOOP
        EXIT WHEN c1%notfound;
        dbms_output.put_line(vemp.empno
        || '    '
        || vemp.ename
        || '    '
        || vemp.sal
        || '  '
        || vemp.comm);

    END LOOP;

END;
/

-- 03
DROP PROCEDURE sp_commission;