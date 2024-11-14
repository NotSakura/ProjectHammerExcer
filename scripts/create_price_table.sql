CREATE TABLE product_price AS
SELECT 
    product.id AS product_id,
    product.vendor,
    raw.old_price,
    raw.current_price
FROM 
    product
JOIN 
    raw ON product.id = raw.product_id;
