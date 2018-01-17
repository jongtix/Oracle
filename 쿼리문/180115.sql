SELECT
    *
FROM
    book;

DESC book;

CREATE SEQUENCE book_his_seq INCREMENT BY 1 START WITH 1 NOCYCLE;

CREATE TABLE book_history (
    seq               NUMBER(10) PRIMARY KEY,
    book_id           NUMBER(10) NOT NULL,
    book_kind         VARCHAR2(3) NOT NULL,
    book_title        VARCHAR2(100) NOT NULL,
    book_price        NUMBER(10) NOT NULL,
    author            VARCHAR2(20),
    publishing_com    VARCHAR2(30),
    publishing_date   VARCHAR2(15),
    book_content      VARCHAR2(500),
    del_date          DATE DEFAULT SYSDATE
);

CREATE OR REPLACE TRIGGER book_trg_d AFTER
    DELETE ON book
    FOR EACH ROW
BEGIN
    INSERT INTO book_history (
        seq,
        book_id,
        book_kind,
        book_title,
        book_price,
        author,
        publishing_com,
        publishing_date,
        book_content,
        del_date
    ) VALUES (
        book_his_seq.NEXTVAL,
        :old.book_id,
        :old.book_kind,
        :old.book_title,
        :old.book_price,
        :old.author,
        :old.publishing_com,
        :old.publishing_date,
        :old.book_content,
        SYSDATE
    );

END;
/

DROP TRIGGER book_trg_d;

SELECT
    *
FROM
    book;

SELECT
    *
FROM
    book_history;