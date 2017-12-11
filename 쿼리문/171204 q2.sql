-- �񱳿����� ( =, >, <, >=, <=, <>, !=, ^= )
-- select * [col1, col2, ...] from table_name where condition;

select * from employees where salary >= 1500 order by salary;

select * from employees where DEPARTMENT_ID = 10;

-- ���ڿ� �������� ��ȸ�ϱ�
select * from EMPLOYEES where first_name = 'Jennifer'; -- ��ҹ��� ����

-- ��¥ �������� ��ȸ�ϱ�
select * from employees where HIRE_DATE >= '2006/01/01';

-- �� ������ (and, or, not)
select * from EMPLOYEES where DEPARTMENT_ID = 60 and salary >= 6000;
select * from EMPLOYEES where DEPARTMENT_ID = 60 or job_id = 'PU_MAN';
select * from EMPLOYEES where not DEPARTMENT_ID = 100;
select * from EMPLOYEES where DEPARTMENT_ID <> 100;
select * from EMPLOYEES where DEPARTMENT_ID != 100;
select * from EMPLOYEES where DEPARTMENT_ID ^= 100;

select * from EMPLOYEES where salary >= 2000 and salary <= 2500;
select * from EMPLOYEES where commission_pct = 0.3 or COMMISSION_PCT = 0.1 or COMMISSION_PCT = 0.25;

-- 1. employees ���̺��� �μ��ڵ尡 100�̰ų� manager_id�� null �̰ų� salary�� 10000 �̸��� ��� ����
select * from EMPLOYEES where MANAGER_ID is null;
select EMPLOYEE_ID as emp_id, FIRST_NAME || ' ' || LAST_NAME as empname, HIRE_DATE, JOB_ID, MANAGER_ID, DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID = 100 or MANAGER_ID is null or SALARY < 10000;