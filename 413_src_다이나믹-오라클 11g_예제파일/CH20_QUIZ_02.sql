SET SERVEROUTPUT ON
DECLARE
  DAN  NUMBER := 5;
  I  NUMBER := 1;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || I ||' = '|| (DAN*I) );
    I := I + 1;
    
    IF I > 9 THEN
      EXIT;        
    END IF;
  END LOOP;           
END;
/
