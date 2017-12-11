select ename, sal*12 + nvl(comm, 0)  from emp;

-- 01 문자 함수
select 'Oracle mania', upper('Oracle mania'), lower('Oracle mania'), initcap('Oracle mania') from dual;
select ename, lower(ename), job, initcap(job) from emp;
select empno, ename, deptno from emp where lower(ename) = lower('scOTt');

select length('Oracle Mania'), length('오라클 매니아') from dual;
select lengthb('Oracle Mania'), lengthb('오라클 매니아') from dual;

select 'Oracle' || ' Mania' from dual;
select 'Oracle', 'Mania', concat('Oracle', ' Mania') from dual;

select substr('Orcle mania', 4, 3), substr('Orcle mania', -4, 3) from dual;
select * from emp where substr(ename, -1, 1) = 'N';

select * from emp where substr(HIREDATE, 1, 2) = '87';
select * from emp where to_char(hiredate, 'YY') = '87';
select * from emp where hiredate like '87%';

select substr('오라클매니아', 3, 4), substrb('오라클매니아', 3, 4) from dual;

select instr('Oracle Mania', 'O') from dual;
select instr('Orcale Mania', 'a', 5, 2) from dual;
select instr('오라클매니아', '매') from dual;
select instrb('오라클매니아', '매') from dual;
select * from emp where instr(ename, 'R', 3, 1) = 3;
select * from emp where ename like '__R%';

select empno, ename, substr(hiredate, 1, instr(hiredate, '/') - 1) || '-' || substr(hiredate, instr(hiredate, '/', 1, 1) + 1, 2) || '-' || substr(hiredate, instr(hiredate, '/', 1, 2) + 1, 2) from emp;
select empno, ename, to_char(hiredate, 'YY-MM-DD') from emp;

select lpad(sal, 10, '*') from emp;
select rpad(sal, 10, '*') from emp;

select '  Oracle mania  ', ltrim('  Oracle mania  '), rtrim('  Oracle mania  ') from dual;
select '  Oracle mania  ', trim('O' from 'Oracle mania') from dual;
select '  Oracle mania  ', trim('r' from 'Oracle mania') from dual;
select empno, ename, to_char(hiredate, 'YYYY')||'년'||to_char(hiredate, 'MM')||'월'||to_char(hiredate, 'DD')||'일' from emp;

select ename, trim('S' from ename) from emp;
select trim('   Oracle mania   ') from dual;

-- 02 숫자 함수
select 98.7654, round(98.7654), round(98.7654, 2), round(98.7654, -1) from dual; -- 올림
select 98.7654, trunc(98.7654), trunc(98.7654, 2), trunc(98.7654, -1) from dual; -- 버림
select mod(31, 2), mod(31, 5), mod(31, 8) from dual; -- 나머지 %
select ename, sal, mod(sal, 500) from emp;

-- 03 날짜 함수
select sysdate from dual;
select sysdate - 1 어제, sysdate 오늘, sysdate + 1 내일,
       sysdate + 10/24, -- 현재 시간 + 10 시간 후
       trunc(sysdate) + 10/24 -- 오늘 0시 + 10 시간 후
       from dual;

select ename, HIREDATE, round(sysdate - hiredate) 근무일수 from emp;
select round(sysdate, 'scc') from dual; -- 연도
select round(sysdate, 'yyyy') from dual;
select round(sysdate, 'year') from dual;
select round(sysdate, 'syear') from dual;
select round(sysdate, 'yyy') from dual;
select round(sysdate, 'yy') from dual;
select round(sysdate, 'y') from dual;
select round(sysdate, 'q') from dual; -- 반올림하여 한 분기의 시작일 인출 (기준 : 두 번째 달의 16일)
select round(sysdate, 'day') from dual; -- 반올림하여 한 주의 시작요일 인출 (기준 : 수요일)
-- 근무 년수와 개월수 구하기
select empno, ename, trunc((months_between(sysdate, hiredate)) / 12), trunc(months_between(sysdate, hiredate)) 근무개월수 from emp;
--select empno, ename, round(sysdate, 'year') - round(hiredate, 'year') 근무년수, round(sysdate, 'mounth') - round(hiredate, 'mounth') from emp;

select hiredate, trunc(hiredate, 'year') from emp;
select hiredate, trunc(hiredate, 'month') from emp;

select ename, sysdate, hiredate, trunc(months_between(sysdate, hiredate)) from emp;

select ename, hiredate, add_months(hiredate, 6) from emp;

select sysdate, next_day(sysdate, '월요일') from dual;
select ename, hiredate, last_day(hiredate) from emp;

-- 04 형 변환 함수
select ename, hiredate,to_char(hiredate, 'YY-MM'), to_char(hiredate, 'YYYY/MM/dd day') from emp;
select to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss')from dual;

select ename, to_char(sal, 'l999,999') from emp;
-- select ename, to_char(lpad(sal, 10, ' '), 'l999,999') from emp;

select ename, hiredate from emp where hiredate = to_date(19810220, 'YYYYMMDD');

select to_char(to_number('100,000', '999,999') - to_number('50,000', '999,999'), 'l999,999') from dual;

-- 05 일반 함수
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