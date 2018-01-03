create table book (
code number primary key,
title varchar2(30),
writer varchar2(20),
price number(7),
regdate date
);

create SEQUENCE book_seq
start with 10000
increment by 1
nocycle;

insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'로비오와 줄리엣', '세익스피어', 25000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'리어왕', '세익스피어', 28000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'오셀로', '세익스피어', 30000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'채식주의자', '한강', 25000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'고도를 기다리며', '홍길동', 25000, sysdate);

commit;

select * from book;