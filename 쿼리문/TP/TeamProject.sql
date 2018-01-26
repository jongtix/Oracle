SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String','CHAR','char',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'PJ_BOARD';
select * from board where num = 93 and del != 'Y';
SELECT
    *
FROM
    pj_board;

UPDATE pj_board
    SET
        re_step = 0,
        re_level = 0;

COMMIT;

SELECT
    *
FROM
    (
        SELECT
            ROWNUM rn,
            a.*
        FROM
            (
                SELECT
                    *
                FROM
                    pj_board
                WHERE
                    flag = '1'
                    AND   del != 'Y'
                ORDER BY
                    REF DESC,
                    re_step
            ) a
    )
WHERE
    rn BETWEEN 1 AND 10;