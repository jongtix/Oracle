CREATE OR REPLACE TRIGGER TRG_04
   AFTER INSERT ON 입고
   FOR EACH ROW
BEGIN
   UPDATE 상품
   SET 재고수량 = 재고수량 + :NEW.입고수량
   WHERE 상품코드 = :NEW.상품코드;
END;
/  
