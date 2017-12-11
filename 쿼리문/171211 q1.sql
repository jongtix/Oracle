-- 프로시져
-- 여러개의 실행문을 묶어서 처리하는 내장 객체 형태의 object
-- create [or replace] procedure 프로시져명
-- (아규먼트1 [in | out] datatype, 아규먼트2 [in | out] datatype, ...)
-- is | as
-- 변수 선언
-- begin
-- 실행부;
-- end;

-- SCOTT 사원의 급여 출력 프로시져
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

    dbms_output.put_line('SCOTT의 급여는 '
    || v_sal);
END;
/

SET SERVEROUTPUT ON
-- 프로시져 실행

EXEC
    sp_sal;
/

SELECT
    *
FROM
    user_source
WHERE
    name = upper('sp_sal');

-- 프로시져 삭제

DROP PROCEDURE sp_sal;

-- in 매개변수 사용하기

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
    || ' 의 급여는 '
    || v_sal);
END;
/

EXEC
    sp_sal_ename('SCOTT');
/

-- in, out모드 사용

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

VARIABLE v_sal NUMBER; -- 결과를 저장할 변수 선언

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


-- 함수
-- 특정 테이터를 요청하는 오브젝트.
-- 아규먼트를 받아서 처리 후 결과를 리턴해주는 오브젝트
-- create [or replace] function 함수명
-- (아규먼트 [in | out | inout] 타입...)
-- return타입;
-- is
-- 로컬 변수 선언
-- begin
-- return 로컬변수 | out변수;
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
  
    
-- 트리거
-- 이벤트(트랜잭션 - insert, update, delete)가 발생 시
-- 자동적으로 처리되는 프로시져같은 object
-- create trigger 트리거명
-- [before | after] [insert | update | delete]
-- on 테이블
-- [for each row]
-- [when 조건]
-- begin
-- 실행문;
-- end;
-- cf) callback함수도 비슷한 기능

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

-- dept_org테이블에 트리거 생성

CREATE OR REPLACE TRIGGER trg_sam1 AFTER
    INSERT ON dept_org
    FOR EACH ROW -- 한 행이 입력 직후에 가동되는 trigger
BEGIN
    IF
        inserting
    THEN
        dbms_output.put_line('Insert Trigger 발생');
        INSERT INTO dept_copy3 VALUES (
            :new.deptno,
            :new.dname,
            :new.loc
        );

    END IF;
END;
/

-- trigger 확인

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

-- delete 트리거

CREATE OR REPLACE TRIGGER trg_sam2 AFTER
    DELETE ON dept_org
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Delete Trigger 발생');
    DELETE FROM dept_copy3
    WHERE
        dept_copy3.deptno =:old.deptno; -- old.deptno의 값은 dept_org테이블의 칼럼값

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
-- emp테이블의 급여를 인상하면 각 사원의 인상 내역을 history로 저장
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
    
    
-- 패키지
-- 오브젝트(procedure, function, trigger)들을 업무 목적별로 묶어서 관리하는 객체
-- 패키지 헤드부분
-- create [or replace] package 패키지명
-- is
-- procedure 프로시져명1;
-- procedure 프로시져명2;
-- end;

-- 패키지 body부분
-- create [or replace] package body 패키지명
-- is
-- procedure 프로시져명1
-- is ~
-- end;
-- procedure 프로시져명2
-- is ~
-- end;
-- end;

-- execute 패키지명.프로시져명;

-- 선언부

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
        dbms_output.put_line('부서번호 / 부서명 / 지역명');
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