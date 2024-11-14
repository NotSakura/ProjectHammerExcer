-- Create a new table for analysis, joining product and raw tables and filtering for month 05
CREATE TABLE comb_pd AS
SELECT 
    r.nowtime,
    r.current_price,
    p.product_name,
    p.vendor,
    p.units,
    p.brand
FROM 
    raw r
JOIN 
    product p ON r.product_id = p.id;
