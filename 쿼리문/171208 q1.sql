create view v_em_dno
as
select empno eno, ename, deptno dno
from emp
where deptno = 20;

select * from v_em_dno; -- �����ϸ� data ��ųʸ��� �������� �����ؼ� select �� ����� ����
                        -- �ܼ���(���̺�� 1:1�� ���ε� �������� ���� ��)�� DML(insert, update, delete) �۾� ����
insert into v_em_dno values(9300, '���ξ�', 20);
select * from v_em_dno;
select * from emp;

-- 02. �̹� ������ �䰡 ������ ���ο� ��� �����ϴ� ��ɾ� replace
create or replace view v_em_dno
as
select empno eno, ename, deptno dno, sal
from emp
where deptno = 20;

select * from v_em_dno;

-- view�� ������ Ȯ���ϴ� ������ ��ųʸ� ��
select view_name, text from user_views;

-- 03. ����Ŭ���� ������ ��� ���� object(table, view, procedure, index, function, trigger ��)
-- drop view ���
drop view v_em_dno;


-- sequence, index
-- sequence�� ��ȣ�� �ڵ� �߹��ϱ� ���� ��ü
-- sequence�� �� ���� ���� ������ ����. currval(���簪), nextval(������)

-- index�� �����͸� ������ �˻��ϱ� ���� ��ü

-- 01. ������ ���� 1���� ����, 1�� ����, �ִ� 100000
create sequence emp_seq
start with 1 increment by 1 maxvalue 100000;
select emp_seq.nextval from dual;
select emp_seq.currval from dual;

-- �������� �� �Է½� �ڵ� �������� ���
create table emp01
as
select empno, ename, hiredate from emp where 0 = 1;
desc emp01;
select * from emp01;

insert into emp01 values(emp_seq.nextval, 'ȫ�浿', sysdate);


-- 03. index ���� -- B=tree ���
-- create index �ε����� on ���̺�(Į��)
create unique index idx_emp01_ename on emp01(ename);