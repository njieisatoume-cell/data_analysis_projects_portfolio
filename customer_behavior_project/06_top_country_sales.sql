--  QUESTION 6: COUNTRIES WITH MOST SALES

-- Step 1: Get total sales per country & product
WITH country_product_sales AS (
    SELECT
        country,
        product_category,
        SUM(purchase_amount) AS total_sales,
        COUNT(*) AS total_orders
    FROM customer_data
    GROUP BY country, product_category
),

-- Step 2: Ranking products in each country by total sales
ranked_products AS (
    SELECT
        country,
        product_category,
        total_sales,
        total_orders,
        ROW_NUMBER() OVER (PARTITION BY country ORDER BY total_sales DESC) AS sales_rank
    FROM country_product_sales
),

-- Step 3: Rank countries by total sales (overall)
country_sales_rank AS (
    SELECT
        country,
        SUM(total_sales) AS country_total_sales,
        RANK() OVER (ORDER BY SUM(total_sales) DESC) AS country_rank
    FROM country_product_sales
    GROUP BY country
)

-- Step 4: Join both rankings to get top countries with their top product
SELECT
    csr.country,
    csr.country_total_sales,
    rp.product_category AS top_product,
    rp.total_sales AS product_sales
FROM country_sales_rank csr
JOIN ranked_products rp
    ON csr.country = rp.country AND rp.sales_rank = 1
WHERE csr.country_rank <= 5 -- Top 5 countries
ORDER BY csr.country_total_sales DESC;

-- END OF QUESTION 6