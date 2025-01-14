SET SERVEROUTPUT ON
DECLARE
  -- 테이블 타입을 정의 
  TYPE  ENAME_TABLE_TYPE IS TABLE OF EMP.ENAME%TYPE
    INDEX BY BINARY_INTEGER;
  TYPE  JOB_TABLE_TYPE IS TABLE OF EMP.JOB%TYPE
    INDEX BY BINARY_INTEGER;

  -- 테이블 타입으로 변수 선언
  ENAME_TABLE  ENAME_TABLE_TYPE;
  JOB_TABLE  JOB_TABLE_TYPE;
  
  I BINARY_INTEGER := 0;

 BEGIN  
  -- EMP 테이블에서 사원이름과 직급을 얻어옴
  FOR  K IN (SELECT ENAME, JOB FROM EMP) LOOP
    I := I + 1;                --인덱스 증가
    ENAME_TABLE(I) := K.ENAME; --사원이름과 
    JOB_TABLE(I) := K.JOB;     --직급을 저장. 
  END LOOP;

  --테이블에 저장된 내용을 출력
  FOR J IN 1..I LOOP          
    DBMS_OUTPUT.PUT_LINE(RPAD(ENAME_TABLE(J),12) 
       || ' / ' ||  RPAD(JOB_TABLE(J),9));
  END LOOP;
END;
/