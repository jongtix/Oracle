-- 01
select substr(hiredate, 1, 2) ³âµµ, substr(hiredate, 4, 2) ´Þ from emp;

-- 02
select empno, ename, job, mgr, hiredate, sal, comm from emp where substr(hiredate, 4, 2) = '04';

-- 03
select empno, ename, job, mgr, hiredate, sal, comm from emp where mod(empno, 2) = 0;

-- 04
select hiredate, to_char(hiredate, 'YY/MON/dd day') from emp;

-- 05
select trunc(sysdate - to_date('2017/01/01', 'yyyy-mm-dd')) from dual;

-- 06
select empno, ename, nvl(mgr, 0) from emp;

-- 07
select empno, ename, job, sal,
        decode(job, 'ANAIYST', SAL + 200,
                    'SALESMAN', SAL + 180,
                    'MANAGER', SAL + 150,
                    'CLERK', SAL + 100,
                    sal) as UPDATE_SAL
from emp;