-- 01
select ename, job from emp where job = (select job from emp where empno = 7788);

-- 02
select ename, job from emp where sal > (select sal from emp where empno = 7499);

-- 03
select ename, job, sal from emp where sal = (select min(sal) from emp);

-- 04
select job, round(avg(sal), 1) from emp group by job having round(avg(sal), 1) = (select min(round(avg(sal), 1)) from emp group by job);

-- 05
select ename, sal, deptno from emp where sal in (select min(sal) from emp group by deptno);

-- 06
select empno, ename, job, sal from emp where sal < all (select sal from emp where job = 'ANALYST') and job != 'ANALYST' order by sal;
select empno, ename, job, sal from emp where sal < any (select sal from emp where job = 'ANALYST') and job <> 'ANALYST';

-- 07
-- 부하직원이 없는 사원의 이름 표시
select ename from emp where ename not in (select m.ename from emp e, emp m where e.mgr = m.empno);
-- 상사가 없는 사원의 이름 표시
select ename from emp where empno not in (select empno from emp where mgr is not null);

-- 08
-- 부하직원이 있는 사원의 이름 표시
select ename from emp where ename in (select m.ename from emp e, emp m where e.mgr = m.empno);
-- 상사가 있는 사원의 이름 표시
select ename from emp where empno in (select empno from emp where mgr is not null);

-- 09
select ename, hiredate from emp where deptno = (select deptno from emp where ename = 'BLAKE') and ename != 'BLAKE';

-- 10
select empno, ename from emp where sal > (select avg(sal) from emp) order by sal asc;

-- 11
select empno, ename from emp where deptno IN (select deptno from emp where ename like '%K%');

-- 12
select ename, deptno, job from emp where deptno = (select deptno from dept where loc = 'DALLAS');

-- 13
select ename, sal from emp where mgr = (select empno from emp where ename = 'KING');

-- 14
select deptno, ename, job from emp where deptno = (select deptno from dept where dname = 'RESEARCH');

-- 15
select empno, ename, sal from emp where sal > (select avg(sal) from emp) and deptno in (select deptno from emp where ename like '%M%');

-- 16
select job, avg(sal) from emp group by job having avg(sal) = (select min(avg(sal)) from emp group by job);

-- 17
select ename from emp where empno in (select mgr from emp);