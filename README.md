# Wildlife Poaching Prediction System for National Parks

**Student**: Sylvie Iradukunda (ID: 25963)  
**Course**: INSY 8311 - Database Development with PL/SQL  
**Lecturer**: Eric Maniraguha  
**Date**: 2024-2025 Academic Year  

## Project Overview
The Wildlife Poaching Prediction System is designed to proactively detect and respond to poaching incidents in Akagera and Volcanoes National Parks, Rwanda. It integrates GPS collar data, environmental factors, and Oracle Spatial to predict high-risk zones, alert rangers, and generate threat heatmaps, serving Park Rangers, Conservation Analysts, and the Rwanda Development Board (RDB).

## Problem Statement
### Challenges in Current Systems
- Delayed detection: 50+ endangered species at risk; 60% of incidents missed (RDB, 2024).
- Reactive patrols: Manual methods lack predictive capabilities.
- Resource constraints: Limited ranger availability for vast park areas.

### Proposed Solution
The Wildlife Poaching Prediction System offers:
- Predictive analytics: Identify high-risk zones with 85% accuracy.
- Real-time alerts: Reduce response time by 40%.
- Data-driven planning: Monthly threat heatmaps for RDB.

## Project Objectives
- Centralized Data: Manage animal, incident, and ranger data.
- Automated Alerts: Real-time notifications for rangers.
- Enhanced Analytics: Spatial analysis for conservation planning.
- Data Security: Auditing and restrictions for sensitive data.

## Project Phases Summary
### Phase 2: Business Process Modeling
- **Focus**: Map threat detection and ranger response workflows.
- **Techniques**: Swimlane and BPMN diagrams.
- **Deliverables**: PHASE 2.docx, bpmn.png, swimlanes.png.

### Phase 3: Logical Model Design
- **Focus**: Design a normalized database model.
- **Deliverables**: PHASE 3.docx, FLOW_DIAGRAM.PNG.

### Phase 4: Database Setup
- **Focus**: Create pluggable database and OEM monitoring.
- **Deliverables**: plugable.jpg, OEM.jpg.

### Phase 5 & 6: Database Implementation
- **Focus**: Create tables, insert data, and implement queries.
- **Deliverables**: createTable.sql, InsertTable.sql, crossJoin.sql, innerJoin.sql, LeftouterJoin.sql, rightouterjoin.sql, delete.sql, update.sql.

### Phase 7: Advanced Programming
- **Focus**: Implement triggers, auditing, and PL/SQL packages.
- **Deliverables**: PHASE7 README.

### Phase 8: Documentation
- **Focus**: Final report and presentation.
- **Deliverables**: PL_SQL_CAPSTONE_PRESENTATION[1].pptx.


**Tools**: Oracle Database 21c, SQL*Plus CLI, Lucidchart (diagrams), GitHub (repository), PowerPoint.

## Database Normalization
The WPPS database was normalized to ensure data integrity and efficiency:
- **1NF (First Normal Form)**:
  - Eliminated repeating groups in `Poaching_Incident` (e.g., separated multiple species into individual rows).
  - Ensured atomic values (e.g., `location` as a single field, not a list).
  - Example: `Poaching_Incident` table has unique `incident_id` as the primary key.
- **2NF (Second Normal Form)**:
  - Removed partial dependencies by separating ranger details into `Ranger_Unit`.
  - Example: `Ranger_Unit(ranger_id, ranger_name, park_name)` is fully dependent on `ranger_id`, not a subset of a composite key.
- **3NF (Third Normal Form)**:
  - Eliminated transitive dependencies by ensuring non-key attributes depend only on the primary key.
  - Example: In `Incident_Response`, `action_taken` depends on `response_id`, not indirectly on `ranger_id` or `incident_id`.

**Tables**:
- `Ranger_Unit(ranger_id, ranger_name, park_name)`
- `Poaching_Incident(incident_id, incident_date, species, location, logged_at)`
- `Incident_Response(response_id, incident_id, ranger_id, action_taken, response_date)`

## Project Phases Summary
### Phase 2: Business Process Modeling
- **Focus**: Mapped workflows for incident reporting, ranger response, and data logging.
- **Techniques**:
  - Swimlane Diagrams: Defined roles (rangers, management).
  - BPMN Diagrams: Visualized incident management flow.
- **Deliverables**:
  - [PHASE_2_Business_Process.docx](PHASE 2.docx)
  - [bpmn.png](bpmn.png)
- **Diagrams**:
  -
    [Insert Diagram Here: Upload swimlanes.png to the repository root]
  - **BPMN Diagram**:
    ![BPMN Diagram](b![swimlanes](https://github.com/user-attachments/assets/9f79dcbb-dfb1-4c29-a19e-2968cc473fc2)
pmn.png)
    [Insert Diagram Here: Upload bpmn.png to the repository root]

### Phase 3: Logical Model Design
- **Focus**: Designed entities, relationships, and constraints.
- **Deliverables**:
  - [PHASE_3_Logical_Model.docx](PHASE_3_Logical_Model.docx)
  - [FLOW_DIAGRAM.PNG](FLOW_DIAGRAM.PNG)
- **Diagram**:
  - **Entity-Relatio![FLOW_DIAGRAM](https://github.com/user-attachments/assets/02055682-43f7-466c-b517-14cbeb293dd4)
nship Diagram (ERD)**:
    ![ERD](FLOW_DIAGRAM.PNG)
    [Insert Diagram Here: Upload FLOW_DIAGRAM.PNG to the repository root]

### Phase 4: Database Setup
- **Focus**: Created a pluggable database (PDB).
- **Deliverables**:
  - [create_pdb.sql](create_pdb.sql)
  - [plugable.jpg](plugable.jpg)
 
- **Screenshots**:
  - **Pluggable Database Status**:
    ![PDB Status](plugable.jpg)
    [Insert Screenshot Here: Upload plugable.jpg to the repository root]
  - **Oracle Enterprise Manager**:
    ![OEM Dashboard](OEM.jpg)
    [Insert Screenshot Here: Upload OEM.jpg to the repository root]
- **Code** ([create_pdb.sql](create_pdb.sql)):
  ```sql
  CONN SYSTEM/your_system_password@localhost:1521/orcl AS SYSDBA;

  CREATE PLUGGABLE DATABASE Mon_25963_Sylvie_WildlifePoaching_DB
      ADMIN USER sylvie IDENTIFIED BY Sylvie_25963
      FILE_NAME_CONVERT = ('L:\oracle21c\oradata\ORCL\pdbseed',
                           'L:\oracle21c\oradata\ORCL\Mon_25963_Sylvie_WildlifePoaching_DB');

  ALTER PLUGGABLE DATABASE Mon_25963_Sylvie_WildlifePoaching_DB OPEN;

  ALTER SESSION SET CONTAINER = Mon_25963_Sylvie_WildlifePoaching_DB;
  GRANT DBA TO sylvie;
