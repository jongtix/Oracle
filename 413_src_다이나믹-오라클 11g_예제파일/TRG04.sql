-- �԰� Ʈ����
CREATE OR REPLACE TRIGGER TRG_04
   AFTER INSERT ON �԰�
   FOR EACH ROW
DECLARE
   V_CNT NUMBER;
BEGIN
   UPDATE �԰�
   SET �԰�ݾ� = :NEW.�԰���� + :NEW.�԰�ܰ�
   WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;

   UPDATE ��ǰ
   SET ������ = ������ + :NEW.�԰����
   WHERE ��ǰ�ڵ� = :NEW.��ǰ�ڵ�;
END;
/  
