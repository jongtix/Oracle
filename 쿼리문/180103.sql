CREATE TABLE member2info (
    id        VARCHAR2(10) PRIMARY KEY,
    address   VARCHAR2(100),
    tel       VARCHAR2(20),
    email     VARCHAR2(20)
);

CREATE TABLE student (
    num    NUMBER PRIMARY KEY,
    name   VARCHAR2(20)
);

SELECT
    *
FROM
    student;

CREATE OR REPLACE PROCEDURE plus (
    num1     IN NUMBER,
    num2     IN NUMBER,
    result   OUT NUMBER
)
    AS
BEGIN
    result := num1 + num2;
END;
/

SELECT
    *
FROM
    user_objects
WHERE
    object_type = upper('procedure');

CREATE OR REPLACE FUNCTION member_name (
    v_id   IN member2.id%TYPE
) RETURN VARCHAR2 AS
    m_name   VARCHAR2(10) := '무명인';
BEGIN
-- 입력 받은 id로 이름 추출
    SELECT
        name
    INTO
        m_name
    FROM
        member2
    WHERE
        id = v_id;
-- 결과 출력

    RETURN m_name;
EXCEPTION
    WHEN no_data_found OR too_many_rows THEN
        RETURN m_name;
END;
/

SELECT
    *
FROM
    user_objects
WHERE
    object_type = upper('function');

CREATE TABLE testblob (
    id      VARCHAR2(10) PRIMARY KEY,
    pwd     VARCHAR2(10),
    name    VARCHAR2(10),
    photo   BLOB
);
TRUNCATE table testblob;
delete testblob
;
select * from testblob;