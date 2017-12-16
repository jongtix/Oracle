--삭제트리거
CREATE OR REPLACE TRIGGER TRG04
    AFTER DELETE ON 입고
    FOR EACH ROW
BEGIN
        UPDATE 상품
        SET 재고수량 = 재고수량 - :old.입고수량
        WHERE 상품코드 = :old.상품코드;
END;
/
