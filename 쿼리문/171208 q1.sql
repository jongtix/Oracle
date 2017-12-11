create view v_em_dno
as
select empno eno, ename, deptno dno
from emp
where deptno = 20;

select * from v_em_dno; -- 실행하면 data 딕셔너리의 쿼리문을 참고해서 select 후 결과를 리턴
                        -- 단순뷰(테이블과 1:1로 매핑된 가공되지 않은 뷰)는 DML(insert, update, delete) 작업 가능
insert into v_em_dno values(9300, '나두야', 20);
select * from v_em_dno;
select * from emp;

-- 02. 이미 생성된 뷰가 있으면 새로운 뷰로 변경하는 명령어 replace
create or replace view v_em_dno
as
select empno eno, ename, deptno dno, sal
from emp
where deptno = 20;

select * from v_em_dno;

-- view의 내용을 확인하는 데이터 딕셔너리 뷰
select view_name, text from user_views;

-- 03. 오라클에서 생성된 모든 것은 object(table, view, procedure, index, function, trigger 등)
-- drop view 뷰명
drop view v_em_dno;


-- sequence, index
-- sequence는 번호를 자동 발번하기 위한 객체
-- sequence는 두 개의 값을 가지고 있음. currval(현재값), nextval(다음값)

-- index는 데이터를 빠르게 검색하기 위한 객체

-- 01. 시퀀스 조건 1부터 시작, 1씩 증가, 최댓값 100000
create sequence emp_seq
start with 1 increment by 1 maxvalue 100000;
select emp_seq.nextval from dual;
select emp_seq.currval from dual;

-- 시퀀스는 값 입력시 자동 순번으로 사용
create table emp01
as
select empno, ename, hiredate from emp where 0 = 1;
desc emp01;
select * from emp01;

insert into emp01 values(emp_seq.nextval, '홍길동', sysdate);


-- 03. index 생성 -- B=tree 사용
-- create index 인덱스명 on 테이블(칼럼)
create unique index idx_emp01_ename on emp01(ename);