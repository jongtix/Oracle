-- 01
create table employee_sample
as
select * from emp where 0 = 1;

alter table employee_sample add constraint my_emp_pk PRIMARY key(empno);

-- 02
alter table dept_second add constraint my_dept_pk primary key(deptno);

-- 03
alter table employee_sample add constraint my_emp_dept_fk FOREIGN key(deptno) REFERENCES dept_second;
select table_name, constraint_name from user_constraints where table_name in ('EMPLOYEE_SAMPLE');

-- 04
alter table employee_sample add constraint emp_commission_min check (sal > 0);
alter table employee_sample enable constraint emp_commission_min;
alter table employee_sample drop constraint emp_commission_min;
alter table employee_sample add constraint emp_commission_min check (comm > 0);