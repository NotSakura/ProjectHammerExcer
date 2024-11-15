SELECT 
    product.vendor,
    product.product_name,
    AVG(CAST(raw.current_price AS REAL)) AS average_price
FROM 
    product
JOIN 
    raw ON product.id = raw.product_id
WHERE 
    product.product_name = 'Leeks'
GROUP BY 
    product.vendor, product.product_name;
