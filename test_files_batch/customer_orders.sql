-- SQL Server Customer Data Procedures
CREATE PROCEDURE ProcessCustomerOrder
    @customer_id INT,
    @order_amount MONEY,
    @order_date DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;
    
    IF @order_date IS NULL
        SET @order_date = GETDATE();
    
    BEGIN TRANSACTION;
    
    INSERT INTO orders (customer_id, order_amount, order_date, status)
    VALUES (@customer_id, @order_amount, @order_date, 'PENDING');
    
    UPDATE customers 
    SET total_orders = total_orders + 1,
        last_order_date = @order_date
    WHERE customer_id = @customer_id;
    
    COMMIT TRANSACTION;
END
