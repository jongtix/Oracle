select * from emp where sal >= 1000 and sal <= 1500 order by sal;
select * from EMP where SAL BETWEEN 1000 and 1500;

-- in ������
-- ������ ���� �� �ϳ� �̻� �����ϸ� ��.
select * from EMPLOYEES where COMMISSION_PCT in (0.3, 0.25, 1.4);
select * from EMPLOYEES where COMMISSION_PCT not in (0.3, 0.25, 1.4);

-- like ������
-- ���ǿ��� ���ϵ�ī��(%, _)�� �Բ� ���
-- % : ���� ������� ����, _ : ���̰� 1�� ����
select * from EMP where ENAME like '%C%';

select * from emp order by ename;
select * from emp where ename like '%S';

-- �̸��� M�� ���ڸ����� �ι�°�� ������ ��� ����
select * from emp where ename like '%M_';

select * from emp where ename like '__A%';

select * from emp where ename not like '__A%' order by ename;

select * from emp where COMM is null;