CREATE OR REPLACE TRIGGER TRG_04
   AFTER INSERT ON �԰�
   FOR EACH ROW
BEGIN
   UPDATE ��ǰ
   SET ������ = ������ + :NEW.�԰����
   WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/  
