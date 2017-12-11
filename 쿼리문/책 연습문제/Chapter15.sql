CREATE OR REPLACE PROCEDURE sp_commission IS
    vemp emp%rowtype;
    cursor c1 is SELECT
        empno,
        ename,
        sal
    FROM
        emp
    WHERE
        comm IS NOT NULL;
BEGIN
    for vemp in c1 loop
    dbms_output.put_line('사번    이름  급여');
    dbms_output.put_line('------------------');
    dbms_output.put_line(vemp.empno||'  '||
    end loop;
    
    
END;