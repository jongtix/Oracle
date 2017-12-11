-- ��������, ��ü����
-- create session, create table, create view, create sequence
-- ���Ѻο�
-- ����� ����
CREATE USER usertest04 IDENTIFIED BY pass4;

GRANT
    CREATE TABLE
TO usertest04;

ALTER USER usertest04
    DEFAULT TABLESPACE users;

ALTER USER usertest04
    QUOTA 2 M ON users;
    
-- ��ü(table, view sequence, procedure)�� ���� ����
-- grant ����(select, insert,update, delete, execute)
-- on object
-- to ����� [with grant option];

SELECT
    COUNT(*)
FROM
    emp;

GRANT SELECT ON emp TO usertest04 WITH GRANT OPTION;

SELECT
    COUNT(*)
FROM
    hr.emp;

GRANT SELECT ON hr.emp TO usertest02;

SELECT
    COUNT(*)
FROM
    hr.emp;
    
-- ���� ȸ�� revoke

REVOKE SELECT ON hr.emp FROM usertest02;

-- role : ������ Ư�� ���� ������ ��� �����ϴ� ����
-- DBA(ADMIN�� ó���� �� �ִ� ����)
-- connect(create session ~ create synonym)
-- resource(create table ~ create cluster)

GRANT connect TO usertest04;

GRANT resource TO usertest04;

-- ����� ���� role ����
-- create role �Ѹ� grant �ο��� ���� to ������

CREATE ROLE roletest01;

GRANT
    CREATE SESSION,
    CREATE TABLE,
    CREATE VIEW
TO roletest01;

GRANT roletest01 TO usertest04;

-- �ο��� role ���� ��ȸ

SELECT
    *
FROM
    role_sys_privs
ORDER BY
    role;

SELECT
    *
FROM
    user_role_privs
ORDER BY
    username;

CREATE ROLE roletest02;

GRANT SELECT ON hr.emp TO roletest02;

SELECT
    *
FROM
    role_tab_privs
WHERE
    table_name LIKE upper('emp');


-- synonym ���Ǿ�
-- ���̺��� ��Ī�� ����� ����ϴ� ���
-- create [public] synonym �ó�Ը� for ��ü

CREATE TABLE sampletb1 (
    memo   VARCHAR2(50)
);

INSERT INTO sampletb1 VALUES ( '������ Ǫ������' );

INSERT INTO sampletb1 VALUES ( '�ּ��� ���սô�' );

SELECT
    *
FROM
    sampletb1;

GRANT SELECT ON sampletb1 TO hr;

GRANT SELECT ON sampletb1 TO usertest04;

CREATE PUBLIC SYNONYM pub_sam2 FOR sys.sampletb1;

DROP SYNONYM pub_sam2;

-- pl/sql ����
-- ����� - declare
-- ����� - begin ~ end;
-- ���� ó���� - [exception]

SET SERVEROUTPUT ON -- ������ �޽����� ����ϱ� ���� �ɼ�

BEGIN
    dbms_output.put_line('Welcom to Oracle'); -- ��ɹ��� ������ ; ���
END; -- ��� ������ end;

/

-- ���� ���� �� ���Թ�

DECLARE
    v_eno     NUMBER(4); -- ���� Ÿ���� ��������� ǥ��
    v_ename   emp.ename%TYPE; -- ���� Ÿ���� ���� Ÿ������ ����
BEGIN
    v_eno := 7788; -- ���� �̸� := ��;
    v_ename := 'scott';
    dbms_output.put_line('�����ȣ  �����');
    dbms_output.put_line('----------------');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename);
END;
/

-- Į���� ���� �� ���

DECLARE
    v_eno     emp.empno%TYPE;
    v_ename   emp.ename%TYPE;
