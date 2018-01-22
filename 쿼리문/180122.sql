CREATE TABLE pdsitem (
    id            NUMBER NOT NULL,
    filename      VARCHAR2(100) NOT NULL,
    filesize      NUMBER,
    description   VARCHAR2(255)
);

SELECT
    *
FROM
    pdsitem;

SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'PDSITEM';

SELECT
    *
FROM
    pdsitem
ORDER BY
    id;