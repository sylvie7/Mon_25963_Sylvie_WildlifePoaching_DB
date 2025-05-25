CREATE TABLE AuditLog (
    log_id INT PRIMARY KEY,
    action VARCHAR2(50),
    incident_id INT,
    change_date DATE
);

CREATE SEQUENCE audit_log_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER audit_incident_changes
AFTER UPDATE OR DELETE ON Poaching_Incident
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (log_id, action, incident_id, change_date)
    VALUES (audit_log_seq.NEXTVAL, 
            CASE WHEN DELETING THEN 'DELETE' ELSE 'UPDATE' END, 
            :OLD.incident_id, SYSDATE);
END;
/

SELECT log_id, action, incident_id, change_date FROM AuditLog;