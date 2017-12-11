-- Chap05
select sum(sal) as "급여총액", avg(sal) as "급여평균", max(sal) as "최대급여", min(sal) as "최소급여" from emp;
select max(hiredate), min(hiredate) from emp;
select sum(comm) as "커미션 총액" from emp;

select count(*) as "사원의 수" from emp;
select count(comm) from emp;
select count(DISTINCT job) from emp;
-- select ename, max(sal) from emp;
-- select ename, sal from emp where sal = max(sal);
select ename, sal from emp where sal = (select max(sal) from emp);

select deptno, avg(sal) from emp group by deptno;
select avg(sal) from emp group by deptno;
select deptno, job, count(*), sum(sal) from emp group by deptno, job order by deptno, job;

select deptno, max(sal) from emp group by deptno having max(sal) >= 3000;
select job, count(*), sum(sal) from emp where job not like '%MANAGER%' group by job having sum(sal) >= 5000 order by sum(sal);
select max(avg(sal)) from emp group by deptno;

-- Chap06
select * from emp, DEPT where emp.DEPTNO = DEPT.DEPTNO;
select empno, ename, dname from emp, dept where emp.deptno = dept.DEPTNO and empno = 7788;

-- select e.empno, e.ename, d.dname, e.deptno from emp e natural join dept d where e.empno = 7788;
select e.empno, e.ename, d.dname, deptno from emp e natural join dept d where e.empno = 7788;
select e.empno, e.ename, d.dname, deptno from emp e join dept d using(deptno) where e.empno = 7788;
select e.empno, e.ename, d.dname, e.deptno from emp e join dept d on e.deptno = d.deptno where e.empno = 7788;

select * from salgrade;
select ename, sal, grade from emp, salgrade where sal between losal and hisal;
select e.ename, d.dname, e.sal, s.grade from emp e, dept d, salgrade s where e.deptno = d.deptno and sal between losal and hisal;

select employees.ename, mgr.ename from emp employees, emp mgr where employees.MGR = mgr.empno;
select ename, mgr from emp;
select e.ename || '의 직속 상관은 ' || m.ename from emp e join emp m on e.mgr = m.empno;

select e.ename || '의 직속 상관은 ' || m.ename from emp e join emp m on e.mgr = m.empno(+);
select e.ename || '의 직속 상관은 ' || m.ename from emp e left outer join emp m on e.mgr = m.empno;

-- Chap 07
select ename, deptno from emp where deptno = (select deptno from emp where lower(ename) = 'scott');
select ename, job, sal from emp where sal = (select min(sal) from emp);
select ename, job, sal from emp where sal in (select min(sal) from emp group by deptno);

select empno, ename, job, sal from emp where sal < any (select sal from emp where job = 'SALESMAN') and job <> 'SALESMAN';
select empno, ename, job, sal from emp where sal < all (select sal from emp where job = 'SALESMAN') and job <> 'SALESMAN';

-- Chap 08
create table dept_sub(
    dno number(2), dname varchar2(14), loc varchar2(13));
create table dept_sub2 as select * from dept_sub;
create table dept20 as select empno eno, ename, sal * 12 annsal from emp where deptno = 20;
create table dept_sub3 as select dno, dname from dept_sub where 0 = 1;
desc dept20;
select * from dept20;
alter table dept20 add(dirth date);
alter table dept20 modify ename varchar2(30);
alter table dept20 drop column ename;
alter table dept20 set unused(eno);
alter table dept20 drop unused columns;
alter table dept20 set unused(dirth);
alter table dept20 add(birth date);

rename dept20 to emp20;

drop table emp20;

truncate table dept_sub2;
select * from dept_sub2;

-- Chap 08
select table_name from user_tables;

select owner, table_name from all_tables;

-- select owner, table_name from dba_tables;

-- Chap 09
create table dept_copy as select * from dept where 0 = 1;
desc dept_copy;
insert into dept_copy values(10, 'ACCOUNTING', 'NEW YORK');
select * from dept_copy;
insert into dept_copy(deptno, LOC, dname) values(20, 'DALLAS', 'RESEARCH');
INSERT INTO DEPT_COPY(DEPTNO, DNAME) VALUES(30, 'SALES');
INSERT INTO DEPT_COPY VALUES(40, 'OPERATIONS', NULL);
INSERT INTO DEPT_COPY VALUES(50, 'COMPUTING','');

CREATe table emp_copy as select empno eno, ename, job, hiredate, deptno dno from emp where 0 = 1;
DROP TABLE EMP_COPY;
desc emp_copy;
select * from emp_copy;
insert into emp_copy values(7000, 'CANDY', 'MANAGER', '2012/05/01', 10);
insert into emp_copy values(7010, 'TOM', 'MANAGER', TO_DATE('2012,05,01','YYYY,MM,DD'),20);
INSERT INTO EMP_COPY VALUES(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

DROP TABLE DEPT_COPY;
CREATE TABLE DEPT_COPY AS SELECT * FROM DEPT WHERE 0 = 1;
INSERT INTO DEPT_COPY SELECT * FROM DEPT;

SELECT * FROM DEPT_COPY;
UPDATE DEPT_COPY SET DNAME = 'PROGRAMMING' WHERE DEPTNO = 10;
UPDATE DEPT_COPY SET DNAME = 'HR';
UPDATE DEPT_COPY SET DNAME = 'PROGRAMMING', LOC = 'SEOUL' WHERE DEPTNO = 10;
UPDATE DEPT_COPY SET LOC = (SELECT LOC FROM DEPT_COPY WHERE DEPTNO = 20) WHERE DEPTNO = 10;
UPDATE DEPT_COPY SET DNAME = (SELECT DNAME FROM DEPT_COPY WHERE DEPTNO = 30), LOC = (SELECT LOC FROM DEPT_COPY WHERE DEPTNO = 30) WHERE DEPTNO = 10;

DELETE DEPT_COPY WHERE DEPTNO = 10;
DELETE DEPT_COPY;

DROP TABLE EMP_COPY;
CREATE TABLE EMP_COPY AS SELECT * FROM EMP;
DELETE EMP_COPY WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');
SELECT * FROM EMP_COPY;

DROP TABLE DEPT_COPY;
CREATE TABLE DEPT_COPY AS SELECT DEPTNO DNO, DNAME, LOC FROM DEPT;
DELETE DEPT_COPY;
SELECT * FROM DEPT_COPY;
ROLLBACK;
DELETE DEPT_COPY WHERE DNO = 10;
COMMIT;