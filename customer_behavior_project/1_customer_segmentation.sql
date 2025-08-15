/*
The following quaries are written to extract insights form customer behavioral 
patterns so that better business decisions will be made,and they are as follow
*/

/*
1. CUSTOMER SEGMENTATION AND VALUE ANALYSIS
 QUESTION: FIND THE TOP 10 CUSTOMERS BY TOTAL SPEND AND THE THEIR MOST PURCHASE PRODUCT CATEGORY?
*/

WITH customer_spend AS (
-- Total spend 
  SELECT
      customer_id,
      customer_name,
      SUM(purchase_amount) AS total_spend
  FROM
    customer_data
  GROUP BY 
     customer_id,
     customer_name      
),

 top_customers AS(
 -- top 10 customers by rank  
  SELECT
    *,
    RANK() OVER (ORDER BY total_spend DESC) AS rank_position
  FROM
     customer_spend  
)
-- main quary
SELECT
  tc.customer_id,
  tc.customer_name,
  tc.total_spend,
  sub_quary.product_count,
  sub_quary.product_category
FROM top_customers AS tc
JOIN (
 -- finding most purchase product category, using subquary 
  SELECT
      customer_id,
      product_category,
      count(*) AS product_count,
      ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY count(*) DESC) AS RowN
  FROM
    customer_data
  GROUP BY
    customer_id,
    product_category      
) sub_quary
ON tc.customer_id = sub_quary.customer_id AND sub_quary.RowN = 1
WHERE rank_position <= 10
ORDER BY total_spend DESC;

-- END OF QUESTION 1
SELECT *
FROM customer_data
LIMIT 10;
-- END OF QUESTION 5 

