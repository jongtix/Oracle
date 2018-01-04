CREATE TABLE menu (
    seq    NUMBER PRIMARY KEY,
    name   VARCHAR2(50)
);

CREATE SEQUENCE menu_seq START WITH 1 INCREMENT BY 1 NOCYCLE;

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    '¥��'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    '«��'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    '������'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    '��ä��'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    '������'
);

SELECT
    *
FROM
    menu;

COMMIT;

SELECT
    *
FROM
    member2info;