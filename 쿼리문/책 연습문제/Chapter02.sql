select * from emp;

-- 01
select ename, sal, sal+300 from emp;

-- 02
select ename, sal, sal*12 + 100 from emp order by sal desc;

-- 03
select ename, sal from emp where sal > 2000 order by sal desc;

-- 04
select ename, deptno from emp where empno = 7788;

-- 05
select ename, sal from emp where sal not between 2000 and 3000;

-- 06
select ename, job, hiredate from emp where hiredate between '1981/02/20' and '1981/05/01';

-- 07
select ename, deptno from emp where deptno = 20 or deptno = 30 order by ename;

-- 08
select ename, sal, deptno from emp where sal between 2000 and 3000 and deptno in (20,30) order by ename;

-- 09
select ename, hiredate from emp where hiredate like '81%';
select ename, hiredate from emp where to_char(hiredate, 'YY') = '81';

-- 10
select ename, job from emp where mgr is null;

-- 11
select ename, sal, comm from emp where comm is not null order by sal, comm;

-- 12
select ename from emp where ename like '__R%';

-- 13
select ename from emp where ename like '%A%' and ename like '%E%';

-- 14
select ename, job, sal from emp where job in('CLERK', 'SALESMAN') and sal not in (1600, 950, 1300);

-- 15
select ename, sal, comm from emp where comm >= 500;