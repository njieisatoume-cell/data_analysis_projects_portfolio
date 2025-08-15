/*
GENDER GAP IN BANKING
QUESTION: FIND THE GENDER GAP IN BANK ACCOUNT OWNERSHIP ??
*/

WITH gender_state AS (

          SELECT
        country,
        gender_of_respondent,
        ROUND(
            100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS bank_account_percentage,
        COUNT(*) AS total_owners
    FROM financial_inclusion
    GROUP BY country, gender_of_respondent
    ORDER BY bank_account_percentage DESC

)
SELECT 
   country,
   MAX(CASE WHEN gender_of_respondent = 'Male' THEN bank_account_percentage END) AS male_percentage,
   MAX(CASE WHEN gender_of_respondent = 'Female' THEN bank_account_percentage END) AS female_percentage,
   ROUND(
        ABS(
          MAX(CASE WHEN gender_of_respondent = 'Male' THEN bank_account_percentage END ) -
          MAX(CASE WHEN gender_of_respondent = 'Female' THEN bank_account_percentage END)
    ),
    2
 
      ) AS gender_gap
FROM gender_state
GROUP BY country
ORDER BY gender_gap DESC;

-- END OF QUARY 