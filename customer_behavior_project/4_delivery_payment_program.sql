/*
 4.DELIVERY AND PAYMENT PERFORMANCE
QUESTION: % OF PENDING PAYMENTS WITH DELAYED DELIVERIES
*/

WITH pending_data AS (
  SELECT 
    COUNT(*) AS total_pending,
    COUNT(CASE WHEN delivery_status = 'Delayed' THEN 1 END) AS delayed_pending
  FROM 
    customer_data
  WHERE 
      payment_status = 'pending'

)
SELECT
  delayed_pending,
  total_pending,
  ROUND((delayed_pending::NUMERIC / total_pending) * 100 ,2) AS percentage_delayed
FROM
  pending_data;  
-- END OF QUESTION 4

