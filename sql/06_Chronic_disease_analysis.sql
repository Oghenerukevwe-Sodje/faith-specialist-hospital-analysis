--Most prevalent Chronic diseases that have the highest mortality and DAMA rates and are associated with longer hospital stays
SELECT chronic_disease,
		COUNT(*) AS total_cases,
		COUNT(CASE WHEN dead = 'Yes' THEN 1 END) AS death_count,
		ROUND(COUNT(CASE WHEN dead = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS mortality_rate,
		COUNT(CASE WHEN "DAMA" = 'Yes' THEN 1 END) AS dama_count,
		ROUND(COUNT(CASE WHEN "DAMA" = 'Yes' THEN 1 END) * 100/ COUNT(*), 2) AS dama_rate,
		ROUND(AVG(admission_duration), 2) AS average_los
FROM (

    SELECT 'CKD' AS chronic_disease,
           dead,
           "DAMA",
           admission_duration
    FROM admission_table
    WHERE "CKD" = 'Yes'

    UNION ALL

    SELECT 'Stroke',
           dead,
           "DAMA",
           admission_duration
    FROM admission_table
    WHERE stroke = 'Yes'

    UNION ALL

    SELECT 'Diabetes',
           dead,
           "DAMA",
           admission_duration
    FROM admission_table
    WHERE "DM" = 'Yes'

    UNION ALL

    SELECT 'Cancer',
           dead,
           "DAMA",
           admission_duration
    FROM admission_table
    WHERE cancer = 'Yes'

    UNION ALL

    SELECT 'PUD',
           dead,
           "DAMA",
           admission_duration
    FROM admission_table
    WHERE "PUD" = 'Yes'
) AS chronic_diseases
GROUP BY chronic_disease
ORDER BY total_cases DESC;




