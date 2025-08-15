
/*
2. LOYALTY PROGRAM EFFECTIVENESS 
QUESTION: COMPARE SPENDING BETWEEN LOYALTY TIERS
*/

SELECT
   loyalty_status,
   ROUND(AVG(purchase_amount),1) AS avg_pruchase,
   SUM(purchase_amount) AS total_purchase,
   COUNT(DISTINCT customer_id) AS unique_customers
FROM
  customer_data
GROUP BY
  loyalty_status
ORDER BY
  avg_pruchase DESC
LIMIT 10;        
-- END OF QUESTION 2
