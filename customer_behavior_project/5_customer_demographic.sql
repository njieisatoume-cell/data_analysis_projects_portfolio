/*
5. CUSTOMER DEMGRAPIC IMPACT
QUESTION: SPENDING BY GENDER AND AGE GROUP 
*/
WITH age_grouped AS (
  SELECT *,
      CASE 
          WHEN customer_age < 25 THEN '18-24'
          WHEN customer_age BETWEEN 25 AND 34 THEN '25-34'
          WHEN customer_age BETWEEN 35 AND 44 THEN '35-44'
          WHEN customer_age BETWEEN 45 AND 54 THEN '45-54'
          ELSE '55+'
      END AS age_group 
  FROM 
   customer_data
)
-- main quary 
SELECT
 age_group,
 customer_gender,
 ROUND(AVG(purchase_amount),2) AS avg_pruchase,
 SUM(purchase_amount) AS total_purchase
FROM age_grouped
GROUP BY
  age_group,
  customer_gender
ORDER BY
 avg_pruchase DESC;
  --age_group,
  --customer_gender DESC;

-- END OF QUESTION 5

---

        