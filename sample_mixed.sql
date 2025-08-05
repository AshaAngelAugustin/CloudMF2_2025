-- Sample Mixed SQL that will show various conversions
CREATE TABLE products (
    product_id INT IDENTITY(1,1),
    product_name VARCHAR(200),
    description VARCHAR2(500),
    price DECIMAL(8,2),
    created_date DATE DEFAULT SYSDATE,
    modified_date DATETIME DEFAULT GETDATE()
);

-- Mixed date functions that will be converted
INSERT INTO products (product_name, description, price, created_date, modified_date)
VALUES ('Laptop Computer', 'High performance laptop', 999.99, SYSDATE, GETDATE());

-- Query mixing different database syntax
SELECT TOP 10 product_name, price
FROM products 
WHERE created_date >= SYSDATE - 30
ORDER BY price DESC;

-- Update with mixed syntax
UPDATE products 
SET modified_date = GETDATE(),
    created_date = SYSDATE
WHERE price > 500;

-- Mixed data types
ALTER TABLE products 
ADD category VARCHAR2(100),
ADD stock_count NUMBER,
ADD is_active BIT DEFAULT 1;

-- Query with LIMIT (MySQL/PostgreSQL style)
SELECT product_name, price 
FROM products 
WHERE price BETWEEN 100 AND 1000
LIMIT 20;
