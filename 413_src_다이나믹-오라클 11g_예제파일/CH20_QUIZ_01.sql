SET SERVEROUTPUT ON
DECLARE
 -- %ROWTYPE 속성으로 로우 전체를 저장할 수 있는 레퍼런스 변수 선언 
  VEMP EMP%ROWTYPE; 
  ANNSAL NUMBER(7,2);
BEGIN
  DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 연봉'); 
  DBMS_OUTPUT.PUT_LINE('-------------------------------------');

 -- SCOTT 사원의 전체 정보를 로우 단위로 얻어와 VEMP에 저장한다.  
  SELECT * INTO VEMP
  FROM EMP
  WHERE ENAME='SCOTT';

 -- 커미션이 NULL일 경우 0으로 변경해야 올바른 연봉 계산




 -- 스칼라 변수에 연봉을 계산할 결과를 저장한다.
  ANNSAL:=VEMP.SAL*12+VEMP.COMM ; 

 -- 결과 출력 
  DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||' /'||VEMP.ENAME||' /'||ANNSAL); 
END;
/