select ename, sal*12 + nvl(comm, 0)  from emp;

-- 01 ���� �Լ�
select 'Oracle mania', upper('Oracle mania'), lower('Oracle mania'), initcap('Oracle mania') from dual;
select ename, lower(ename), job, initcap(job) from emp;
select empno, ename, deptno from emp where lower(ename) = lower('scOTt');

select length('Oracle Mania'), length('����Ŭ �ŴϾ�') from dual;
select lengthb('Oracle Mania'), lengthb('����Ŭ �ŴϾ�') from dual;

select 'Oracle' || ' Mania' from dual;
select 'Oracle', 'Mania', concat('Oracle', ' Mania') from dual;

select substr('Orcle mania', 4, 3), substr('Orcle mania', -4, 3) from dual;
select * from emp where substr(ename, -1, 1) = 'N';

select * from emp where substr(HIREDATE, 1, 2) = '87';
select * from emp where to_char(hiredate, 'YY') = '87';
select * from emp where hiredate like '87%';

select substr('����Ŭ�ŴϾ�', 3, 4), substrb('����Ŭ�ŴϾ�', 3, 4) from dual;

select instr('Oracle Mania', 'O') from dual;
select instr('Orcale Mania', 'a', 5, 2) from dual;
select instr('����Ŭ�ŴϾ�', '��') from dual;
select instrb('����Ŭ�ŴϾ�', '��') from dual;
select * from emp where instr(ename, 'R', 3, 1) = 3;
select * from emp where ename like '__R%';

select empno, ename, substr(hiredate, 1, instr(hiredate, '/') - 1) || '-' || substr(hiredate, instr(hiredate, '/', 1, 1) + 1, 2) || '-' || substr(hiredate, instr(hiredate, '/', 1, 2) + 1, 2) from emp;
select empno, ename, to_char(hiredate, 'YY-MM-DD') from emp;

select lpad(sal, 10, '*') from emp;
select rpad(sal, 10, '*') from emp;

select '  Oracle mania  ', ltrim('  Oracle mania  '), rtrim('  Oracle mania  ') from dual;
select '  Oracle mania  ', trim('O' from 'Oracle mania') from dual;
select '  Oracle mania  ', trim('r' from 'Oracle mania') from dual;
select empno, ename, to_char(hiredate, 'YYYY')||'��'||to_char(hiredate, 'MM')||'��'||to_char(hiredate, 'DD')||'��' from emp;

select ename, trim('S' from ename) from emp;
select trim('   Oracle mania   ') from dual;

-- 02 ���� �Լ�
select 98.7654, round(98.7654), round(98.7654, 2), round(98.7654, -1) from dual; -- �ø�
select 98.7654, trunc(98.7654), trunc(98.7654, 2), trunc(98.7654, -1) from dual; -- ����
select mod(31, 2), mod(31, 5), mod(31, 8) from dual; -- ������ %
select ename, sal, mod(sal, 500) from emp;

-- 03 ��¥ �Լ�
select sysdate from dual;
select sysdate - 1 ����, sysdate ����, sysdate + 1 ����,
       sysdate + 10/24, -- ���� �ð� + 10 �ð� ��
       trunc(sysdate) + 10/24 -- ���� 0�� + 10 �ð� ��
       from dual;

select ename, HIREDATE, round(sysdate - hiredate) �ٹ��ϼ� from emp;
select round(sysdate, 'scc') from dual; -- ����
select round(sysdate, 'yyyy') from dual;
select round(sysdate, 'year') from dual;
select round(sysdate, 'syear') from dual;
select round(sysdate, 'yyy') from dual;
select round(sysdate, 'yy') from dual;
select round(sysdate, 'y') from dual;
select round(sysdate, 'q') from dual; -- �ݿø��Ͽ� �� �б��� ������ ���� (���� : �� ��° ���� 16��)
select round(sysdate, 'day') from dual; -- �ݿø��Ͽ� �� ���� ���ۿ��� ���� (���� : ������)
-- �ٹ� ����� ������ ���ϱ�
select empno, ename, trunc((months_between(sysdate, hiredate)) / 12), trunc(months_between(sysdate, hiredate)) �ٹ������� from emp;
--select empno, ename, round(sysdate, 'year') - round(hiredate, 'year') �ٹ����, round(sysdate, 'mounth') - round(hiredate, 'mounth') from emp;

select hiredate, trunc(hiredate, 'year') from emp;
select hiredate, trunc(hiredate, 'month') from emp;

select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) from emp;

select ename, hiredate, add_months(hiredate, 6) from emp;

select sysdate, next_day(sysdate, '������') from dual;
select ename, hiredate, last_day(hiredate) from emp;

-- 04 �� ��ȯ �Լ�
select ename, hiredate,to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/dd day') from emp;
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss')from dual;

select ename, to_char(sal, 'l999,999') from emp;
-- select ename, to_char(lpad(sal, 10, ' '), 'l999,999') from emp;

select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

select to_char(to_number('100,000', '999,999') - to_number('50,000', '999,999'), 'l999,999') from dual;

-- 05 �Ϲ� �Լ�
select ename, sal, comm, nvl(comm, 0), sal * 12 + nvl(comm, 0) from emp order by job;
select ename, sal, comm, nvl2(comm, sal * 12 + comm, sal * 12) from emp order by job;
select nullif('A', 'A'), nullif('A', 'B'), nullif('A', 'a') from dual;
select ename, sal, comm, coalesce(comm, sal, 0) from emp order by job;

select ename, deptno, decode(deptno, 10, 'ACCOUNTING',
                                     20, 'RESEARCH',
                                     30, 'SALES',
                                     40, 'OPERATIONS',
                                     'DEFAULT') AS DNAME
FROM EMP order by deptno;

select ename, deptno, case when deptno = 10 then 'ACCOUNTING'
                           WHEN DEPTNO = 20 THEN 'RESEARCH'
                           WHEN DEPTNO = 30 THEN 'SALES'
                           WHEN DEPTNO = 40 THEN 'OPERATIONS'
                           ELSE 'DEFAULT'
                           END AS DNAME
from emp order by deptno;