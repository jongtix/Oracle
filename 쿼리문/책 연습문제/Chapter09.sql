-- 01
create table emp_insert
as
select * from emp where 0 = 1;

desc emp_insert;

-- 02
insert into emp_insert values(1, 'LEEJM', 'student', '', sysdate, 2700, 230, 10);
select * from emp_insert;

-- 03
insert into emp_insert values(2, 'LEEJH', 'soldier', '', to_date('2017/12/07', 'YYYY/MM/DD'), 1150, '', 20);
insert into emp_insert values(2, 'LEEJH', 'soldier', '', to_date(sysdate - 1, 'YYYY/MM/DD'), 1150, '', 20);
select * from emp_insert;

-- 04
create table emp_copy2
as
select * from emp;

desc emp_copy2;
drop table emp_copy2;

-- 05
update emp_copy2 set deptno = 10 where empno = 7788;
rollback;
select * from emp_copy2 where empno = 7788;

-- 06
update emp_copy2 set job = (select job from emp_copy2 where empno = 7499), sal = (select sal from emp_copy2 where empno = 7499) where empno = 7788;
update emp_copy2 set (job, sal) = (select job, sal from emp_copy2 where empno = 7499) where empno = 7788;
rollback;
select * from emp_copy2 where empno = 7788 or empno = 7499;

-- 07
update emp_copy2 set deptno = (select deptno from emp_copy2 where empno = 7369) where job = (select job from emp_copy2 where empno = 7369);
select * from emp_copy2;

-- 08
create table dept_copy2
as
select * from dept;

select * from dept_copy2;

-- 09
delete from dept_copy2 where dname = 'RESEARCH';

-- 10
delete from dept_copy2 where deptno = 10 or deptno = 40;
delete from dept_copy2 where deptno in(10, 40);