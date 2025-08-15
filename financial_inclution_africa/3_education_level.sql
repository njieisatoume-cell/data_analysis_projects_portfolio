/*
EDUCATION LEVEL IMPACT 
QUESTION: DOES HIGHER EDUCATION LEVEL CORRELATES WITH MORE BANK ACCOUNT
OWNERSHIP
*/

SELECT
    education_level,
    ROUND(
        100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS bank_account_percentage,
    COUNT(*) AS total_owners
FROM financial_inclusion
GROUP BY education_level
ORDER BY bank_account_percentage DESC;
-- END OF QUARY;