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
   

### Phase 4: Database Setup
- **Focus**: Created a pluggable database (PDB).
- **Deliver![2](https://github.com/user-attachments/assets/c08f5200-9348-4ae0-9c99-56e8d260d6d5)
ables**:
  -
 
- **Screenshots**:
  - **Pluggable Database Status**:
    ![PDB Status](pluga![1](https://github.com/user-attachments/assets/d5ceb9c3-1a49-454d-8073-835ebc7ab89f)
ble.jpg)
  - **Oracle Enterprise Manager**:
    ![OEM Dashboard](OEM.![1](https://github.com/user-attachments/assets/1a2e4f4c-8707-406b-b9ef-44fe86420586)
jpg)
    
- **Code** ([create_pdb.sql](create_pdb.sql)):
  ```sql
  CONN SYSTEM/your_system_password@localhost:1521/orcl AS SYSDBA;

  CREATE PLUGGABLE DATABASE Mon_25963_Sylvie_WildlifePoaching_DB
      ADMIN USER sylvie IDENTIFIED BY Sylvie_25963
      FILE_NAME_CONVERT = ('L:\oracle21c\oradata\ORCL\pdbseed',
                           'L:\oracle21c\oradata\ORCL\Mon_25963_Sylvie_WildlifePoaching_DB');

  ALTER PLUGGABLE DATABASE Mon_25963_Sylvie_WildlifePoaching_DB OPEN;

  ALTER SESSION SET CONTAINER = Mon_25963_Sylvie_WildlifePoaching_DB;
  GRANT DBA ![1]
TO sylvie;
![1](https://github.com/user-attachments/assets/0a35f6d5-9573-42c4-8c05-492c3e9264e6)

### Phase 5: SQL QUERIES.
- **Creating tables**:
![3](https://github.com/user-attachments/assets/f91d910a-fbc7-4cec-9b71-d58b6d8ac241)
![4](https://github.com/user-attachments/assets/3d8214f0-36f7-44a7-bc44-e27e8fd38acc)
![5](https://github.com/user-attachments/assets/83e17ed6-eb77-459e-b0d4-336e67ac4453)
![6](https://github.com/user-attachments/assets/69d07c70-9d55-4a5b-8581-01ef44d957c7)


- **INSERTING DATA INTO TABLES**:
- ![7](https://github.com/user-attachments/assets/c7a06ef9-252a-4694-a30d-be3552e1f8f6)

- **DML (DELETE DATA FROM)**:
- ![dml_delete](https://github.com/user-attachments/assets/40fc1596-56bd-47f5-b248-2b3d2e13bd1c)

- - **UPDATE DATA**:
  - ![dml_update](https://github.com/user-attachments/assets/eff42039-5e0d-4bae-96e9-b691a2b8ac14)
 
  - 

### Phase 7: Advanced Programming
Focus: Implement advanced PL/SQL features to automate workflows, enforce rules, and ensure data security.
### Deliverables:

    triggers.sql: Enrollment status validation trigger.
    cursors.sql: Student enrollment report cursor.
    functions.sql: Average grade calculation function.
    packages.sql: Academic utilities package.
    audit.sql: Audit log trigger and query.

 ### Features:

    **Triggers**: Enforce business rules, e.g., validate enrollment status.
    **Cursors**: Process data row-by-row for reporting.
    **Functions**: Encapsulate logic for calculations like average grades.
    **Packages**: Organize related operations for modularity.
    **Auditing**: Track changes to sensitive data.

  

**TRIGGERS**
![holiday](https://github.com/user-attachments/assets/36501c6f-5345-40ae-857f-a43ad41f5620)

![triger](https://github.com/user-attachments/assets/b1135fe7-1586-464e-8608-82fef05b6a18)


**FUNCTIONS**
![function](https://github.com/user-attachments/assets/550d976b-3c94-4848-8642-58d481642913)

**PROCEDURE**
![procedure](https://github.com/user-attachments/assets/924953f5-75c6-428f-bc8f-3f1e5f62f460)

**PACKAGES**
![package](https://github.com/user-attachments/assets/62ba4799-330a-45a2-8f59-0e947cfb6288)

**AUDIT**
![audit](https://github.com/user-attachments/assets/1ba07e53-93f1-41e9-b698-33caa9176222)
![audit_triger](https://github.com/user-attachments/assets/bf0819a2-ce1e-4172-afe5-88338e232398)

**TESTING**
![testing](https://github.com/user-attachments/assets/0cb2a9dd-62cd-418a-b8b0-cfc36f7f631b)



  
