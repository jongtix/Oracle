SET SERVEROUTPUT ON
DECLARE
 -- %ROWTYPE �Ӽ����� �ο� ��ü�� ������ �� �ִ� ���۷��� ���� ���� 
  VEMP EMP%ROWTYPE; 
  ANNSAL NUMBER(7,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE('��� / �̸� / ����'); 
  DBMS_OUTPUT.PUT_LINE('-------------------------------------');

 -- SCOTT ����� ��ü ������ �ο� ������ ���� VEMP�� �����Ѵ�.  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';

 -- Ŀ�̼��� NULL�� ��� 0���� �����ؾ� �ùٸ� ���� ���




 -- ��Į�� ������ ������ ����� ����� �����Ѵ�.
  ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 

 -- ��� ��� 
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /'||VEMP.ENAME||' /'||ANNSAL); 
END;
/