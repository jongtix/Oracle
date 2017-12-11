-- ���ν���
-- �������� ���๮�� ��� ó���ϴ� ���� ��ü ������ object
-- create [or replace] procedure ���ν�����
-- (�ƱԸ�Ʈ1 [in | out] datatype, �ƱԸ�Ʈ2 [in | out] datatype, ...)
-- is | as
-- ���� ����
-- begin
-- �����;
-- end;

-- SCOTT ����� �޿� ��� ���ν���
CREATE OR REPLACE PROCEDURE sp_sal IS
    v_sal   emp.sal%TYPE;
BEGIN
    SELECT
        sal
    INTO
        v_sal
    FROM
        emp
    WHERE
        ename = 'SCOTT'; -- hardcoding

    dbms_output.put_line('SCOTT�� �޿��� '
    || v_sal);
END;
/

SET SERVEROUTPUT ON
-- ���ν��� ����

EXEC
    sp_sal;
/

SELECT
    *
FROM
    user_source
WHERE
    name = upper('sp_sal');

-- ���ν��� ����

DROP PROCEDURE sp_sal;

-- in �Ű����� ����ϱ�

CREATE OR REPLACE PROCEDURE sp_sal_ename (
    v_ename   IN emp.ename%TYPE
) IS
    v_sal   emp.sal%TYPE;
BEGIN
    SELECT
        sal
    INTO
        v_sal
    FROM
        emp
    WHERE
        upper(ename) = upper(v_ename);

    dbms_output.put_line(v_ename
    || ' �� �޿��� '
    || v_sal);
END;
/

EXEC
    sp_sal_ename('SCOTT');
/

-- in, out��� ���

CREATE OR REPLACE PROCEDURE sp_sal_ename2 (
    v_sal     OUT emp.sal%TYPE,
    v_ename   IN emp.ename%TYPE
)
    AS
BEGIN
    SELECT
        sal
    INTO
        v_sal
    FROM
        emp
    WHERE
        upper(ename) = upper(v_ename);

END;
/

VARIABLE v_sal NUMBER; -- ����� ������ ���� ����

EXEC sp_sal_ename2(:v_sal,'scott');

PRINT v_sal;

CREATE OR REPLACE PROCEDURE sp_emp_ename3 (
    v_empno    IN emp.empno%TYPE,
    v_ename    IN emp.ename%TYPE,
    v_sal      OUT emp.sal%TYPE,
    v_annsal   OUT NUMBER
)
    AS
BEGIN
    SELECT
        sal,
        sal * 12 + nvl(comm,0)
    INTO
        v_sal,v_annsal
    FROM
        emp
    WHERE
        empno = v_empno
        AND   upper(ename) = upper(v_ename);

END;
/

DROP PROCEDURE sp_emp_ename3;

VARIABLE v_sal NUMBER;

VARIABLE v_annsal NUMBER;

EXEC sp_emp_ename3(7788,'scott',:v_sal,:v_annsal);

PRINT v_sal

v_annsal;

CREATE OR REPLACE PROCEDURE sp_emp_sal (
    v_sal IN OUT NUMBER
)
    AS
BEGIN
    SELECT
        sal
    INTO
        v_sal
    FROM
        emp
    WHERE
        empno = v_sal;

END;
/


-- �Լ�
-- Ư�� �����͸� ��û�ϴ� ������Ʈ.
-- �ƱԸ�Ʈ�� �޾Ƽ� ó�� �� ����� �������ִ� ������Ʈ
-- create [or replace] function �Լ���
-- (�ƱԸ�Ʈ [in | out | inout] Ÿ��...)
-- returnŸ��;
-- is
-- ���� ���� ����
-- begin
-- return ���ú��� | out����;
-- end;

CREATE OR REPLACE FUNCTION fn_sal_ename (
    v_ename   IN emp.ename%TYPE
) RETURN NUMBER IS
    v_sal   NUMBER(7,2);
BEGIN
    SELECT
        sal
    INTO
        v_sal
    FROM
        emp
    WHERE
        upper(ename) = upper(v_ename);

    RETURN v_sal;
END;
/

VARIABLE v_sal NUMBER;

EXEC :v_sal := fn_sal_ename('scott');

PRINT v_sal;

SELECT
    ename,
    fn_sal_ename(ename)
FROM
    emp
WHERE
    ename = 'SCOTT';
  
    
-- Ʈ����
-- �̺�Ʈ(Ʈ����� - insert, update, delete)�� �߻� ��
-- �ڵ������� ó���Ǵ� ���ν������� object
-- create trigger Ʈ���Ÿ�
-- [before | after] [insert | update | delete]
-- on ���̺�
-- [for each row]
-- [when ����]
-- begin
-- ���๮;
-- end;
-- cf) callback�Լ��� ����� ���

CREATE TABLE dept_org
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            ROWNUM < 1;

CREATE TABLE dept_copy3
    AS
        SELECT
            *
        FROM
            dept
        WHERE
            ROWNUM < 1;

-- dept_org���̺� Ʈ���� ����

