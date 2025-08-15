/*
BANKING ACCESS BY COUNTRY
QUESTION: Which country has the hiest percentage of banking access ??
The analyisis are as follows:
*/

SELECT
    country,
    ROUND(
        100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS bank_account_percentage
FROM financial_inclusion
GROUP BY country
ORDER BY bank_account_percentage DESC;

--