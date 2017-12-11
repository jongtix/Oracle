select * from emp where sal >= 1000 and sal <= 1500 order by sal;
select * from EMP where SAL BETWEEN 1000 and 1500;

-- in 연산자
-- 나열형 조건 중 하나 이상 만족하면 참.
select * from EMPLOYEES where COMMISSION_PCT in (0.3, 0.25, 1.4);
select * from EMPLOYEES where COMMISSION_PCT not in (0.3, 0.25, 1.4);

-- like 연산자
-- 조건에서 와일드카드(%, _)와 함께 사용
-- % : 길이 상관없이 포함, _ : 길이가 1인 포함
select * from EMP where ENAME like '%C%';

select * from emp order by ename;
select * from emp where ename like '%S';

-- 이름에 M이 마자막에서 두번째로 끝나는 사원 인출
select * from emp where ename like '%M_';

select * from emp where ename like '__A%';

select * from emp where ename not like '__A%' order by ename;

select * from emp where COMM is null;