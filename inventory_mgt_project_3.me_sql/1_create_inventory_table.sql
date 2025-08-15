/*
This project is aim to analyze inventory systems
to know understand logistics, cost and efficiency.
*/;

CREATE TABLE inventory_dataset(
  product_id VARCHAR,
  product_name TEXT,
  category TEXT,
  stuck_quantity INT,
  recoder_level INT,
  supplier TEXT,
  unit_cost NUMERIC,
  last_order_date DATE,
  region TEXT

);

SELECT *
FROM inventory_dataset
LIMIT 20;

-- set the ownership of the inventory table.
ALTER TABLE public.inventory_dataset OWNER TO postgres;

-- loading the dataset from csv to the database.
\copy inventory_dataset FROM 'C:\Users\DELL\Desktop\Sql_projects_data\project_3.me_sql\inventory_data.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- end of quaries 

