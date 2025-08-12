-- Sybase Product Inventory System
CREATE PROCEDURE update_inventory
    @product_id INTEGER,
    @quantity_change INTEGER,
    @transaction_type VARCHAR(20)
AS
BEGIN
    DECLARE @current_stock INTEGER
    DECLARE @new_stock INTEGER
    
    SELECT @current_stock = stock_quantity 
    FROM inventory 
    WHERE product_id = @product_id
    
    SET @new_stock = @current_stock + @quantity_change
    
    IF @new_stock < 0
    BEGIN
        RAISERROR('Insufficient stock for product %d', 16, 1, @product_id)
        RETURN
    END
    
    UPDATE inventory 
    SET stock_quantity = @new_stock,
        last_updated = GETDATE()
    WHERE product_id = @product_id
    
    INSERT INTO inventory_log (product_id, old_quantity, new_quantity, change_amount, transaction_type)
    VALUES (@product_id, @current_stock, @new_stock, @quantity_change, @transaction_type)
END
