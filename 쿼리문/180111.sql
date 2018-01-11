SELECT
    *
FROM
    board;

SELECT
    password
FROM
    board
WHERE
    num = 518;

DELETE board
WHERE
    re_step NOT IN (
        0
    );

-- 게시글 history 테이블

CREATE TABLE board_history (
    seq       NUMBER PRIMARY KEY,
    num       NUMBER,
    writer    VARCHAR2(20),
    subject   VARCHAR2(50),
    content   VARCHAR2(500),
    jobdate   DATE
);

-- sequence 생성

CREATE SEQUENCE board_history_seq INCREMENT BY 1 START WITH 1 NOCYCLE;

-- 트리거 생성

CREATE OR REPLACE TRIGGER trg_board_d AFTER
    DELETE ON board
    FOR EACH ROW
BEGIN
    INSERT INTO board_history (
        seq,
        num,
        writer,
        subject,
        content,
        jobdate
    ) VALUES (
        board_history_seq.NEXTVAL,
        :old.num,
        :old.writer,
        :old.subject,
        :old.content,
        SYSDATE
    );

END;
/

CREATE TABLE favor (
    num        NUMBER PRIMARY KEY,
    favorcnt   NUMBER,
    hatecnt    NUMBER
);

SELECT
    *
FROM
    board_history;

DROP TABLE favor;

COMMIT;

SELECT
    COUNT(*)
FROM
    board
WHERE
    REF = 515
    AND   num != 515;

SELECT
    *
FROM
    favor;