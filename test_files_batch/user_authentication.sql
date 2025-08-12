-- User Authentication System
CREATE PROCEDURE authenticate_user(
    p_username IN VARCHAR2,
    p_password IN VARCHAR2,
    p_result OUT NUMBER
) IS
    v_stored_password VARCHAR2(255);
    v_user_status VARCHAR2(20);
    v_login_attempts NUMBER;
BEGIN
    -- Get user details
    SELECT password, status, failed_login_attempts
    INTO v_stored_password, v_user_status, v_login_attempts
    FROM users
    WHERE username = p_username;
    
    -- Check if account is locked
    IF v_user_status = 'LOCKED' THEN
        p_result := -2;  -- Account locked
        RETURN;
    END IF;
    
    -- Verify password
    IF v_stored_password = UPPER(p_password) THEN
        -- Successful login
        UPDATE users 
        SET last_login = SYSDATE,
            failed_login_attempts = 0
        WHERE username = p_username;
        
        p_result := 1;  -- Success
    ELSE
        -- Failed login
        UPDATE users 
        SET failed_login_attempts = failed_login_attempts + 1
        WHERE username = p_username;
        
        IF v_login_attempts + 1 >= 3 THEN
            UPDATE users 
            SET status = 'LOCKED'
            WHERE username = p_username;
        END IF;
        
        p_result := 0;  -- Invalid credentials
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_result := -1;  -- User not found
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END authenticate_user;
