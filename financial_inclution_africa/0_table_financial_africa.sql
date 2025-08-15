/*
The following is financial inclusion analysis project, which is design to 
analyze financial inclution patterns across african countries to understand 
what factors influence access to financial services and many more.
The analysis are as follows:
*/

-- Create Table for the dataset
DROP TABLE IF EXISTS financial_inclusion;
CREATE TABLE financial_inclusion (
    country TEXT,
    year INT,
    uniqueid TEXT,
    bank_account TEXT,
    location_type TEXT,
    cellphone_access TEXT,
    household_size INT,
    age_of_respondent INT,
    gender_of_respondent TEXT,
    relationship_with_head TEXT,
    marital_status TEXT,
    education_level TEXT,
    job_type TEXT
    
);

-- set the ownership of the dataset
ALTER TABLE public.financial_inclusion OWNER TO postgres;

-- loading the dataset into the database table 
\copy financial_inclusion FROM 'C:\Users\DELL\Desktop\Sql_projects_data\financial_inclution_africa\financial_inclusion.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT *
FROM
  financial_inclusion;
  
-- End QUARY
