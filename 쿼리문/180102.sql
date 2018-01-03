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

insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'�κ���� �ٸ���', '���ͽ��Ǿ�', 25000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'�����', '���ͽ��Ǿ�', 28000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'������', '���ͽ��Ǿ�', 30000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'ä��������', '�Ѱ�', 25000, sysdate);
insert into book(code, title, writer, price,regdate) values(book_seq.nextval,'���� ��ٸ���', 'ȫ�浿', 25000, sysdate);

commit;

select * from book;