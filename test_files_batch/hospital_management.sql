-- Hospital Management System
CREATE PROCEDURE schedule_appointment
    @patient_id INT,
    @doctor_id INT,
    @appointment_date DATETIME,
    @appointment_type VARCHAR(50)
AS
BEGIN
    DECLARE @conflict_count INT;
    
    -- Check for scheduling conflicts
    SELECT @conflict_count = COUNT(*)
    FROM appointments
    WHERE doctor_id = @doctor_id
        AND appointment_date = @appointment_date
        AND status != 'CANCELLED';
    
    IF @conflict_count > 0
    BEGIN
        RAISERROR('Doctor already has an appointment at this time', 16, 1);
        RETURN;
    END
    
    -- Create the appointment
    INSERT INTO appointments (
        patient_id, doctor_id, appointment_date, 
        appointment_type, status, created_date
    ) VALUES (
        @patient_id, @doctor_id, @appointment_date,
        @appointment_type, 'SCHEDULED', GETDATE()
    );
    
    -- Update patient's last visit tracking
    UPDATE patients 
    SET last_appointment_date = @appointment_date
    WHERE patient_id = @patient_id;
    
    -- Send notification (placeholder)
    EXEC send_appointment_notification @patient_id, @appointment_date;
END
