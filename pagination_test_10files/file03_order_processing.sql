-- File 3: Order Processing System
CREATE PROCEDURE process_order(
    p_customer_id IN NUMBER,
    p_total_amount IN NUMBER
) IS
BEGIN
    INSERT INTO orders (customer_id, total_amount, order_date, status)
    VALUES (p_customer_id, p_total_amount, SYSDATE, 'PENDING');
    
    UPDATE customers 
    SET last_order_date = SYSDATE
    WHERE customer_id = p_customer_id;
END;
