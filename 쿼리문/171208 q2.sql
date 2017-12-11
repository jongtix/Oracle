-- 유저권한, 객체권한
-- create session, create table, create view, create sequence
-- 권한부여
-- 사용자 생성
CREATE USER usertest04 IDENTIFIED BY pass4;

GRANT
    CREATE TABLE
TO usertest04;

ALTER USER usertest04
    DEFAULT TABLESPACE users;

ALTER USER usertest04
    QUOTA 2 M ON users;
    
-- 객체(table, view sequence, procedure)에 대한 권한
-- grant 권한(select, insert,update, delete, execute)
-- on object
-- to 사용자 [with grant option];

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
    
-- 권한 회수 revoke

REVOKE SELECT ON hr.emp FROM usertest02;

-- role : 권한을 특정 목적 단위로 묶어서 관리하는 단위
-- DBA(ADMIN이 처리할 수 있는 권한)
-- connect(create session ~ create synonym)
-- resource(create table ~ create cluster)

GRANT connect TO usertest04;

GRANT resource TO usertest04;

-- 사용자 정의 role 생성
-- create role 롤명 grant 부여할 권한 to 유저명

CREATE ROLE roletest01;

GRANT
    CREATE SESSION,
    CREATE TABLE,
    CREATE VIEW
TO roletest01;

GRANT roletest01 TO usertest04;

-- 부여한 role 정보 조회

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


-- synonym 동의어
-- 테이블의 별칭을 만들어 사용하는 경우
-- create [public] synonym 시노님명 for 객체

CREATE TABLE sampletb1 (
    memo   VARCHAR2(50)
);

INSERT INTO sampletb1 VALUES ( '오월은 푸르구나' );

INSERT INTO sampletb1 VALUES ( '최선을 다합시다' );

SELECT
    *
FROM
    sampletb1;

GRANT SELECT ON sampletb1 TO hr;

GRANT SELECT ON sampletb1 TO usertest04;

CREATE PUBLIC SYNONYM pub_sam2 FOR sys.sampletb1;

DROP SYNONYM pub_sam2;

-- pl/sql 구성
-- 선언부 - declare
-- 실행부 - begin ~ end;
-- 예외 처리부 - [exception]

SET SERVEROUTPUT ON -- 서버에 메시지를 출력하기 위한 옵션

BEGIN
    dbms_output.put_line('Welcom to Oracle'); -- 명령문의 구분은 ; 사용
END; -- 블록 구분은 end;

/

-- 변수 선언 및 대입문

DECLARE
    v_eno     NUMBER(4); -- 변수 타입을 명시적으로 표시
    v_ename   emp.ename%TYPE; -- 변수 타입을 참조 타입으로 선언
BEGIN
    v_eno := 7788; -- 변수 이름 := 값;
    v_ename := 'scott';
    dbms_output.put_line('사원번호  사원명');
    dbms_output.put_line('----------------');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename);
END;
/

-- 칼럼값 대입 및 출력

DECLARE
    v_eno     emp.empno%TYPE;
    v_ename   emp.ename%TYPE;
BEGIN
    dbms_output.put_line('사원번호  사원이름');
    dbms_output.put_line('------------------');
    SELECT
        empno,
        ename
    INTO
        v_eno,v_ename -- select한 칼럼값을 변수에 대입
    FROM
        emp
    WHERE
        ename = 'SCOTT';

    dbms_output.put_line(v_eno
    || '      '
    || v_ename);
END;
/

-- 제어문
-- if문
-- if 조건 then ~ [elsif 조건 then ~ else ~] end if;

DECLARE
    v_emp    emp%rowtype; -- v_emp는 emp의 모든 컬럼 타입을 가질 수 있음
    temp     NUMBER(4) := 1; -- 선언과 동시에 초기값 부여
    annsal   NUMBER(7,2); -- number(7, 2) 전체 7자리 중에서 소수점 이하 2자리 차지
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
    dbms_output.put_line('사원번호  사원이름    연봉');
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

    dbms_output.put_line('사원번호  이름  부서명');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename
    || '   '
    || v_dname);

END;
/

-- decode문을 사용하여 부서명 출력

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

    dbms_output.put_line('사원번호  이름  부서명');
    dbms_output.put_line(v_eno
    || '   '
    || v_ename
    || '   '
    || v_dname);

END;
/

-- 반복문 LOOP
-- loop ~; exit where 조건; end loop

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

-- for index_counter in 시작..끝 loop ~; end loop;

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

-- while 조건 loop ~; end loop;

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


-- 커서
-- select한 쿼리 결과를 저장하고 있는 가상의 테이블(Java의 ResultSet)
-- declare
-- cursor 커서명 is select문;
-- begin
--  open 커서명;
--      fetch 커서명 into 변수1, 변수2, ...;
--  close 커서명;
-- end;

DECLARE
    v_dept   dept%rowtype;
    CURSOR c1 IS SELECT
        *
                 FROM
        dept;

BEGIN
    dbms_output.put_line('부서번호  부서명 지역명');
    dbms_output.put_line('-----------------------');
    OPEN c1;
    LOOP
        FETCH c1 INTO v_dept.deptno,v_dept.dname,v_dept.loc;
        EXIT WHEN c1%notfound; -- 커서 상수(데이터가 없으면)
        dbms_output.put_line(v_dept.deptno
        || '   '
        || v_dept.dname
        || '  '
        || v_dept.loc);

    END LOOP;

    CLOSE c1;
END;

-- emp테이블, dept테이블, salgrade테이블
-- 사원번호, 사원명, 부서번호, 부서명, 급여액, 등급을 출력하세요.
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
    dbms_output.put_line('사원번호  사원명 부서번호    부서명 급여액 등급');
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

-- cursor for - 선언, open, fetch, close;
-- for 레코드명 in 커서명 loop select문; ~; end loop;

DECLARE
    v_dept   dept%rowtype;
    CURSOR c1 IS SELECT
        *
                 FROM
        dept;

BEGIN
    dbms_output.put_line('부서번호  부서명 지역명');
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