SET SERVEROUTPUT ON
DECLARE
  VDEPT DEPT%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('부서번호 / 부서명 / 지역명'); 
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
  -- 변수 CNT는 1부터 1씩 증가하다가 4에 도달하면 반복문에서 벗어난다.
  FOR CNT IN 1..4 LOOP
    SELECT * INTO VDEPT
    FROM DEPT
    WHERE DEPTNO=10*CNT;

    DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' / ' || VDEPT.DNAME 
                     || ' / ' || VDEPT.LOC); 
  END LOOP;
END;
/
