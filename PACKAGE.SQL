CREATE OR REPLACE PACKAGE poaching_utils IS
    PROCEDURE log_incident_activity(incident_id_in INT);
    FUNCTION calculate_risk_score(species_id_in INT) RETURN NUMBER;
END poaching_utils;
/

