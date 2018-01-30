-- 게시판
CREATE TABLE pj_board (
    NUM         NUMBER PRIMARY KEY, -- 글번호
    FLAG        NUMBER DEFAULT 0 NOT NULL, -- 카테고리
    WRITER      VARCHAR2(20 BYTE) NOT NULL, -- 작성자
    SUBJECT     VARCHAR2(50 BYTE) NOT NULL, -- 제목
    CONTENT     VARCHAR2(2000 BYTE) NOT NULL, -- 내용
    EMAIL       VARCHAR2(30 BYTE), -- 이메일
    READCOUNT   NUMBER DEFAULT 0, -- 조회수
    PASSWORD    VARCHAR2(20 BYTE) NOT NULL, -- 비밀번호
    REF         NUMBER NOT NULL, -- 참조번호
    RE_STEP     NUMBER DEFAULT 0,
    RE_LEVEL    NUMBER DEFAULT 0,
    IP          VARCHAR2(30 BYTE) NOT NULL,
    REG_DATE    DATE DEFAULT SYSDATE, -- 등록일
    DEL         CHAR(1 BYTE) DEFAULT 'N' -- 삭제여부
);
select * from pj_board;
--------------------------------------------------------------------
-- 댓글
drop table pj_sub_board;
CREATE TABLE pj_sub_board (
    sub_num      NUMBER PRIMARY KEY,
    sub_WRITER     VARCHAR2(20 BYTE) NOT NULL, -- 작성자
    sub_CONTENT    VARCHAR2(2000 BYTE) NOT NULL, -- 내용
    sub_PASSWORD   VARCHAR2(20 BYTE) NOT NULL, -- 비밀번호
    REF        NUMBER NOT NULL, -- 참조번호
    REG_DATE   DATE DEFAULT SYSDATE, -- 등록일
    DEL        CHAR(1 BYTE) DEFAULT 'N' -- 삭제여부
);

--------------------------------------------------------------------
-- 멤버

CREATE TABLE pj_member (
    ID             VARCHAR2(20 BYTE), -- 유저아이디
    PASSWORD      VARCHAR2(20 BYTE),
    NAME           VARCHAR2(20 BYTE),
    RRNUM1         VARCHAR2(6), -- 주민등록번호 앞자리
    RRNUM2         VARCHAR2(7), -- 주민등록번호 뒷자리
    ZIPNO          VARCHAR2(7 BYTE),
    ADDRESS1       VARCHAR2(80 BYTE),
    ADDRESS2       VARCHAR2(50 BYTE),
    TEL1           VARCHAR2(3 BYTE),
    TEL2           VARCHAR2(4 BYTE),
    TEL3           VARCHAR2(4 BYTE),
    EMAIL          VARCHAR2(20 BYTE),
    REGDATE        DATE DEFAULT SYSDATE, -- 가입일
    USE_FLAG       CHAR(1 BYTE) DEFAULT 0, -- 탈퇴 여부
    MANAGER_FLAG   CHAR(1) DEFAULT 0 -- 매니저 여부
);

--------------------------------------------------------------------
-- 상품

CREATE TABLE pj_item (
    num            NUMBER, -- 글번호
    ITEM_ID      NUMBER PRIMARY KEY,
    ITEM_KIND    VARCHAR2(30 BYTE), -- 상품 유형
    ITEM_NAME    VARCHAR2(100 BYTE),
    ITEM_PRICE   NUMBER(20),
    ITEM_COUNT   NUMBER(5), -- 판매 상품 수
    ITEM_IMAGE   VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday       DATE, -- 렌트 시작일
    endday         DATE, -- 렌트 종료일
    trans_type     VARCHAR2(30), -- 거래 유형
    REG_DATE     DATE -- 상품 등록일
);

--------------------------------------------------------------------
-- 렌트

CREATE TABLE pj_rent (
    rent_id           NUMBER PRIMARY KEY,
    rent_seller       VARCHAR2(20),
    rent_buyer        VARCHAR2(20),
    ITEM_ID         NUMBER,
    ITEM_KIND       VARCHAR2(10 BYTE), -- 상품 유형
    ITEM_NAME       VARCHAR2(100 BYTE),
    ITEM_PRICE      NUMBER(20),
    ITEM_COUNT      NUMBER(5), -- 판매 상품 수
    ITEM_IMAGE      VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday          DATE, -- 렌트 시작일
    endday            DATE, -- 렌트 종료일
    trans_type        VARCHAR2(30), -- 거래 유형
    deliveryname      VARCHAR2(20),
    deliverytel       VARCHAR2(15),
    deliveryaddress   VARCHAR2(200),
    sanction          VARCHAR2(10) default '준비중',
    resanction        VARCHAR2(10),
    REG_DATE        DATE -- 상품 등록일
);