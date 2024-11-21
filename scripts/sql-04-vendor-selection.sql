-- Desc: This script is used to find the top 10 products that have more than 2 unique vendors.
-- This script was used by us to determine what products we should focus on to increase our vendor base.

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


-- Description: This script selects the top 10 products that have more than 4 unique vendors.   
-- Again, this script was used by us to determine what products we should focus on to increase our vendor base.

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
