-- 뷰 view
-- 테이블의 정보를 보여주기 위한 가상의 객체타입
-- create or replace view 뷰명 as select문;
create or replace view view_emp_jop
as
select empno eno, ename, deptno dno, job
    from emp
        where job like 'SALESMAN';
select * from VIEW_EMP_JOb;
rename view_emp_jop to view_emp_job;
-- 데이터 딕셔너리에 있는 객체뷰
select * from user_views;

select * from EMP_DETAILS_VIEW;

-- view의 목적 1 : 보안
create or replace view v_emp
as
select empno no, job, mgr, deptno dno
from emp;

select * from v_emp;

select * from emp;

-- 목적 2 : 편의성
create or replace view v_emp_cmp
as
select empno, ename, sal, e.deptno dno, dname, loc
from emp e, dept d
where e.deptno = d.deptno;

select * from v_emp_cmp;

-- 데이터 딕셔너리 부분에서 view명과 select문을 조회
select view_name, text from user_views;

-- insert 가능하지만 사용하지 않음. view의 목적이 보여주기 위함이기 때문
-- view를 업데이트하면 본래 내용도 업데이트 됨.
select * from view_emp_job;
insert into view_emp_job values(8000, '홍길동', 30, 'SALESMAN');
ROLLBACK;

-- view에 그룹함수 사용
create or replace view v_emp_sal
as
select deptno dno, sum(sal) sumSal, round(avg(sal)) avgSal from emp group by deptno;
select * from v_emp_sal;

select * from emp;
update emp set sal = 5000 where empno = 8000;

-- view 제거
drop view v_emp_sal;
select * from user_views;

-- view 옵션
create or replace view v_emp
as
select * from emp;
select * from v_emp;

-- force : 테이블이 없어도 강제로 view를 만들어야 하는 경우 사용
create or replace force view v_emp_notable
as
select empno eno, ename, deptno dno, job
from emp_notable
where job like 'MAAGER';

-- with check option
create or replace view v_emp_job_nochk
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER';
select * from V_EMP_JOB_NOCHK;
insert into v_emp_job_nochk values(9000, '임꺽정', 30, 'SALESMAN');
select * from emp;

create or replace view v_emp_job_chk
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER'
with check option;

select * from v_emp_job_chk;
insert into v_emp_job_chk values(9100, '일지매', 30, 'SALESMAN');
select * from emp;
insert into v_emp_job_chk values(9100, '일지매', 30, 'MANAGER');

-- with read only : 일기 전용
create or replace view v_emp_job_readonly
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER'
with read only;
select * from V_EMP_JOB_READONLY;
insert into V_EMP_JOB_READONLY values(9200, '김길동', 30, 'MANAGER');

-- 시퀀스
-- create SEQUENCE 시퀀스명
--          [start with n]
--          [increament by n]
--          [{maxvalue n | nomaxvalue}]
--          [{minvalue n | nominvalue}]
--          [{cycle | nocycle}]
--          [{cache | nocache}]

create sequence sample_seq
    increment by 10
    start with 10;
    
select * from user_sequences;
select sample_seq.nextval from dual;
select sample_seq.currval from dual;
select sample_seq.nextval from dual;

create sequence dno_seq increment by 10 start with 10;
create table dept_second
as
select * from dept where rownum < 1;

select * from dept_second;
insert into dept_second values(dno_seq.nextval, 'ACCOUNTING', 'NEW YORK');
insert into dept_second values(dno_seq.nextval, 'SALESMAN', 'DALLAS');

-- 시퀀스 수정
-- alter sequence 시퀀스명
--          [increment by n]
--          [{maxvalue n | nomaxvalue}]
--          [{minvalue n | nominvalue}]
--          [{cycle | nocycle}]
--          [{cache n | nocache}]

select * from user_sequences;
alter sequence dno_seq maxvalue 50;
select dno_seq.nextval from dual;
alter sequence dno_seq cycle nocache;
alter sequence dno_seq minvalue 10;

-- 시퀀스 삭제
-- drop sequence 시퀀스명
drop sequence dno_seq;


-- 인덱스
-- 대용량의 데이터 검생을 빠르게 하기 위한 객체(unique한 데이터 정합을 위한 목적)
select * from user_indexes;
select * from user_ind_columns;

create unique index idx_emp_ename
on emp(ename);

select * from emp;
insert into emp values(9200, '일지매', 'SALESMAN', null, null, null, null, 30);

-- 인덱스 재생성
alter index idx_emp_ename rebuild;
delete emp where ename = '일지매';
drop index idx_emp_ename;

-- 결합인덱스 : 칼럼을 두 개 이상 합쳐서 만드는 인덱스
create index idx_dept_com
on dept_second(dname, loc);
select * from user_indexes;

-- 함수기반 인덱스
-- 잘 사용하지 않음
create index idx_emp_second_annsal on emp_copy(sal * 12);
select * from user_indexes;


-- 유저 권한, 객체 권한
-- select * from dba_data_files; sys로 접속해야 접근 가능
select * from session_privs;