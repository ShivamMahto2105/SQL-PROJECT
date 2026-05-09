-- Which 5 Products generate the highest revenue
SELECT TOP 5
p.product_name,
SUM(s.sales_amount) total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

SELECT 
* 
FROM (
SELECT 
p.product_name,
SUM(s.sales_amount) total_revenue,
ROW_NUMBER() OVER (ORDER BY SUM(s.sales_amount) DESC) rank_product
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
) t
WHERE rank_product <= 5

-- What are 5 Worst-performing products in terms of sales
SELECT TOP 5
p.product_name,
SUM(s.sales_amount) total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC

-- Find the top 10 Customers who have generated the highest revenue
SELECT 
* 
FROM (
SELECT 
c.customer_key,
c.first_name,
c.last_name,
SUM(s.sales_amount) total_revenue,
ROW_NUMBER() OVER (ORDER BY SUM(s.sales_amount) DESC) rank_customer
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
ON s.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
) t
WHERE rank_customer <= 10

-- The 3 Customers with the few orders placed
SELECT 
* 
FROM (
SELECT 
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT s.order_number) total_order,
ROW_NUMBER() OVER (ORDER BY COUNT(DISTINCT s.order_number) ASC) rank_customer
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
ON s.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
) t
WHERE rank_customer <= 3


SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT s.order_number) total_order
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
ON s.customer_key = c.customer_key
GROUP BY c.customer_key, c.first_name, c.last_name
ORDER BY total_order ASC