--Reasons for Discharge against medical advice (DAMA)
SELECT "reason_for_DAMA",
		COUNT(*) AS no_of_dama,
		ROUND(COUNT(*) * 100/SUM(COUNT(*)) OVER (),2) AS percentage_of_dama
FROM admission_table
WHERE "DAMA" = 'Yes' AND "reason_for_DAMA" IS NOT NULL
GROUP BY "reason_for_DAMA"
ORDER BY no_of_dama DESC;

--Total number of DAMA
SELECT COUNT(*) AS total_admissions,
		SUM(CASE
				WHEN "DAMA" = 'Yes' THEN 1 
				ELSE 0 
				END) AS dama_cases
FROM admission_table;


