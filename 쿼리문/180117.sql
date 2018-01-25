DROP TABLE member2;

CREATE TABLE member2 (
    id         VARCHAR2(12) PRIMARY KEY,
    password   VARCHAR2(12) NOT NULL,
    name       VARCHAR2(20) NOT NULL,
    birth      DATE,
    zipno      VARCHAR2(7),
    address1   VARCHAR2(80),
    address2   VARCHAR2(50),
    tel1       VARCHAR2(3),
    tel2       VARCHAR2(4),
    tel3       VARCHAR2(4),
    email      VARCHAR2(20),
    regdate    DATE DEFAULT SYSDATE,
    use_flag   CHAR(1) DEFAULT 0
);

UPDATE book
    SET
        book_count = 0
WHERE
    book_title = '명품 자바';

COMMIT;

SELECT
    *
FROM
    cart;

ROLLBACK;

SELECT
    *
FROM
    book;

SELECT
    book.book_count
FROM
    book,
    cart
WHERE
    book.book_id = cart.book_id
    AND   cart.cart_id = '9';

SELECT
    *
FROM
    member2;