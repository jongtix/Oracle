SELECT
    *
FROM
    member2;

SELECT
    *
FROM
    cols
WHERE
    table_name = 'BUY';

SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'BUY';

SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'BANK';

SELECT
    *
FROM
    buy;

DESC buy;

SELECT
    *
FROM
    bank
ORDER BY
    account;

SELECT
    *
FROM
    cart;

DESC cart;

CREATE SEQUENCE buy_seq INCREMENT BY 1 START WITH 1;

COMMIT;

SELECT
    *
FROM
    book;

SELECT
    *
FROM
    buy
WHERE
    buyer = 'jongtix';

DELETE buy;

SELECT
    book_count
FROM
    book
WHERE
    book_id = '9';
    
    select count(*) from buy order by buy_id, book_id;
    
    select * from buy;
    
    select sanction from buy;