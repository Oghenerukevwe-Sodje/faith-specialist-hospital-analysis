--CHECK FOR DUPLICATES

--PATIENTS 
SELECT pt_id,
    	COUNT(*) AS patient_count
FROM patients
GROUP BY pt_id
HAVING COUNT(*) > 1;

--ADMISSIONS
SELECT
    admission_id,
    COUNT(*) AS admission_count
FROM admissions
GROUP BY admission_id
HAVING COUNT(*) > 1;

--DOCTORS
SELECT doctor_id,
    COUNT(*) AS doctor_count
FROM doctors
GROUP BY doctor_id
HAVING COUNT(*) > 1;

--RISK FACTORS
SELECT
    pt_id,
    COUNT(*) AS total_count
FROM risk_factors
GROUP BY pt_id
HAVING COUNT(*) > 1;


--CHECKING FOR NULL/MISSING VALUES

PATIENTS
SELECT COUNT(*) AS total_records,
    	COUNT(*) FILTER (WHERE pt_id IS NULL) AS missing_pt_id,
   		COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
   	 	COUNT(*) FILTER (WHERE sex IS NULL) AS missing_sex,
    	COUNT(*) FILTER (WHERE occupation IS NULL) AS missing_occupation,
    	COUNT(*) FILTER (WHERE level_of_education IS NULL) AS missing_education,
   	 	COUNT(*) FILTER (WHERE marital_status IS NULL) AS missing_marital_status
FROM patients;
-- missing age: 5
--missing education: 936
--missing marital status: 16

ADMISSIONS
SELECT COUNT(*) AS total_records,
    	COUNT(*) FILTER (WHERE admission_id IS NULL) AS missing_admission_id,
    	COUNT(*) FILTER (WHERE pt_id IS NULL) AS missing_pt_id,
    	COUNT(*) FILTER (WHERE doctor_id IS NULL) AS missing_doctor_id,
    	COUNT(*) FILTER (WHERE "DAMA" IS NULL) AS missing_dama,
    	COUNT(*) FILTER (WHERE dead IS NULL) AS missing_dead,
    	COUNT(*) FILTER (WHERE admission_duration IS NULL) AS missing_duration
FROM admissions;

DOCTORS
SELECT COUNT(*) AS total_records,
    	COUNT(*) FILTER (WHERE doctor_id IS NULL) AS missing_doctor_id,
    	COUNT(*) FILTER (WHERE doctor IS NULL) AS missing_doctor,
    	COUNT(*) FILTER (WHERE gender IS NULL) AS missing_gender,
    	COUNT(*) FILTER (WHERE email IS NULL) AS missing_email,
    	COUNT(*) FILTER (WHERE specialization IS NULL) AS missing_specialization
FROM doctors;

RISK FACTORS
SELECT COUNT(*) AS total_records,
    	COUNT(*) FILTER (WHERE pt_id IS NULL) AS missing_pt_id,
    	COUNT(*) FILTER (WHERE alcohol_hx IS NULL) AS missing_alcohol,
    	COUNT(*) FILTER (WHERE tobacco_hx IS NULL) AS missing_tobacco,
    	COUNT(*) FILTER (WHERE "NSAID_use" IS NULL) AS missing_nsaid
FROM risk_factors;


--CHECKING FOR INCONSISTENCIES

PATIENTS 
--sex
SELECT
    sex,
    COUNT(*) AS count
FROM patients
GROUP BY sex
ORDER BY count DESC;

--occupation
SELECT
    occupation,
    COUNT(*) AS count
FROM patients
GROUP BY occupation
ORDER BY occupation;
--Trading 415
--Trading 7

--education
SELECT
    level_of_education,
    COUNT(*) AS count
FROM patients
GROUP BY level_of_education
ORDER BY level_of_education;
--Ba: 4
--BA: 4

--marital status (single has 1, Single 233)
SELECT
    marital_status,
    COUNT(*) AS count
FROM patients
GROUP BY marital_status
ORDER BY marital_status;
--Single: 1
--Single: 233

