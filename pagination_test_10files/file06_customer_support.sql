-- File 6: Customer Support System
CREATE PROCEDURE create_support_ticket(
    @customer_id INT,
    @subject VARCHAR(200),
    @description TEXT
) AS
BEGIN
    INSERT INTO support_tickets (customer_id, subject, description, created_date, status)
    VALUES (@customer_id, @subject, @description, GETDATE(), 'OPEN');
    
    -- Send notification email
    EXEC send_notification_email @customer_id, 'Support ticket created';
END
