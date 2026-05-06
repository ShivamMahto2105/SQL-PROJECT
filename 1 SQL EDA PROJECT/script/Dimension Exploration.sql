-- Explore All the Countries our Customers Come From
SELECT DISTINCT country FROM gold.dim_customers

-- Explore All The Categories "The Major Division"
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1, 2, 3