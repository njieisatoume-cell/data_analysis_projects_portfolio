/*
HOUSEHOLD SIZE PATTERNS 
QUESTION: COMPARE FINANCIAL ACCESS THROUGH SMALL, MEDIUM AND LARGE HOUSEHOLDS?? 
*/

WITH household_group AS (
  SELECT *,
    CASE
         WHEN household_size <= 2 THEN 'small_family (1-2)'
         WHEN household_size BETWEEN 3 AND 5 THEN 'medium_family (3-5)'
         ELSE 'large_family (6+)'
         END AS family_category
  FROM financial_inclusion       
)

SELECT
   family_category,
   ROUND(
        100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS bank_account_percentage,
    COUNT(*) AS total_owners
FROM household_group
GROUP BY family_category
ORDER BY bank_account_percentage DESC;

-- END OF QUARY 