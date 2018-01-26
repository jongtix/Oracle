--------------------------------------------------------
--  颇老捞 积己凳 - 格夸老-1岿-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table EMP
--------------------------------------------------------
CREATE TABLE "HR"."EMP" (
    "EMPNO"      NUMBER(4,0),
    "ENAME"      VARCHAR2(10 BYTE),
    "JOB"        VARCHAR2(9 BYTE),
    "MGR"        NUMBER(4,0),
    "HIREDATE"   DATE,
    "SAL"        NUMBER(7,2),
    "COMM"       NUMBER(7,2),
    "DEPTNO"     NUMBER(2,0)
)
SEGMENT CREATION IMMEDIATE
PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
TABLESPACE "USERS";
REM INSERTING into HR.EMP

SET DEFINE OFF;

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7369,
    'SMITH',
    'CLERK',
    7902,
    TO_DATE('80/12/17','RR/MM/DD'),
    800,
    NULL,
    20
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7499,
    'ALLEN',
    'SALESMAN',
    7698,
    TO_DATE('81/02/20','RR/MM/DD'),
    1600,
    300,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7521,
    'WARD',
    'SALESMAN',
    7698,
    TO_DATE('81/02/22','RR/MM/DD'),
    1250,
    500,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7566,
    'JONES',
    'MANAGER',
    7839,
    TO_DATE('81/04/02','RR/MM/DD'),
    2975,
    NULL,
    20
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7654,
    'MARTIN',
    'SALESMAN',
    7698,
    TO_DATE('81/09/28','RR/MM/DD'),
    1250,
    1400,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7698,
    'BLAKE',
    'MANAGER',
    7839,
    TO_DATE('81/05/01','RR/MM/DD'),
    2850,
    NULL,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7782,
    'CLARK',
    'MANAGER',
    7839,
    TO_DATE('81/06/09','RR/MM/DD'),
    3283,
    NULL,
    10
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7788,
    'SCOTT',
    'ANALYST',
    7566,
    TO_DATE('87/04/19','RR/MM/DD'),
    3000,
    NULL,
    20
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7839,
    'KING',
    'PRESIDENT',
    NULL,
    TO_DATE('81/11/17','RR/MM/DD'),
    6701,
    NULL,
    10
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7844,
    'TURNER',
    'SALESMAN',
    7698,
    TO_DATE('81/09/08','RR/MM/DD'),
    1500,
    0,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7876,
    'ADAMS',
    'CLERK',
    7788,
    TO_DATE('87/05/23','RR/MM/DD'),
    1100,
    NULL,
    20
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7900,
    'JAMES',
    'CLERK',
    7698,
    TO_DATE('81/12/03','RR/MM/DD'),
    950,
    NULL,
    30
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7902,
    'FORD',
    'ANALYST',
    7566,
    TO_DATE('81/12/03','RR/MM/DD'),
    3000,
    NULL,
    20
);

INSERT INTO hr.emp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    7934,
    'MILLER',
    'CLERK',
    7782,
    TO_DATE('82/01/23','RR/MM/DD'),
    1742,
    NULL,
    10
);
--------------------------------------------------------
--  DDL for Index PK_EMP
--------------------------------------------------------

CREATE UNIQUE INDEX "HR"."PK_EMP" ON
    "HR"."EMP" ( "EMPNO" )
        PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "USERS";
--------------------------------------------------------
--  Constraints for Table EMP
--------------------------------------------------------

ALTER TABLE "HR"."EMP"
    ADD CONSTRAINT "PK_EMP" PRIMARY KEY ( "EMPNO" )
        USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS
            STORAGE ( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT
CELL_FLASH_CACHE DEFAULT )
        TABLESPACE "USERS"
    ENABLE;