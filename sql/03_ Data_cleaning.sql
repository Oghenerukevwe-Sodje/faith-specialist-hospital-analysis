--data_cleaning
-- Purpose: Clean and standardise the data to prepare it for analysis.

--CREATING A CLEAN TABLE
CREATE TABLE patient_table(
		pt_id INTEGER PRIMARY KEY,
		Name VARCHAR(100),
		Age INTEGER,
		Sex VARCHAR(2),
		Occupation VARCHAR(100),
		Level_of_education VARCHAR(50),
		Marital_status VARCHAR(50)
);

INSERT INTO patient_table
SELECT pt_id,
    TRIM(name),
    age,
    TRIM(sex),
    INITCAP(TRIM(occupation)),
    INITCAP(TRIM(level_of_education)),
    INITCAP(TRIM(marital_status))
FROM patients;

----------------------------------------
--Create risk factors table
CREATE TABLE risk_factor_table(
		pt_id INTEGER REFERENCES patient_table(pt_id),
		Alcohol_Hx VARCHAR(10),
		Tobacco_Hx VARCHAR(10),
		NSAID_Use VARCHAR(10)
);

INSERT INTO risk_factor_table
SELECT pt_id,
    INITCAP(TRIM(alcohol_hx)) AS alcohol_hx,
    INITCAP(TRIM(tobacco_hx)) AS tobacco_hx,
    INITCAP(TRIM("NSAID_use")) AS "NSAID_use"
FROM risk_factors;

--------------------------------------------------
--Creating Doctors table
CREATE TABLE doctor_table(
			doctor_id VARCHAR(50) PRIMARY KEY,
			doctor VARCHAR(50),
			gender VARCHAR(10),
			email VARCHAR(100),
			specialization VARCHAR(100)
);

INSERT INTO doctor_table
SELECT doctor_id,
		doctor,
		gender,
		email,
		specialization
FROM doctors
------------------------------------------------
--Creating admissions table
CREATE TABLE admission_table(
			pt_id INTEGER REFERENCES patient_table(pt_id),
			admission_id INTEGER PRIMARY KEY,
			admission_duration INTEGER,
			doctor_id VARCHAR(50) REFERENCES doctor_table(doctor_id),
			"DAMA" VARCHAR(10),
			"reason_for_DAMA" VARCHAR(50),
			dead VARCHAR(50),
			cause_of_death VARCHAR(50),
			"CKD" VARCHAR(50),
			"cause_of_CKD" VARCHAR(50),
			dialysis VARCHAR(50),
			no_of_sessions INTEGER,
			stroke VARCHAR(50),
			"DM" VARCHAR(50),
			cancer VARCHAR(50),
			type_of_cancer VARCHAR(50),
			"PUD" VARCHAR(50)
);

INSERT INTO admission_table
SELECT 
	pt_id,
    admission_id,
    admission_duration,
	doctor_id,
    INITCAP(TRIM("DAMA")) AS "DAMA",
    TRIM("reason_for_DAMA") AS "reason_for_DAMA",
    INITCAP(TRIM(dead)) AS dead,
    TRIM(cause_of_death) AS cause_of_death,
    INITCAP(TRIM("CKD")) AS "CKD",
    TRIM("cause_of_CKD") AS "cause_of_CKD",
    INITCAP(TRIM(dialysis)) AS dialysis,
    no_of_sessions,
    INITCAP(TRIM(stroke)) AS stroke,
    INITCAP(TRIM("DM")) AS "DM",
    INITCAP(TRIM(cancer)) AS cancer,
    TRIM(type_of_cancer) AS type_of_cancer,
    INITCAP(TRIM("PUD")) AS "PUD"
FROM admissions;



