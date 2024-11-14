-- Create a new table with average monthly prices for each vendor for product_name = "Garlic"
CREATE TABLE garlic AS
SELECT 
    vendor,
    strftime('%Y-%m', nowtime) AS month,
    AVG(current_price) AS avg_price
FROM 
    comb_pd
WHERE 
    product_name = 'Garlic'
GROUP BY 
    vendor, month
ORDER BY 
    vendor, month;
