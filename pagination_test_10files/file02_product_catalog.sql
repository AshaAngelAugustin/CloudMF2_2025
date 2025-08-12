-- File 2: Product Catalog Management
CREATE PROCEDURE update_product_price(
    @product_id INT,
    @new_price DECIMAL(10,2)
) AS
BEGIN
    UPDATE products 
    SET price = @new_price, 
        updated_date = GETDATE()
    WHERE product_id = @product_id;
END
