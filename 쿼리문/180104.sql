create table member1 (
id varchar2(12) primary key,
password varchar2(12) not null,
name varchar2(12) not null,
reg_date date not null
);

select table_name from user_tables;

select * from member1;