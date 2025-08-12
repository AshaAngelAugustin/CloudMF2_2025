-- Test Oracle PL/SQL for batch processing
DECLARE
    v_count NUMBER := 0;
    v_name VARCHAR2(100);
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM employees 
    WHERE department_id = 10;
    
    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Department has employees');
    END IF;
    
    FOR emp_rec IN (SELECT employee_id, first_name 
                    FROM employees 
                    WHERE salary > 50000) LOOP
        v_name := emp_rec.first_name;
        UPDATE employees 
        SET last_login = SYSDATE 
        WHERE employee_id = emp_rec.employee_id;
    END LOOP;
    
    COMMIT;
END;
/
