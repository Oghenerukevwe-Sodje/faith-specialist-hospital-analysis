--Impact of alcohol history on hospital outcome
SELECT 'Alcohol' AS risk_factor,
		COUNT(*) AS total_patients,
		COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) AS ckd_cases,
		ROUND(COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS ckd_prevalence_rate,
		COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) AS stroke_cases,
		ROUND(COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS stroke_prevalence_rate,
		COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) AS cancer_cases,
		ROUND(COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS cancer_prevalence_rate,
		COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) AS diabetes_cases,
		ROUND(COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS diabetes_prevalence_rate,
		COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) AS pud_cases,
		ROUND(COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS pud_prevalence_rate,
		COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS mortality_rate,
		COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS dama_rate
FROM admission_table a
JOIN risk_factor_table r ON a.pt_id = r.pt_id
WHERE r.alcohol_hx = 'Yes';


--Impact of tobacco on hospital outcomes
SELECT 'tobacco' AS risk_factor,
		COUNT(*) AS total_patients,
		COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) AS ckd_cases,
		ROUND(COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS ckd_prevalence_rate,
		COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) AS stroke_cases,
		ROUND(COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS stroke_prevalence_rate,
		COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) AS cancer_cases,
		ROUND(COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS cancer_prevalence_rate,
		COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) AS diabetes_cases,
		ROUND(COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS diabetes_prevalence_rate,
		COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) AS pud_cases,
		ROUND(COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS pud_prevalence_rate,
		COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS mortality_rate,
		COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS dama_rate
FROM admission_table a
JOIN risk_factor_table r ON a.pt_id = r.pt_id
WHERE r.tobacco_hx = 'Yes';


--Impact of NSAID use on hospital outcome
SELECT 'NSAID_use' AS risk_factor,
		COUNT(*) AS total_patients,
		COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) AS ckd_cases,
		ROUND(COUNT(CASE WHEN a."CKD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS ckd_prevalence_rate,
		COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) AS stroke_cases,
		ROUND(COUNT(CASE WHEN a.stroke = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS stroke_prevalence_rate,
		COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) AS cancer_cases,
		ROUND(COUNT(CASE WHEN a.cancer = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS cancer_prevalence_rate,
		COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) AS diabetes_cases,
		ROUND(COUNT(CASE WHEN a."DM" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS diabetes_prevalence_rate,
		COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) AS pud_cases,
		ROUND(COUNT(CASE WHEN a."PUD" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS pud_prevalence_rate,
		COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS mortality_rate,
		COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS dama_rate
FROM admission_table a
JOIN risk_factor_table r ON a.pt_id = r.pt_id
WHERE r."NSAID_use" = 'Yes';




