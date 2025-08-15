/*
This part of the project will be answering all 
the questions that need to know form the dataset to help us 
find patterns,trends and usful insights form the  .
*/

-- Question_1: which products are below their recoder level.
SELECT
  product_name,
  recoder_level,
  stuck_quantity
FROM
   inventory_dataset
WHERE
   stuck_quantity < recoder_level

ORDER BY
    recoder_level - stuck_quantity DESC
LIMIT 20;           

-- QUESTION_2: which supplier provieds most products?
SELECT
  supplier,
  COUNT(*) AS number_of_products
FROM
   inventory_dataset
GROUP BY
    supplier
ORDER BY
    number_of_products DESC;


-- QUESTION_3: what is the total inventory values per category?
SELECT
   category,
  ROUND(SUM(unit_cost * stuck_quantity),2 )AS total_value_cost
FROM
   inventory_dataset
GROUP BY
   category
ORDER BY
   total_value_cost DESC          
           
-- QUESTION_4: which product haven't been restuck recently?
SELECT
   product_name,
   MAX(last_order_date) AS last_stucked
FROM
  inventory_dataset  
GROUP BY
   product_name
ORDER BY
   last_stucked ASC;

-- QUESTION_5: what is the inventory value per region?
SELECT
  region,
  ROUND(SUM(unit_cost * stuck_quantity),2) AS regional_value
FROM 
   inventory_dataset
GROUP BY
   region
ORDER BY
   regional_value DESC;

-- QUESTION_6: which items are at a risk of stuckout?
SELECT
  product_name,
  recoder_level,
  stuck_quantity
FROM
   inventory_dataset
WHERE
    stuck_quantity <= 5
ORDER BY
    stuck_quantity ASC;
       
-- QUESTION_7: which category consumes most capital?
SELECT
   category,
   ROUND(SUM(unit_cost * stuck_quantity),1) AS calpital_consume
FROM
  inventory_dataset
GROUP BY
    category
ORDER BY
   calpital_consume  DESC;   
--