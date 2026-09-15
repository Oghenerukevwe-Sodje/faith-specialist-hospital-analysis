--Create PATIENT table
CREATE TABLE patients(
		pt_id INTEGER PRIMARY KEY,
		Name VARCHAR(100),
		Age INTEGER,
		Sex VARCHAR(2),
		Occupation VARCHAR(100),
		Level_of_education VARCHAR(50),
		Marital_status VARCHAR(50)

);

SELECT*
FROM patients

--Create risk factors table
CREATE TABLE risk_factors(
		pt_id INTEGER REFERENCES patients(pt_id),
		Alcohol_Hx VARCHAR(10),
		Tobacco_Hx VARCHAR(10),
		NSAID_Use VARCHAR(10)
);

SELECT*
FROM risk_factors

ALTER TABLE risk_factors
RENAME COLUMN NSAID_Use TO "NSAID_use";


--Creating Doctors table
CREATE TABLE doctors(
			doctor_id VARCHAR(50) PRIMARY KEY,
			doctor VARCHAR(50),
			gender VARCHAR(10),
			email VARCHAR(100),
			specialization VARCHAR(100)
);

SELECT*
FROM doctors

--Creating admissions table
CREATE TABLE admissions(
			pt_id INTEGER REFERENCES patients(pt_id),
			admission_id INTEGER PRIMARY KEY,
			admission_duration INTEGER,
			doctor_id VARCHAR(50) REFERENCES doctors(doctor_id),
			DAMA VARCHAR(10),
			reason_for_DAMA VARCHAR(50),
			dead VARCHAR(50),
			cause_of_death VARCHAR(50),
			"CKD" VARCHAR(50),
			cause_of_CKD VARCHAR(50),
			dialysis VARCHAR(50),
			no_of_sessions VARCHAR(50),
			stroke VARCHAR(50),
			DM VARCHAR(50),
			cancer VARCHAR(50),
			type_of_cancer VARCHAR(50),
			"PUD" VARCHAR(50)
);

ALTER TABLE admissions
ALTER COLUMN no_of_sessions TYPE INTEGER
USING no_of_sessions::INTEGER

SELECT*
FROM admissions

ALTER TABLE admissions
RENAME COLUMN dama TO "DAMA";


ALTER TABLE admissions
RENAME COLUMN cause_of_ckd TO "cause_of_CKD";

ALTER TABLE admissions
RENAME COLUMN dm TO "DM";