BEGIN
    dbms_output.put_line('�����ȣ  ����̸�');
    dbms_output.put_line('------------------');
    SELECT
        empno,
        ename
    INTO
        v_eno,v_ename -- select�� Į������ ������ ����
    FROM
        emp
    WHERE
        ename = 'SCOTT';

    dbms_output.put_line(v_eno
    || '      '
    || v_ename);
END;
/

-- ���
-- if��
-- if ���� then ~ [elsif ���� then ~ else ~] end if;

DECLARE
    v_emp    emp%rowtype; -- v_emp�� emp�� ��� �÷� Ÿ���� ���� �� ����
    temp     NUMBER(4) := 1; -- ����� ���ÿ� �ʱⰪ �ο�
    annsal   NUMBER(7,2); -- number(7, 2) ��ü 7�ڸ� �߿��� �Ҽ��� ���� 2�ڸ� ����
BEGIN
    SELECT
        *
    INTO
        v_emp
    FROM
        emp
    WHERE
        ename = 'SCOTT';

    IF
        ( v_emp.comm IS NULL )
    THEN
        v_emp.comm := 0;
    END IF;

    annsal := v_emp.sal * 12 + v_emp.comm;
    dbms_output.put_line('�����ȣ  ����̸�    ����');
    dbms_output.put_line('--------------------------');
    dbms_output.put_line(v_emp.empno
    || '       '
    || v_emp.ename
    || '     '
    || annsal);

END;
/

DECLARE
    v_eno     emp.empno%TYPE;
    v_ename   emp.ename%TYPE;
    v_dno     emp.deptno%TYPE;
    v_dname   VARCHAR2(20) := NULL;
BEGIN
    SELECT
        empno,
        ename,
        deptno
    INTO
        v_eno,v_ename,v_dno
    FROM
        emp
    WHERE
        ename = 'SCOTT';

    IF
        ( v_dno = 10 )
    THEN
        v_dname := 'ACCOUNTING';
    ELSIF ( v_dno = 20 ) THEN
        v_dname := 'RESEARCH';
    ELSIF ( v_dno = 30 ) THEN
        v_dname := 'SALESMAN';
    ELSIF ( v_dno = 40 ) THEN
        v_dname := 'OPERATIONS';
    END IF;

    dbms_output.put_line('�����ȣ  �̸�  �μ���');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename
    || '   '
    || v_dname);

END;
/

-- decode���� ����Ͽ� �μ��� ���

DECLARE
    v_eno     emp.empno%TYPE;
    v_ename   emp.ename%TYPE;
    v_dno     emp.deptno%TYPE;
    v_dname   VARCHAR2(20) := NULL;
BEGIN
    SELECT
        empno eno,
        ename,
        deptno,
        DECODE(deptno,10,'ACCOUNTING',20,'RESEARCH',30,'SALESMAN',40,'OPERATIONS')
    INTO
        v_eno,v_ename,v_dno,v_dname
    FROM
        emp
    WHERE
        ename LIKE 'SCOTT';

    dbms_output.put_line('�����ȣ  �̸�  �μ���');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename
    || '   '
    || v_dname);

END;
/

-- �ݺ��� LOOP
-- loop ~; exit where ����; end loop

DECLARE
    dan   NUMBER := 2;
    i     NUMBER := 1;
BEGIN
    LOOP
        dbms_output.put_line(dan
        || ' * '
        || i
        || ' = '
        || (dan * i) );

        i := i + 1;
        IF
            i > 9
        THEN
            EXIT;
        END IF;
    END LOOP;
END;

DECLARE
    dan   NUMBER := 2;
    i     NUMBER := 1;
BEGIN
    LOOP
        LOOP
            dbms_output.put(dan
            || ' * '
            || i
            || ' = '
            || (dan * i)
            || '   ');

            i := i + 1;
            IF
                i > 9
            THEN
                dbms_output.new_line;
                i := 1;
                EXIT;
            END IF;

        END LOOP;

        dan := dan + 1;
        IF
            dan > 9
        THEN
            EXIT;
        END IF;
    END LOOP;
