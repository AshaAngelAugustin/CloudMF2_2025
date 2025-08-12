-- File 10: Database Maintenance
CREATE PROCEDURE cleanup_old_data(
    @days_to_keep INT = 90
) AS
BEGIN
    DECLARE @cutoff_date DATETIME;
    SET @cutoff_date = DATEADD(DAY, -@days_to_keep, GETDATE());
    
    -- Archive old orders
    INSERT INTO archived_orders 
    SELECT * FROM orders 
    WHERE order_date < @cutoff_date;
    
    -- Delete old temporary data
    DELETE FROM temp_sessions 
    WHERE created_date < @cutoff_date;
    
    -- Update statistics
    UPDATE STATISTICS orders;
    UPDATE STATISTICS customers;
END
