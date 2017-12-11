-- �� view
-- ���̺��� ������ �����ֱ� ���� ������ ��üŸ��
-- create or replace view ��� as select��;
create or replace view view_emp_jop
as
select empno eno, ename, deptno dno, job
    from emp
        where job like 'SALESMAN';
select * from VIEW_EMP_JOb;
rename view_emp_jop to view_emp_job;
-- ������ ��ųʸ��� �ִ� ��ü��
select * from user_views;

select * from EMP_DETAILS_VIEW;

-- view�� ���� 1 : ����
create or replace view v_emp
as
select empno no, job, mgr, deptno dno
from emp;

select * from v_emp;

select * from emp;

-- ���� 2 : ���Ǽ�
create or replace view v_emp_cmp
as
select empno, ename, sal, e.deptno dno, dname, loc
from emp e, dept d
where e.deptno = d.deptno;

select * from v_emp_cmp;

-- ������ ��ųʸ� �κп��� view��� select���� ��ȸ
select view_name, text from user_views;

-- insert ���������� ������� ����. view�� ������ �����ֱ� �����̱� ����
-- view�� ������Ʈ�ϸ� ���� ���뵵 ������Ʈ ��.
select * from view_emp_job;
insert into view_emp_job values(8000, 'ȫ�浿', 30, 'SALESMAN');
ROLLBACK;

-- view�� �׷��Լ� ���
create or replace view v_emp_sal
as
select deptno dno, sum(sal) sumSal, round(avg(sal)) avgSal from emp group by deptno;
select * from v_emp_sal;

select * from emp;
update emp set sal = 5000 where empno = 8000;

-- view ����
drop view v_emp_sal;
select * from user_views;

-- view �ɼ�
create or replace view v_emp
as
select * from emp;
select * from v_emp;

-- force : ���̺��� ��� ������ view�� ������ �ϴ� ��� ���
create or replace force view v_emp_notable
as
select empno eno, ename, deptno dno, job
from emp_notable
where job like 'MAAGER';

-- with check option
create or replace view v_emp_job_nochk
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER';
select * from V_EMP_JOB_NOCHK;
insert into v_emp_job_nochk values(9000, '�Ӳ���', 30, 'SALESMAN');
select * from emp;

create or replace view v_emp_job_chk
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER'
with check option;

select * from v_emp_job_chk;
insert into v_emp_job_chk values(9100, '������', 30, 'SALESMAN');
select * from emp;
insert into v_emp_job_chk values(9100, '������', 30, 'MANAGER');

-- with read only : �ϱ� ����
create or replace view v_emp_job_readonly
as
select empno eno, ename, deptno dno, job
from emp
where job like 'MANAGER'
with read only;
select * from V_EMP_JOB_READONLY;
insert into V_EMP_JOB_READONLY values(9200, '��浿', 30, 'MANAGER');

-- ������
-- create SEQUENCE ��������
--          [start with n]
--          [increament by n]
--          [{maxvalue n | nomaxvalue}]
--          [{minvalue n | nominvalue}]
--          [{cycle | nocycle}]
--          [{cache | nocache}]

create sequence sample_seq
    increment by 10
    start with 10;
    
select * from user_sequences;
select sample_seq.nextval from dual;
select sample_seq.currval from dual;
select sample_seq.nextval from dual;

create sequence dno_seq increment by 10 start with 10;
create table dept_second
as
select * from dept where rownum < 1;

select * from dept_second;
insert into dept_second values(dno_seq.nextval, 'ACCOUNTING', 'NEW YORK');
insert into dept_second values(dno_seq.nextval, 'SALESMAN', 'DALLAS');

-- ������ ����
-- alter sequence ��������
--          [increment by n]
--          [{maxvalue n | nomaxvalue}]
--          [{minvalue n | nominvalue}]
--          [{cycle | nocycle}]
--          [{cache n | nocache}]

select * from user_sequences;
alter sequence dno_seq maxvalue 50;
select dno_seq.nextval from dual;
alter sequence dno_seq cycle nocache;
alter sequence dno_seq minvalue 10;

-- ������ ����
-- drop sequence ��������
drop sequence dno_seq;


-- �ε���
-- ��뷮�� ������ �˻��� ������ �ϱ� ���� ��ü(unique�� ������ ������ ���� ����)
select * from user_indexes;
select * from user_ind_columns;

create unique index idx_emp_ename
on emp(ename);

select * from emp;
insert into emp values(9200, '������', 'SALESMAN', null, null, null, null, 30);

-- �ε��� �����
alter index idx_emp_ename rebuild;
delete emp where ename = '������';
drop index idx_emp_ename;

-- �����ε��� : Į���� �� �� �̻� ���ļ� ����� �ε���
create index idx_dept_com
on dept_second(dname, loc);
select * from user_indexes;

-- �Լ���� �ε���
-- �� ������� ����
create index idx_emp_second_annsal on emp_copy(sal * 12);
select * from user_indexes;


-- ���� ����, ��ü ����
-- select * from dba_data_files; sys�� �����ؾ� ���� ����
select * from session_privs;