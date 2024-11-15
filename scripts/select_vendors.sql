SELECT 
    p.product_name,
    COUNT(DISTINCT p.vendor) AS unique_vendor_count
FROM 
    comb_pd p
GROUP BY 
    p.product_name
HAVING 
    COUNT(DISTINCT p.vendor) > 2
ORDER BY 
    unique_vendor_count DESC
LIMIT 10;
