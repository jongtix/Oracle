SELECT
    'private '
    || DECODE(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String','CHAR','char',data_type)
    || ' '
    || lower(column_name)
    || ';'
FROM
    cols
WHERE
    table_name = 'PJ_SUB_BOARD';

SELECT
    *
FROM
    pj_board
WHERE
    flag = 'Y';

SELECT
    *
FROM
    pj_board;

SELECT
    *
FROM
    pj_member;

SELECT
    *
FROM
    pj_item;

DELETE pj_item;

DELETE pj_member;

UPDATE pj_member
    SET
        manager_flag = 'Y'
WHERE
    id = 'MemberId69';

COMMIT;

SELECT
    rrnum1,
    regdate
FROM
    pj_member;

SELECT
    *
FROM
    pj_board
WHERE
    readcount >= 30;

SELECT
    *
FROM
    pj_board
WHERE
    flag LIKE '1%';

SELECT
    *
FROM
    pj_board
WHERE
    num LIKE '1%%';

SELECT
    password
FROM
    pj_member
WHERE
    id = 'MemberId69'
    AND   manager_flag = 'Y';

UPDATE pj_board
    SET
        flag = 11
WHERE
    writer = 'writer110';

SELECT
    COUNT(*)
FROM
    pj_board
WHERE
    flag LIKE '1%'
    AND   del != 'Y';

SELECT
    *
FROM
    pj_board
WHERE
    ( flag LIKE '11' )
    OR    (
        flag LIKE '1%'
        AND   readcount > 20
    )
    AND   del != 'Y'
ORDER BY
    REF DESC,
    re_step;

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
                    ( flag LIKE '11' )
                    OR    (
                        flag LIKE '1%'
                        AND   readcount > 20
                    )
                    AND   del != 'Y'
                ORDER BY
                    REF DESC,
                    re_step
            ) a
    )
WHERE
    rn BETWEEN 1 AND 10;

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
                    (
                        flag LIKE '11'
                        AND   del != 'Y'
                    )
                    OR    (
                        flag LIKE '1%'
                        AND   readcount > 20
                        AND   del != 'Y'
                    )
                ORDER BY
                    REF DESC,
                    re_step
            ) a
    )
WHERE
    rn BETWEEN 1 AND 10;

SELECT
    COUNT(*)
FROM
    pj_board
WHERE
    ( flag LIKE '11' )
    OR    del != 'Y'
    AND   readcount > 20;
    
    insert into pj_sub_board values(2, '작성자2', '내용2', '1111', 93, sysdate, 'N');
    select * from pj_sub_board;
    select * from pj_board where num = 93;
    
    select * from (select rownum rn, a.* from (select * from pj_sub_board where del != 'Y' order by sub_num desc) a) where rn between 1 and 10;
    
    select count(*) from pj_sub_board where ref = 93 and del != 'Y';
    commit;
    select * from (select rownum rn, a.* from (select * from pj_sub_board where del != 'Y' order by sub_num desc) a) where rn between 1 and 10;
    
    select password from pj_member where id = 'MemberId1';