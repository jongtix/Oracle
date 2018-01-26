DELETE board;

SELECT
    *
FROM
    board;

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
                    board
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
    board;

COMMIT;

SELECT
    MAX(num)
FROM
    board;

SELECT
    *
FROM
    board
WHERE
    num = 500
    AND   del != 'Y';

UPDATE board
    SET
        del = 'Y'
WHERE
    num = 505;

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
                    board
                WHERE
                    del != 'Y'
                ORDER BY
                    REF DESC,
                    re_step
            ) a
    )
WHERE
    rn BETWEEN 1 AND 10;

COMMIT;