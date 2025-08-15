/*
3. REGIONAL SALES INSIGHTS 
QUESTION: FIND BEST SELLING PRODUCT FOR EACH REGION
*/

WITH region_sales AS (
  SELECT 
      shipping_region,
      product_category,
      SUM(purchase_amount) AS total_sales
  FROM
      customer_data
  GROUP BY
    shipping_region,
    product_category        

),
 rank_sales AS (
    SELECT
     *,
     ROW_NUMBER () OVER (PARTITION BY shipping_region ORDER BY total_sales DESC) as rn
    FROM
       region_sales
 )
 -- main quary
SELECT
   shipping_region,
   product_category AS top_product,
   total_sales
FROM
  rank_sales
WHERE rn = 1
ORDER BY
 total_sales DESC;
-- END QUESTION 3

