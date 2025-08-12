-- File 5: Payment Processing
CREATE PROCEDURE process_payment(
    p_order_id IN NUMBER,
    p_payment_method IN VARCHAR2,
    p_amount IN NUMBER
) IS
BEGIN
    INSERT INTO payments (order_id, payment_method, amount, payment_date)
    VALUES (p_order_id, p_payment_method, p_amount, SYSDATE);
    
    UPDATE orders 
    SET status = 'PAID'
    WHERE order_id = p_order_id;
END;
