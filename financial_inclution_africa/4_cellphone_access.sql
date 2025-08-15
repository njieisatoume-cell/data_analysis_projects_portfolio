/*
CELLPHONE ACCESS AND FINANCIAL INCLUSION
QUESTION: HOW DOES CELLPHONE HAVING A CELLPHONE INCREASE FINANCIAL
INCLUSION??
*/

SELECT
    cellphone_access,
    ROUND(
        100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS bank_account_percentage,
    COUNT(*) AS total_owners
FROM financial_inclusion
GROUP BY cellphone_access
ORDER BY bank_account_percentage DESC;

-- END OF QUARY 