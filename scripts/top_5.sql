SELECT 
    product_name, 
    COUNT(*) AS product_count
FROM 
    product
GROUP BY 
    product_name
ORDER BY 
    product_count DESC
LIMIT 10;



-- Basil|13
-- Blueberries|12
-- Leeks|7
-- Garlic|7
-- Beef Burgers|7