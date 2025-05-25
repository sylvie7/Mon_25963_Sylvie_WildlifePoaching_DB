CREATE OR REPLACE TRIGGER alert_ranger
AFTER INSERT ON Poaching_Incident
FOR EACH ROW
BEGIN
  IF :NEW.severity_level = 'High' THEN
    DBMS_OUTPUT.PUT_LINE('🚨 Alert: Ranger dispatched to ' || :NEW.location);
  END IF;
END;
