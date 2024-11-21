-- Description: This script selects the average price of a product from the raw table
-- by vendor and product name.

DECLARE @product_name VARCHAR(50);
SET @product_name = 'Leeks'; -- Set the variable to the desired product name

SELECT 
    product.vendor,
    product.product_name,
    AVG(CAST(raw.current_price AS REAL)) AS average_price
FROM 
    product
JOIN 
    raw ON product.id = raw.product_id
WHERE 
    product.product_name = @product_name
GROUP BY 
    product.vendor, product.product_name;