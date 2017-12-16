-- 입고 트리거
CREATE OR REPLACE TRIGGER TRG_04
   AFTER INSERT ON 입고
   FOR EACH ROW
DECLARE
   V_CNT NUMBER;
BEGIN
   UPDATE 입고
   SET 입고금액 = :NEW.입고수량 + :NEW.입고단가
   WHERE 상품코드 = :NEW.상품코드;

   UPDATE 상품
   SET 재고수량 = 재고수량 + :NEW.입고수량
   WHERE 상품코드 = :NEW.상품코드;
END;
/  
