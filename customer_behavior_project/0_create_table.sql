-- CREATE CUSTOMER TABLE IN SQL DATABASE 
CREATE TABLE customer_data (
  customer_id INT,
  customer_name VARCHAR,
  product_category TEXT,
  purchase_amount INT,
  delivery_status TEXT,
  payment_status TEXT,
  customer_age INT,
  customer_gender TEXT,
  product_rating INT,
  shipping_region VARCHAR,
  loyalty_status TEXT,
  country TEXT
);

-- seting the ownership of the data to postgress
ALTER TABLE public.customer_data  OWNER TO postgres;

-- loading the customer dataset from csv to the database.
\copy customer_data  FROM 'C:\Users\DELL\Desktop\Sql_projects_data\customer_behavior_project\clean_ecommerce_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')

 
SELECT * 
FROM customer_data
LIMIT 10;

