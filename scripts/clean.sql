UPDATE raw 
SET current_price = REPLACE(REPLACE(current_price, '$', ''), ',', ''),
    old_price = REPLACE(REPLACE(old_price, '$', ''), ',', ''),
    price_per_unit = REPLACE(REPLACE(price_per_unit, '$', ''), ',', '');

-- ALTER TABLE raw
-- ADD COLUMN current_price_numeric REAL GENERATED ALWAYS AS (CAST(current_price AS REAL)),
-- ADD COLUMN old_price_numeric REAL GENERATED ALWAYS AS (CAST(old_price AS REAL)),
-- ADD COLUMN price_per_unit_numeric REAL GENERATED ALWAYS AS (CAST(price_per_unit AS REAL));
