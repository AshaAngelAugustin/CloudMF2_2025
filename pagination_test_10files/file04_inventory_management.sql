-- File 4: Inventory Management
CREATE PROCEDURE check_stock_levels(
    @warehouse_id INT
) AS
BEGIN
    SELECT product_id, product_name, current_stock, minimum_stock
    FROM inventory i
    JOIN products p ON i.product_id = p.product_id
    WHERE warehouse_id = @warehouse_id
    AND current_stock <= minimum_stock;
END
