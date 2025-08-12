-- Oracle procedure in test folder
CREATE OR REPLACE PROCEDURE update_employee_salary(
    p_emp_id IN NUMBER,
    p_new_salary IN NUMBER
) IS
BEGIN
    UPDATE employees 
    SET salary = p_new_salary,
        last_updated = SYSDATE
    WHERE employee_id = p_emp_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee not found');
    END IF;
    
    COMMIT;
END update_employee_salary;
/
