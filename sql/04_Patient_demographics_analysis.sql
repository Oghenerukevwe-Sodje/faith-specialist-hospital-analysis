-- Hospital outcome by age
SELECT
    CASE
        WHEN p.age < 18 THEN 'Under 18'
        WHEN p.age BETWEEN 18 AND 35 THEN 'Young Adults'
        WHEN p.age BETWEEN 36 AND 64 THEN 'Adults'
        WHEN p.age >= 65 THEN 'Elderly'
        ELSE 'Unknown'
    END AS age_group,
   		COUNT(a.admission_id) AS admission_count,
		COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) * 100 / COUNT(*),2) AS death_rate,
		COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) * 100 / COUNT(*),2) AS dama_rate				
FROM patient_table p
JOIN admission_table a ON p.pt_id = a.pt_id
GROUP BY age_group


--Hospital outcome by occupation
SELECT sex,
		COUNT(a.admission_id) AS admission_count,
		COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) * 100 / COUNT(*),2) AS death_rate,
		COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) * 100 / COUNT(*),2) AS dama_rate			
FROM patient_table p
JOIN admission_table a ON p.pt_id = a.pt_id
GROUP BY sex


--Hospital outcome by occupation
SELECT occupation,
		COUNT(a.admission_id) AS admission_count,
		COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) * 100 / COUNT(*),2) AS death_rate,
		COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) * 100 / COUNT(*),2) AS dama_rate			
FROM patient_table p
JOIN admission_table a ON p.pt_id = a.pt_id
GROUP BY occupation
ORDER BY  admission_count DESC
LIMIT 10

--Hospital outcome by marital_status
SELECT marital_status,
		COUNT(a.admission_id) AS admission_count,
		COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN a.dead= 'Yes' THEN 1 END) * 100 / COUNT(*),2) AS death_rate,
		COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN a."DAMA"='Yes' THEN 1 END) * 100 / COUNT(*),2) AS dama_rate			
FROM patient_table p
JOIN admission_table a ON p.pt_id = a.pt_id
GROUP BY marital_status
ORDER BY  admission_count DESC


