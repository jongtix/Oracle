SELECT
    lower(column_name)
    || ' '
    || data_type
    || ','
FROM
    cols
WHERE
    table_name = 'BOARD';

SELECT DISTINCT
    job
FROM
    emp;

SELECT
    *
FROM
    emp;

COMMIT;