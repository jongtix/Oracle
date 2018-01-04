CREATE TABLE menu (
    seq    NUMBER PRIMARY KEY,
    name   VARCHAR2(50)
);

CREATE SEQUENCE menu_seq START WITH 1 INCREMENT BY 1 NOCYCLE;

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    'Â¥Àå'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    'Â«»Í'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    'ººÀ½¹ä'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    'ÀâÃ¤¹ä'
);

INSERT INTO menu VALUES (
    menu_seq.NEXTVAL,
    'ÅÁ¼öÀ°'
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