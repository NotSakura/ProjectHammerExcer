CREATE TABLE raw_may_2024 AS
SELECT *
FROM raw
WHERE nowtime BETWEEN '2024-05-01 00:00:00' AND '2024-05-31 23:59:59';

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
