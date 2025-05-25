-- 1. Animal
CREATE TABLE Animal (
  animal_id NUMBER PRIMARY KEY,
  species_name VARCHAR2(50) NOT NULL,
  gps_collar_id VARCHAR2(30) UNIQUE NOT NULL,
  last_known_location VARCHAR2(100),
  status VARCHAR2(20) CHECK (status IN ('endangered', 'common'))
);

-- 2. Environmental_Data
CREATE TABLE Environmental_Data (
  env_id NUMBER PRIMARY KEY,
  timestamp DATE NOT NULL,
  location VARCHAR2(100) NOT NULL,
  weather VARCHAR2(30),
  moon_phase VARCHAR2(20),
  vegetation_density VARCHAR2(30)
);

-- 3. Ranger_Unit
CREATE TABLE Ranger_Unit (
  ranger_id NUMBER PRIMARY KEY,
  unit_name VARCHAR2(50) NOT NULL,
  patrol_area VARCHAR2(100),
  contact_info VARCHAR2(100)
);

-- 4. Poaching_Incident
CREATE TABLE Poaching_Incident (
  incident_id NUMBER PRIMARY KEY,
  animal_id NUMBER REFERENCES Animal(animal_id),
  timestamp DATE NOT NULL,
  location VARCHAR2(100),
  severity_level VARCHAR2(10) CHECK (severity_level IN ('Low', 'Medium', 'High')),
  env_id NUMBER REFERENCES Environmental_Data(env_id)
);

-- 5. Incident_Response
CREATE TABLE Incident_Response (
  response_id NUMBER PRIMARY KEY,
  incident_id NUMBER NOT NULL,
  ranger_id NUMBER NOT NULL,
  response_time NUMBER,
  action_taken VARCHAR2(200),
  logged_at DATE DEFAULT SYSDATE,
  CONSTRAINT fk_incident FOREIGN KEY (incident_id) REFERENCES Poaching_Incident(incident_id),
  CONSTRAINT fk_ranger FOREIGN KEY (ranger_id) REFERENCES Ranger_Unit(ranger_id)
);
