-- 01
select max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average from emp;

-- 02
select job Job, max(sal) Maximum, min(sal) Minimum, sum(sal) Sum, round(avg(sal)) Average from emp group by job;

-- 03
select job, count(*) from emp group by job;

-- 04
select count(mgr) from emp;

-- 05
select max(sal) - min(sal) difference from emp;

-- 06
select job, min(sal) from emp group by job having not min(sal) < 2000 order by min(sal) desc;
select job, min(sal) from emp where mgr is not null group by job having not min(sal) < 2000 order by min(sal) desc;

-- 07
select deptno dno, count(*) as "Number of People", round(avg(sal), 2) Salary from emp group by deptno order by deptno;

-- 08
select decode(deptno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES', 40, 'OPERATIONS') as "dname", decode(deptno, 10, 'NEW YORK', 20, 'DALLAS', 30, 'CHICAGO', 40, 'BOSTON') as "Location", count(*) as "Number of People", round(avg(sal)) as "Salary" from emp group by DEPTNO;
-- select d.dname, d.loc, count(*), round(avg(e.sal)) from emp e, dept d where e.DEPTNO = d.DEPTNO group by e.DEPTNO;

--09
select * from emp order by deptno;
select job, deptno dno, decode(deptno, 10, sum(sal)) as "부서 10", decode(deptno, 20, sum(sal)) as "부서 20", decode(deptno, 30, sum(sal)) as "부서 30", sum(sal) as "총액" from emp group by deptno, job order by deptno;