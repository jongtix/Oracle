-- �Խ���
CREATE TABLE pj_board (
    NUM         NUMBER PRIMARY KEY, -- �۹�ȣ
    FLAG        NUMBER DEFAULT 0 NOT NULL, -- ī�װ�
    WRITER      VARCHAR2(20 BYTE) NOT NULL, -- �ۼ���
    SUBJECT     VARCHAR2(50 BYTE) NOT NULL, -- ����
    CONTENT     VARCHAR2(2000 BYTE) NOT NULL, -- ����
    EMAIL       VARCHAR2(30 BYTE), -- �̸���
    READCOUNT   NUMBER DEFAULT 0, -- ��ȸ��
    PASSWORD    VARCHAR2(20 BYTE) NOT NULL, -- ��й�ȣ
    REF         NUMBER NOT NULL, -- ������ȣ
    RE_STEP     NUMBER DEFAULT 0,
    RE_LEVEL    NUMBER DEFAULT 0,
    IP          VARCHAR2(30 BYTE) NOT NULL,
    REG_DATE    DATE DEFAULT SYSDATE, -- �����
    DEL         CHAR(1 BYTE) DEFAULT 'N' -- ��������
);
select * from pj_board;
--------------------------------------------------------------------
-- ���
drop table pj_sub_board;
CREATE TABLE pj_sub_board (
    sub_num      NUMBER PRIMARY KEY,
    sub_WRITER     VARCHAR2(20 BYTE) NOT NULL, -- �ۼ���
    sub_CONTENT    VARCHAR2(2000 BYTE) NOT NULL, -- ����
    sub_PASSWORD   VARCHAR2(20 BYTE) NOT NULL, -- ��й�ȣ
    REF        NUMBER NOT NULL, -- ������ȣ
    REG_DATE   DATE DEFAULT SYSDATE, -- �����
    DEL        CHAR(1 BYTE) DEFAULT 'N' -- ��������
);

--------------------------------------------------------------------
-- ���

CREATE TABLE pj_member (
    ID             VARCHAR2(20 BYTE), -- �������̵�
    PASSWORD      VARCHAR2(20 BYTE),
    NAME           VARCHAR2(20 BYTE),
    RRNUM1         VARCHAR2(6), -- �ֹε�Ϲ�ȣ ���ڸ�
    RRNUM2         VARCHAR2(7), -- �ֹε�Ϲ�ȣ ���ڸ�
    ZIPNO          VARCHAR2(7 BYTE),
    ADDRESS1       VARCHAR2(80 BYTE),
    ADDRESS2       VARCHAR2(50 BYTE),
    TEL1           VARCHAR2(3 BYTE),
    TEL2           VARCHAR2(4 BYTE),
    TEL3           VARCHAR2(4 BYTE),
    EMAIL          VARCHAR2(20 BYTE),
    REGDATE        DATE DEFAULT SYSDATE, -- ������
    USE_FLAG       CHAR(1 BYTE) DEFAULT 0, -- Ż�� ����
    MANAGER_FLAG   CHAR(1) DEFAULT 0 -- �Ŵ��� ����
);

--------------------------------------------------------------------
-- ��ǰ

CREATE TABLE pj_item (
    num            NUMBER, -- �۹�ȣ
    ITEM_ID      NUMBER PRIMARY KEY,
    ITEM_KIND    VARCHAR2(30 BYTE), -- ��ǰ ����
    ITEM_NAME    VARCHAR2(100 BYTE),
    ITEM_PRICE   NUMBER(20),
    ITEM_COUNT   NUMBER(5), -- �Ǹ� ��ǰ ��
    ITEM_IMAGE   VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday       DATE, -- ��Ʈ ������
    endday         DATE, -- ��Ʈ ������
    trans_type     VARCHAR2(30), -- �ŷ� ����
    REG_DATE     DATE -- ��ǰ �����
);

--------------------------------------------------------------------
-- ��Ʈ

CREATE TABLE pj_rent (
    rent_id           NUMBER PRIMARY KEY,
    rent_seller       VARCHAR2(20),
    rent_buyer        VARCHAR2(20),
    ITEM_ID         NUMBER,
    ITEM_KIND       VARCHAR2(10 BYTE), -- ��ǰ ����
    ITEM_NAME       VARCHAR2(100 BYTE),
    ITEM_PRICE      NUMBER(20),
    ITEM_COUNT      NUMBER(5), -- �Ǹ� ��ǰ ��
    ITEM_IMAGE      VARCHAR2(16 BYTE) DEFAULT 'nothing.jpg',
    startday          DATE, -- ��Ʈ ������
    endday            DATE, -- ��Ʈ ������
    trans_type        VARCHAR2(30), -- �ŷ� ����
    deliveryname      VARCHAR2(20),
    deliverytel       VARCHAR2(15),
    deliveryaddress   VARCHAR2(200),
    sanction          VARCHAR2(10) default '�غ���',
    resanction        VARCHAR2(10),
    REG_DATE        DATE -- ��ǰ �����
);