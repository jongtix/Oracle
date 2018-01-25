CREATE SEQUENCE cart_seq INCREMENT BY 1 START WITH 1 NOCYCLE;

SELECT
    book_count
FROM
    book
WHERE
    book_title = 'book_title200';