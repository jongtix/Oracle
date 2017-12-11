-- 정렬을 위한 order by절
-- select * [col1, col2, ...] 2순번
-- from 테이블명
-- where condition 1순번
-- order by col; 3순번

select * from emp order by sal; -- (기본) 오름차순
select * from emp order by sal desc; -- 내림차순

select * from emp order by ename;
select * from emp order by hiredate;

select * from emp order by sal asc, ename desc;