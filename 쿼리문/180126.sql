SELECT
    *
FROM
    member3;

CREATE TABLE member3 (
    id         VARCHAR2(10) PRIMARY KEY,
    password   VARCHAR2(10) NOT NULL,
    name       VARCHAR2(50) NOT NULL,
    reg_date   DATE
);

INSERT INTO member3 VALUES (
    'hong',
    '1234',
    'ȫ�浿',
    SYSDATE
);

COMMIT;