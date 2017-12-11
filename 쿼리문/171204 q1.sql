-- �ּ�
-- sql���� select��
-- select Į���� 1, 2, 3, ... from ���̺��;
-- select * from ���̺��;
select * from countries;
select * from departments where department_id = '110';
select * from departments;

-- select [DISTICNT]{*|column[alias]...}
--  from table
--      [where coundition]
--          [group BY group_by_experssion]
--              [having troup_condition]
                    [order by colunm];
                    
-- ���������
-- +, -, *, /
-- ������ ��� Į������ ���꿡 �����ڰ� ����
-- ���ڿ� ���� ������ : �չ���||�޹���
-- ��Ī(alias) as �̸�
select first_name || last_name as name, salary as salary, salary*12 as yearSal from EMPLOYEES;

-- commisstion pctĮ�� : salary�� �� ����
-- null : Ŀ�̼��� ���� �μ� �Ҽ� ����
-- commision �� : �Ҽ������� ǥ��
select * from employees;

-- Į������ null�� ��� ������ ����� null;
-- nvl(Į��, ��ü��) <- Į���� ���� null�� ��� 0���� ��ü�ϴ� �Լ�
select employee_id as empid, first_name||last_name as ename, salary as salary, salary*nvl(commission_pct, 0) as commission_pct from employees;

-- ���� 1. empoyees ���̺��� ������� id�� �̸��� �޿�, �Ի�����, ����(�޿�*12+�޿�*Ŀ�̼���)�� ����ϼ���...
select employee_id as id, first_name||' '||last_name as �̸�, salary as �޿�, salary*12 + salary*nvl(commission_pct, 0) as ���� from employees;

-- �μ����̺� ��ȸ
select * from departments;
-- Į���� null ���� ���� : is null �Ǵ� is not null
select manager_id from DEPARTMENTS where manager_id is not null order by manager_id;
-- �ߺ����� : distinct
select distinct manager_id, location_id from departments;

--dual ���̺� : oracle������ from ���̺���� �� �ʿ��ϱ� ������ ������ �����ֱ� ���� ����ϴ� ���̺�
select sysdate from dual;
select 2*3 from dual;
select distinct sysdate from employees;
-- rownum : �������� ����� ��ȸ�ϴ� ����
select sysdate from employees where rownum = 1; -- 1���� ���
select rownum, employee_id, first_name || last_name from employees;