CREATE OR REPLACE TRIGGER trg_sam1 AFTER
    INSERT ON dept_org
    FOR EACH ROW -- �� ���� �Է� ���Ŀ� �����Ǵ� trigger
BEGIN
    IF
        inserting
    THEN
        dbms_output.put_line('Insert Trigger �߻�');
        INSERT INTO dept_copy3 VALUES (
            :new.deptno,
            :new.dname,
            :new.loc
        );

    END IF;
END;
/

-- trigger Ȯ��

SELECT
    trigger_name,
    trigger_type,
    triggering_event,
    status,
    trigger_body
FROM
    user_triggers
WHERE
    table_name = 'DEPT_ORG';

INSERT INTO dept_org VALUES (
    10,
    'ACCOUNTING',
    'NEW YORK'
);

SELECT
    *
FROM
    dept_org;

SELECT
    *
FROM
    dept_copy3;

ALTER TRIGGER trg_sam1 DISABLE;

INSERT INTO dept_org VALUES (
    20,
    'RESEARCH',
    'DALLAS'
);

ALTER TRIGGER trg_sam1 ENABLE;

INSERT INTO dept_org VALUES (
    30,
    'SALES',
    'CHICAGO'
);

-- delete Ʈ����

CREATE OR REPLACE TRIGGER trg_sam2 AFTER
    DELETE ON dept_org
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Delete Trigger �߻�');
    DELETE FROM dept_copy3
    WHERE
        dept_copy3.deptno =:old.deptno; -- old.deptno�� ���� dept_org���̺��� Į����

END;
/

DELETE dept_org WHERE
    deptno = 10;

SELECT
    *
FROM
    dept_org;

SELECT
    *
FROM
    dept_copy3;

TRUNCATE TABLE dept_org;

TRUNCATE TABLE dept_copy3;

INSERT INTO dept_org
    SELECT
        *
    FROM
        dept;

-- update trigger
-- emp���̺��� �޿��� �λ��ϸ� �� ����� �λ� ������ history�� ����
-- table(seq, empno, before_sal, after_sal, update)

CREATE TABLE emp_sal_history (
    seq          NUMBER,
    empno        NUMBER(4),
    before_sal   NUMBER(7,2),
    after_sal    NUMBER(7,2),
    up_date      DATE
);

CREATE SEQUENCE sal_his_seq START WITH 1 INCREMENT BY 1 NOCYCLE;

CREATE OR REPLACE TRIGGER trg_upsal AFTER
    UPDATE ON emp_copy2
    FOR EACH ROW
BEGIN
    INSERT INTO emp_sal_history VALUES (
        sal_his_seq.NEXTVAL,
        :old.empno,
        :old.sal,
        :new.sal,
        SYSDATE
    );

END;
/

SELECT
    empno,
    sal,
    sal * 1.05
FROM
    emp_copy2;

ROLLBACK;

UPDATE emp_copy2
    SET
        sal = sal * 1.05;

SELECT
    *
FROM
    emp_sal_history;

SELECT
    *
FROM
    emp;
    
    
-- ��Ű��
-- ������Ʈ(procedure, function, trigger)���� ���� �������� ��� �����ϴ� ��ü
-- ��Ű�� ���κ�
-- create [or replace] package ��Ű����
-- is
-- procedure ���ν�����1;
-- procedure ���ν�����2;
-- end;

-- ��Ű�� body�κ�
-- create [or replace] package body ��Ű����
-- is
-- procedure ���ν�����1
-- is ~
-- end;
-- procedure ���ν�����2
-- is ~
-- end;
-- end;

-- execute ��Ű����.���ν�����;

-- �����

CREATE OR REPLACE PACKAGE exam_pack IS
    FUNCTION cal_bonus (
        vempno   IN emp.empno%TYPE
    ) RETURN NUMBER;

    PROCEDURE cursor_sam02;

END;
/

CREATE OR REPLACE PACKAGE BODY exam_pack IS

    FUNCTION cal_bonus (
        vempno   IN emp.empno%TYPE
    ) RETURN NUMBER IS
        vsal   NUMBER(7,2);
    BEGIN
        SELECT
            sal
        INTO
            vsal
        FROM
            emp
        WHERE
            empno = vempno;

        RETURN vsal * 200;
    END;

    PROCEDURE cursor_sam02 IS
        vdept   dept%rowtype;
        CURSOR c1 IS SELECT
            *
                     FROM
            dept;

    BEGIN
        dbms_output.put_line('�μ���ȣ / �μ��� / ������');
        dbms_output.put_line('--------------------------');
        FOR vdept IN c1 LOOP
            EXIT WHEN c1%notfound;
            dbms_output.put_line(vdept.deptno
            || ' / '
            || vdept.dname
            || ' / '
            || vdept.loc);

        END LOOP;

    END;

END;
/

VARIABLE var_res NUMBER;

EXEC :var_res := exam_pack.cal_bonus(7788);

PRINT var_res;

EXEC exam_pack.cursor_sam02;