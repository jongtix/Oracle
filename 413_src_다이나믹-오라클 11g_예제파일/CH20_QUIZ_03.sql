SET SERVEROUTPUT ON
DECLARE
  VDEPT DEPT%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('�μ���ȣ / �μ��� / ������'); 
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
  -- ���� CNT�� 1���� 1�� �����ϴٰ� 4�� �����ϸ� �ݺ������� �����.
  FOR CNT IN 1..4 LOOP
    SELECT * INTO VDEPT
    FROM DEPT
    WHERE DEPTNO=10*CNT;

    DBMS_OUTPUT.PUT_LINE(VDEPT.DEPTNO || ' / ' || VDEPT.DNAME 
                     || ' / ' || VDEPT.LOC); 
  END LOOP;
END;
/
