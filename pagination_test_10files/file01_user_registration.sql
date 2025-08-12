-- File 1: User Registration System
CREATE PROCEDURE register_user(
    p_username IN VARCHAR2,
    p_email IN VARCHAR2,
    p_password IN VARCHAR2
) IS
BEGIN
    INSERT INTO users (username, email, password, created_date)
    VALUES (p_username, p_email, p_password, SYSDATE);
    COMMIT;
END;
