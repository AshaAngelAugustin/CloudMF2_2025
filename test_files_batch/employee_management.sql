-- Oracle Employee Management System
CREATE OR REPLACE PROCEDURE manage_employee(
    p_emp_id IN NUMBER,
    p_emp_name IN VARCHAR2,
    p_salary IN NUMBER,
    p_dept_id IN NUMBER
) IS
BEGIN
    UPDATE employees 
    SET emp_name = p_emp_name,
        salary = p_salary,
        department_id = p_dept_id,
        last_updated = SYSDATE
    WHERE employee_id = p_emp_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        INSERT INTO employees (employee_id, emp_name, salary, department_id, hire_date)
        VALUES (p_emp_id, p_emp_name, p_salary, p_dept_id, SYSDATE);
    END IF;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END manage_employee;
