-- ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG03
    AFTER UPDATE ON �԰�
    FOR EACH ROW
BEGIN
        UPDATE ��ǰ
        SET ������ = ������ + (-:old.�԰����+:new.�԰����)	    
        WHERE ��ǰ�ڵ� = :new.��ǰ�ڵ�;
END;
/
