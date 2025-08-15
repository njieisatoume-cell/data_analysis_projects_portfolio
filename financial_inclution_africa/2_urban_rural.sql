-- UBBAN VS RURAL FINANCIAL ACCESS
-- QUESTION: what is the percentage of bank account holders in urban vs rural areas in each country?? 

SELECT
    country,
    location_type,
    ROUND(
        100.0 * SUM(CASE WHEN bank_account = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS bank_account_percentage,
    COUNT(*) AS total_owners
FROM financial_inclusion
GROUP BY country, location_type
ORDER BY country, bank_account_percentage DESC;
-- END OF QUARY;
