-- ������ ���� order by��
-- select * [col1, col2, ...] 2����
-- from ���̺��
-- where condition 1����
-- order by col; 3����

select * from emp order by sal; -- (�⺻) ��������
select * from emp order by sal desc; -- ��������

select * from emp order by ename;
select * from emp order by hiredate;

select * from emp order by sal asc, ename desc;