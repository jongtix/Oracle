--����Ʈ����
CREATE OR REPLACE TRIGGER TRG04
    AFTER DELETE ON �԰�
    FOR EACH ROW
BEGIN
        UPDATE ��ǰ
        SET ������ = ������ - :old.�԰����
        WHERE ��ǰ�ڵ� = :old.��ǰ�ڵ�;
END;
/
