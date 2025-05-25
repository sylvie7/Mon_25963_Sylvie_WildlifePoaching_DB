CREATE OR REPLACE FUNCTION calculate_risk (
  p_location VARCHAR2,
  p_weather VARCHAR2
) RETURN NUMBER IS
  v_risk_score NUMBER := 0;
BEGIN
  IF p_weather = 'Rainy' THEN
    v_risk_score := v_risk_score + 5;
  END IF;

  IF p_location = 'Zone A' THEN
    v_risk_score := v_risk_score + 10;
  END IF;

  RETURN v_risk_score;
END;