END;

-- for index_counter in ����..�� loop ~; end loop;

DECLARE
    dan   NUMBER := 2;
    i     NUMBER := 1;
BEGIN
    FOR i IN 1..9 LOOP
        dbms_output.put_line(dan
        || ' * '
        || i
        || ' = '
        || (dan * i) );
    END LOOP;
END;

-- while ���� loop ~; end loop;

DECLARE
    dan   NUMBER := 2;
    i     NUMBER := 1;
BEGIN
    WHILE ( i <= 9 ) LOOP
        dbms_output.put_line(dan
        || ' * '
        || i
        || ' = '
        || (dan * i) );

        i := i + 1;
    END LOOP;
END;


-- Ŀ��
-- select�� ���� ����� �����ϰ� �ִ� ������ ���̺�(Java�� ResultSet)
-- declare
-- cursor Ŀ���� is select��;
-- begin
--  open Ŀ����;
--      fetch Ŀ���� into ����1, ����2, ...;
--  close Ŀ����;
-- end;

DECLARE
    v_dept   dept%rowtype;
    CURSOR c1 IS SELECT
        *
                 FROM
        dept;

BEGIN
    dbms_output.put_line('�μ���ȣ  �μ��� ������');
    dbms_output.put_line('-----------------------');
    OPEN c1;
    LOOP
        FETCH c1 INTO v_dept.deptno,v_dept.dname,v_dept.loc;
        EXIT WHEN c1%notfound; -- Ŀ�� ���(�����Ͱ� ������)
        dbms_output.put_line(v_dept.deptno
        || '   '
        || v_dept.dname
        || '  '
        || v_dept.loc);

    END LOOP;

    CLOSE c1;
END;

-- emp���̺�, dept���̺�, salgrade���̺�
-- �����ȣ, �����, �μ���ȣ, �μ���, �޿���, ����� ����ϼ���.
-- cursor c_empinfo;

DECLARE
    v_emp        emp%rowtype;
    v_dept       dept%rowtype;
    v_salgrade   salgrade%rowtype;
    CURSOR c_empinfo IS SELECT
        emp.empno,
        emp.ename,
        emp.deptno,
        dept.dname,
        emp.sal,
        salgrade.grade
                        FROM
        emp,
        dept,
        salgrade
                        WHERE
        emp.deptno = dept.deptno
        AND   emp.sal BETWEEN salgrade.losal AND salgrade.hisal;

BEGIN
    dbms_output.put_line('�����ȣ  ����� �μ���ȣ    �μ��� �޿��� ���');
    dbms_output.put_line('-----------------------------------------------');
    OPEN c_empinfo;
    LOOP
        FETCH c_empinfo INTO v_emp.empno,v_emp.ename,v_emp.deptno,v_dept.dname,v_emp.sal,v_salgrade.grade;

        EXIT WHEN c_empinfo%notfound;
        dbms_output.put_line(v_emp.empno
        || ' '
        || v_emp.ename
        || '   '
        || v_emp.deptno
        || '  '
        || v_dept.dname
        || '  '
        || v_emp.sal
        || ' '
        || v_salgrade.grade);

    END LOOP;

    CLOSE c_empinfo;
END;

-- cursor for - ����, open, fetch, close;
-- for ���ڵ�� in Ŀ���� loop select��; ~; end loop;

DECLARE
    v_dept   dept%rowtype;
    CURSOR c1 IS SELECT
        *
                 FROM
        dept;

BEGIN
    dbms_output.put_line('�μ���ȣ  �μ��� ������');
    dbms_output.put_line('-----------------------');
    FOR v_dept IN c1 LOOP
        EXIT WHEN c1%notfound;
        dbms_output.put_line(v_dept.deptno
        || '   '
        || v_dept.dname
        || '  '
        || v_dept.loc);

    END LOOP;

END;