--2. ADMISSIONS TABLE
SELECT *
FROM admissions;

--DAMA
SELECT "DAMA",
    COUNT(*) AS TOTAL
FROM admissions
GROUP BY "DAMA";
--No: 1202
--Yes: 275
--Yes: 1

--dead
SELECT dead,
    COUNT(*) AS total
FROM admissions
GROUP BY dead;

--CKD
SELECT "CKD",
    COUNT(*) AS count
FROM admissions
GROUP BY "CKD";

--dialysis
SELECT dialysis,
    COUNT(*) AS total
FROM admissions
GROUP BY dialysis;
--No: 1458
--NO: 1
--Yes: 19

--stroke
SELECT stroke,
    COUNT(*) AS total
FROM admissions
GROUP BY stroke;
--No: 1130
-- No: 1
--Yes: 347

-- DM
SELECT "DM",
    COUNT(*) AS total
FROM admissions
GROUP BY "DM";
--No: 1311
-- No: 1
--Yes: 166

SELECT cancer,
    COUNT(*) AS total
FROM admissions
GROUP BY cancer;

SELECT "PUD",
    COUNT(*) AS total
FROM admissions
GROUP BY "PUD";

3. RISK FACTORS
SELECT *
FROM risk_factors

--alcohol hx
SELECT alcohol_hx,
    COUNT(*) AS total
FROM risk_factors
GROUP BY alcohol_hx;

SELECT tobacco_hx,
    COUNT(*) AS total
FROM risk_factors
GROUP BY tobacco_hx;

SELECT "NSAID_use",
    COUNT(*) AS total
FROM risk_factors
GROUP BY "NSAID_use";
--No: 1269
-- No: 1
--Yes: 208


--CHECKING FOR CONSISTENCY
SELECT *
FROM admissions
WHERE "DAMA" = 'Yes' AND "reason_for_DAMA" IS NULL;


SELECT *
FROM admissions
WHERE "DAMA" = 'No' AND "reason_for_DAMA" IS NOT NULL;

SELECT *
FROM admissions
WHERE dead = 'Yes'
AND "cause_of_death" IS NULL
--1 (pt_id 273)

SELECT *
FROM admissions
WHERE dead = 'No'
AND cause_of_death IS NOT NULL;
--  no death(4)
--cause: empty

SELECT *
FROM admissions
WHERE "CKD" = 'Yes'
AND "cause_of_CKD" IS NULL
--4 Cases

SELECT *
FROM admissions
WHERE "CKD" = 'no'
AND "cause_of_CKD" IS NOT NULL

SELECT *
FROM admissions
WHERE dialysis = 'Yes'
AND no_of_sessions IS NULL    
--1 case

SELECT *
FROM admissions
WHERE dialysis = 'No'
AND no_of_sessions IS NOT NULL
--7 cases of no that have number of sessions

SELECT *
FROM admissions
WHERE cancer = 'Yes'
AND type_of_cancer IS NULL   

SELECT *
FROM admissions
WHERE cancer = 'No'
AND type_of_cancer IS NOT NULL

--Referential checks

SELECT
    pt_id,
    COUNT(*) AS admissions
FROM admissions
GROUP BY pt_id
ORDER BY admissions DESC;
--patient to admission is 1:1

SELECT
    pt_id,
    COUNT(*) AS risk_records
FROM risk_factors
GROUP BY pt_id
HAVING COUNT(*) > 1;
--patient to risk factor is 1:1

SELECT
    doctor_id,
    COUNT(*) AS admissions
FROM admissions
GROUP BY doctor_id
ORDER BY admissions DESC;
--admission to doctors is 1:many



--To confirm inconsistencies
SELECT
    TRIM(occupation) AS occupation,
    COUNT(*) AS count
FROM patients
GROUP BY TRIM(occupation)
ORDER BY count DESC;

--education
SELECT
    UPPER (level_of_education) AS education,
    COUNT(*) AS count
FROM patients
GROUP BY UPPER(level_of_education)
ORDER BY UPPER(level_of_education);
--Ba: 4
--BA: 4
