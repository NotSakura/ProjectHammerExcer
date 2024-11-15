SELECT 
    product_name, 
    COUNT(*) AS product_count
FROM 
    product
GROUP BY 
    product_name
HAVING 
    COUNT(DISTINCT vendor) >= 4
ORDER BY 
    product_count DESC
LIMIT 10;