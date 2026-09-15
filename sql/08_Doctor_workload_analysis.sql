--Doctor workload
SELECT d.doctor,
    	d.doctor_id,
    	d.specialization,
		COUNT(a.admission_id) AS patient_volume,
		COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) AS dama_cases,
		ROUND(COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) * 100 / COUNT(a.admission_id),2) AS dama_rate,
		COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) AS mortality_cases,
		ROUND(COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) * 100.0 / COUNT(a.admission_id),2) AS mortality_rate
FROM doctor_table d
JOIN admission_table a ON d.doctor_id = a.doctor_id
GROUP BY
    d.doctor,
    d.doctor_id,
    d.specialization
ORDER BY patient_volume DESC;


--Admission workload across specialisation
SELECT d.specialization,
		COUNT(a.admission_id) AS total_admissions,
		ROUND(AVG(a.admission_duration),2) AS average_admission_duration,
		ROUND(COUNT(CASE WHEN a."DAMA" = 'Yes' THEN 1 END) * 100 / COUNT(a.admission_id),2) AS dama_rate,
		ROUND(COUNT(CASE WHEN a.dead = 'Yes' THEN 1 END) * 100.0 / COUNT(a.admission_id),2) AS mortality_rate
FROM doctor_table d
JOIN admission_table a ON d.doctor_id = a.doctor_id
GROUP BY d.specialization
ORDER BY total_admissions DESC;
