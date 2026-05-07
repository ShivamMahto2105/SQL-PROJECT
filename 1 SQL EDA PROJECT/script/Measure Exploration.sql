-- Find the Total Sales
SELECT 
SUM(sales_amount) AS total_sales
FROM gold.fact_sales

-- Find how many items are sold
SELECT 
SUM(quantity) AS total_items
FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) AS avg_selling_price FROM gold.fact_sales

-- Find the total number of orders
SELECT COUNT(DISTINCT(order_number)) AS total_orders FROM gold.fact_sales
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales

-- Find the total number of products 
SELECT COUNT(product_key) AS total_products FROM gold.dim_products
SELECT COUNT( DISTINCT product_key) AS total_products FROM gold.dim_products

SELECT COUNT(product_name) AS total_products FROM gold.dim_products
SELECT COUNT( DISTINCT product_name) AS total_products FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) AS total_customers FROM gold.dim_customers

-- Find the total numbers of customers that has placed an order 
SELECT * FROM gold.dim_customers
SELECT * FROM gold.fact_sales

SELECT 
COUNT(DISTINCT c.customer_key) AS total_customers
FROM gold.dim_customers AS c
LEFT JOIN gold.fact_sales AS s 
ON c.customer_key = s.customer_key
WHERE s.customer_key IS NOT NULL 

-- AND 
SELECT COUNT(DISTINCT customer_key) AS total_customers FROM gold.fact_sales

-- Generate a Report that shows all key metrices of the business 
SELECT 'Total_Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION
SELECT 'Total_Items' AS measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION
SELECT 'Avg_Selling_Price' AS measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION
SELECT 'Total_Orders' AS measure_name, COUNT(DISTINCT(order_number)) AS measure_value FROM gold.fact_sales
UNION
SELECT 'Total_Orders' AS measure_name, COUNT(order_number) AS measure_value FROM gold.fact_sales
UNION
SELECT 'Total_Products' AS measure_name, COUNT( DISTINCT product_name) AS measure_value FROM gold.dim_products
UNION
SELECT 'Total_Customers' AS measure_name, COUNT(customer_key) AS measure_value FROM gold.dim_customers
UNION
SELECT 'Total_Customers' AS measure_name, COUNT(DISTINCT customer_key) AS measure_value FROM gold.fact_sales
