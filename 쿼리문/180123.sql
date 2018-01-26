DROP TABLE board;

CREATE TABLE board (
    num         NUMBER PRIMARY KEY,
    writer      VARCHAR2(20) NOT NULL,
    subject     VARCHAR2(50) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    email       VARCHAR2(30),
    readcount   NUMBER DEFAULT 0,
    password    VARCHAR2(20) NOT NULL,
    REF         NUMBER NOT NULL,
    re_step     NUMBER NOT NULL,
    ref_level   NUMBER NOT NULL,
    ip          VARCHAR2(30) NOT NULL,
    reg_date    DATE DEFAULT SYSDATE,
    del         CHAR(1)
);

SELECT
    *
FROM
    pdsitem;

SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String','CHAR','char',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'BOARD';
    
     select * from board;
    