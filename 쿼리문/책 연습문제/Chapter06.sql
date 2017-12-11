-- 01
select ename, emp.deptno, dname from emp, dept where emp.deptno = dept.deptno and ename = 'SCOTT';

-- 02
select ename, dname, loc from emp join dept on emp.DEPTNO = dept.deptno;

-- 03
select deptno, e.job, d.loc from emp e join dept d using(deptno) where deptno = 10;

-- 04
select ename, dname, loc from emp NATURAL join dept where emp.comm > 0;
select ename, dname, loc from emp, dept where emp.DEPTNO = dept.DEPTNO and emp.COMM > 0;

-- 05
select ename, dname from emp, dept where emp.deptno = dept.deptno and ename like '%A%';

-- 06
select ename, job, deptno, dname from emp natural join dept where loc = 'NEW YORK';

-- 07
select e.ename as "Employee", e.empno as "Emp#", d.ename as "Manager", d.empno as "Mgr#" from emp e, emp d where e.mgr = d.empno;

-- 08
select e.ename as "Employee", e.empno as "Emp#", d.ename as "Manager", d.empno as "Mgr#" from emp e, emp d where e.mgr = d.empno(+) order by e.empno desc;

-- 09
select e.ename as "이름", e.deptno as "부서번호", c.ename as "동료" from emp e, emp c where e.deptno = c.deptno and e.ename = 'SCOTT' and c.ename != 'SCOTT';

-- 10
select c.ename, c.hiredate from emp e, emp c where e.hiredate < c.hiredate and e.ename = 'WARD' order by c.HIREDATE;

-- 11
select e.ename, e.hiredate, m.ename, m.hiredate from emp m, emp e where e.mgr = m.empno and e.hiredate <= m.hiredate;
select * from emp;