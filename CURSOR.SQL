DECLARE
    CURSOR incident_cursor IS
        SELECT p.incident_id, p.location 
        FROM Poaching_Incident p
        JOIN Species s ON p.species_id = s.species_id
        WHERE s.conservation_status = 'Endangered';
    incident_record incident_cursor%ROWTYPE;
BEGIN
    OPEN incident_cursor;
    LOOP
        FETCH incident_cursor INTO incident_record;
        EXIT WHEN incident_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Incident ID: ' || incident_record.incident_id || ' at ' || incident_record.location);
    END LOOP;
    CLOSE incident_cursor;
END;
/