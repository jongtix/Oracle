-- 01
create table DEPT_sample(
    dno number(2), dname varchar2(14), loc varchar2(13)
    );
    
desc dept_sample;

-- 02
create table emp_sample(
    eno number(4), ename varchar2(10), dno number(2)
    );
    
desc emp_sample;

-- 03
alter table emp_sample modify ename varchar2(25);
desc emp_sample;

-- 04
create table employee2
as
select empno emp_id, ename name, sal sal, deptno dept_id from emp;

desc employee2;

-- 05
drop table employee2;

-- 06
rename employee2 to emp_rename;

-- 07
alter table dept_sample drop column dname;
desc dept_sample;

-- 08
alter table dept_sample set unused (loc);

-- 09
alter table dept_sample drop unused columns;