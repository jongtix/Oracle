-- 주석
-- sql쿼리 select문
-- select 칼럼명 1, 2, 3, ... from 테이블명;
-- select * from 테이블명;
select * from countries;
select * from departments where department_id = '110';
select * from departments;

-- select [DISTICNT]{*|column[alias]...}
--  from table
--      [where coundition]
--          [group BY group_by_experssion]
--              [having troup_condition]
                    [order by colunm];
                    
-- 산술연산자
-- +, -, *, /
-- 쿼리한 결고가 칼럼들의 연산에 연산자가 사용됨
-- 문자열 결합 연산자 : 앞문자||뒷문자
-- 별칭(alias) as 이름
select first_name || last_name as name, salary as salary, salary*12 as yearSal from EMPLOYEES;

-- commisstion pct칼럼 : salary의 상여 비율
-- null : 커미션이 없는 부서 소속 직원
-- commision 有 : 소수점으로 표시
select * from employees;

-- 칼럼값이 null인 경우 연산의 결과는 null;
-- nvl(칼럼, 대체값) <- 칼럼의 값이 null일 경우 0으로 대체하는 함수
select employee_id as empid, first_name||last_name as ename, salary as salary, salary*nvl(commission_pct, 0) as commission_pct from employees;

-- 문제 1. empoyees 테이블에서 사원들의 id와 이름과 급여, 입사일자, 연봉(급여*12+급여*커미션율)을 출력하세요...
select employee_id as id, first_name||' '||last_name as 이름, salary as 급여, salary*12 + salary*nvl(commission_pct, 0) as 연봉 from employees;

-- 부서테이블 조회
select * from departments;
-- 칼럼의 null 여부 조건 : is null 또는 is not null
select manager_id from DEPARTMENTS where manager_id is not null order by manager_id;
-- 중복제거 : distinct
select distinct manager_id, location_id from departments;

--dual 테이블 : oracle에서는 from 테이블명이 꼭 필요하기 때문에 형식을 맞춰주기 위해 사용하는 테이블
select sysdate from dual;
select 2*3 from dual;
select distinct sysdate from employees;
-- rownum : 데이터의 행수를 조회하는 조건
select sysdate from employees where rownum = 1; -- 1행을 출력
select rownum, employee_id, first_name || last_name from employees;