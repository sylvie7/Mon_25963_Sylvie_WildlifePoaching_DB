-- Connect to the pluggable database
CONNECT sylvie/Sylvie_25963@localhost:1521/Mon_25963_Sylvie_Poaching_DB;

-- 1. Insert into Animal
INSERT INTO Animal (animal_id, species_name, gps_collar_id, last_known_location, status)
VALUES (1, 'Black Rhino', 'GPS-RH001', 'Kruger National Park', 'endangered');
INSERT INTO Animal (animal_id, species_name, gps_collar_id, last_known_location, status)
VALUES (2, 'Amur Leopard', 'GPS-LE002', 'Serengeti', 'endangered');
INSERT INTO Animal (animal_id, species_name, gps_collar_id, last_known_location, status)
VALUES (3, 'African Elephant', 'GPS-EL003', 'Tsavo East', 'common');
INSERT INTO Animal (animal_id, species_name, gps_collar_id, last_known_location, status)
VALUES (4, 'White Rhino', 'GPS-RH004', 'Kruger National Park', 'endangered');

-- 2. Insert into Environmental_Data
INSERT INTO Environmental_Data (env_id, timestamp, location, weather, moon_phase, vegetation_density)
VALUES (1, TO_DATE('2023-06-15 14:30', 'YYYY-MM-DD HH24:MI'), 'Kruger National Park', 'Sunny', 'Full Moon', 'High');
INSERT INTO Environmental_Data (env_id, timestamp, location, weather, moon_phase, vegetation_density)
VALUES (2, TO_DATE('2023-07-10 20:00', 'YYYY-MM-DD HH24:MI'), 'Serengeti', 'Rainy', 'Waning Crescent', 'Medium');
INSERT INTO Environmental_Data (env_id, timestamp, location, weather, moon_phase, vegetation_density)
VALUES (3, TO_DATE('2023-08-01 06:15', 'YYYY-MM-DD HH24:MI'), 'Tsavo East', 'Cloudy', 'New Moon', 'Low');

-- 3. Insert into Ranger_Unit
INSERT INTO Ranger_Unit (ranger_id, unit_name, patrol_area, contact_info)
VALUES (1, 'Alpha Team', 'Kruger National Park', 'alpha.team@example.com');
INSERT INTO Ranger_Unit (ranger_id, unit_name, patrol_area, contact_info)
VALUES (2, 'Bravo Team', 'Serengeti', 'bravo.team@example.com');
INSERT INTO Ranger_Unit (ranger_id, unit_name, patrol_area, contact_info)
VALUES (3, 'Charlie Team', 'Tsavo East', 'charlie.team@example.com');

-- 4. Insert into Poaching_Incident
INSERT INTO Poaching_Incident (incident_id, animal_id, timestamp, location, severity_level, env_id)
VALUES (1, 1, TO_DATE('2023-06-15 15:00', 'YYYY-MM-DD HH24:MI'), 'Kruger National Park', 'High', 1);
INSERT INTO Poaching_Incident (incident_id, animal_id, timestamp, location, severity_level, env_id)
VALUES (2, 2, TO_DATE('2023-07-10 21:00', 'YYYY-MM-DD HH24:MI'), 'Serengeti', 'Medium', 2);
INSERT INTO Poaching_Incident (incident_id, animal_id, timestamp, location, severity_level, env_id)
VALUES (3, 3, TO_DATE('2023-08-01 07:00', 'YYYY-MM-DD HH24:MI'), 'Tsavo East', 'Low', 3);

-- 5. Insert into Incident_Response
INSERT INTO Incident_Response (response_id, incident_id, ranger_id, response_time, action_taken, logged_at)
VALUES (1, 1, 1, 30, 'Patrol dispatched to apprehend suspects', TO_DATE('2023-06-15 15:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Incident_Response (response_id, incident_id, ranger_id, response_time, action_taken, logged_at)
VALUES (2, 2, 2, 45, 'Suspect apprehended, animal secured', TO_DATE('2023-07-10 21:45', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Incident_Response (response_id, incident_id, ranger_id, response_time, action_taken, logged_at)
VALUES (3, 3, 3, 60, 'Area secured, investigation started', TO_DATE('2023-08-01 08:00', 'YYYY-MM-DD HH24:MI'));