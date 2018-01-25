DROP TABLE member2;

CREATE TABLE member2 (
    id         VARCHAR2(10) PRIMARY KEY, -- 아이디
    password   VARCHAR2(10), -- 패스워드
    name       VARCHAR2(20), -- 이름
    reg_date   DATE, -- 가입일
    tel        VARCHAR2(20), -- 전화번호
    address    VARCHAR2(100) -- 주소
);

SELECT
    *
FROM
    member2;

CREATE TABLE manager (
    managerid       VARCHAR2(12) PRIMARY KEY,
    managerpasswd   VARCHAR2(12) NOT NULL
);

INSERT INTO manager VALUES (
    'master',
    '1234'
);

DROP SEQUENCE book_seq;

CREATE SEQUENCE book_seq START WITH 1 INCREMENT BY 1 NOCYCLE NOCACHE;

DROP TABLE book;

CREATE TABLE book (
    book_id           NUMBER(10) PRIMARY KEY,
    book_kind         VARCHAR2(3) NOT NULL,
    book_title        VARCHAR2(100) NOT NULL,
    book_price        NUMBER(10) NOT NULL,
    book_count        NUMBER(5) NOT NULL,
    author            VARCHAR2(20),
    publishing_com    VARCHAR2(30),
    publishing_date   VARCHAR2(15),
    book_image        VARCHAR2(16) DEFAULT 'nothing.jpg',
    book_content      VARCHAR2(500),
    discount_rate     NUMBER(3),
    reg_date          DATE
);

SELECT
    *
FROM
    book;

CREATE TABLE bank (
    account   VARCHAR2(30) PRIMARY KEY,
    bank      VARCHAR2(16) NOT NULL,
    name      VARCHAR2(12) NOT NULL
);

INSERT INTO bank VALUES (
    '111-1111-1111',
    '신한',
    '길동'
);

INSERT INTO bank VALUES (
    '222-2222-2222',
    '국민',
    '하재'
);

INSERT INTO bank VALUES (
    '333-3333-3333',
    '농협',
    '석태'
);

CREATE SEQUENCE cart_seq;

CREATE TABLE cart (
    cart_id      NUMBER(10) PRIMARY KEY,
    buyer        VARCHAR2(12) NOT NULL,
    book_id      NUMBER(10) NOT NULL,
    book_title   VARCHAR2(100),
    buy_price    NUMBER(10) NOT NULL,
    buy_count    NUMBER(5) NOT NULL,
    book_image   VARCHAR2(16) DEFAULT 'nothing.jpg'
);

CREATE TABLE buy (
    buy_id            NUMBER PRIMARY KEY,
    buyer             VARCHAR2(12) NOT NULL,
    book_id           VARCHAR2(12),
    book_title        VARCHAR2(100),
    buy_price         NUMBER(10) NOT NULL,
    buy_count         NUMBER(5) NOT NULL,
    book_image        VARCHAR2(16) DEFAULT 'nothing.jpg',
    buy_date          DATE,
    account           VARCHAR2(50),
    deliveryname      VARCHAR2(12),
    deliverytel       VARCHAR2(20),
    deliveryaddress   VARCHAR2(80),
    sanction          VARCHAR2(12) DEFAULT '준비중'
);

SELECT
    *
FROM
    manager;

SELECT
    managerpasswd
FROM
    manager
WHERE
    managerid = 'master';

SELECT
    *
FROM
    book;

DROP TABLE book;