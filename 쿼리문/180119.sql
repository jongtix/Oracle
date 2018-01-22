select * from (select rownum, a.* from (select * from book order by reg_date desc) a) where rownum between 2 and 20;
select * from book where rownum <= 5 order by reg_date desc;
select * from (select rownum rn, a.* from (select * from book order by reg_date desc) a) where rn between 10 and 20;

select buy_id, book_id, book_title, buy_price, buy_count, book_image, sanction from (select rownum rn, a.* from (select * from buy where buyer = 'jongtix' order by buy_id) a) where rn between 1 and 10;
select * from (select rownum rn, a.* from (select * from book where book_kind = '300' order by book_id) a) where rn between 1 and 10;

select count(*) from book where rownum <= 5 order by reg_date desc;

select a.* from (select * from book order by reg_date desc) a where rownum <= 5;

select * from cart;
delete book;
select * from book;

select * from (select rownum rn, a.* from (select * from book order by reg_date desc) a) where rn between 1 and 10;
select a.* from (select * from book order by reg_date desc) a where rownum <= 5;
select nvl(max(id),0) from pdsitem;

select * from member2;
select * from member2 where name like 'ȫ�浿' and birth = '2006-05-25';