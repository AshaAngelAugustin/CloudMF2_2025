-- File 9: Security and Audit
CREATE PROCEDURE log_user_activity(
    p_user_id IN NUMBER,
    p_action IN VARCHAR2,
    p_details IN VARCHAR2
) IS
BEGIN
    INSERT INTO audit_log (
        user_id, action, details, 
        ip_address, timestamp
    ) VALUES (
        p_user_id, p_action, p_details,
        SYS_CONTEXT('USERENV', 'IP_ADDRESS'), SYSDATE
    );
    
    -- Check for suspicious activity
    IF p_action = 'LOGIN_FAILED' THEN
        CALL check_security_threats(p_user_id);
    END IF;
END;
