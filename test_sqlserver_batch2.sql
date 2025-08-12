-- Another test file for SQL Server conversion
CREATE PROCEDURE GetEmployeeInfo
    @DeptID INT,
    @MinSalary DECIMAL(10,2) = 0
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT 
        employee_id,
        CONCAT(first_name, ' ', last_name) AS full_name,
        salary,
        hire_date
    FROM employees 
    WHERE department_id = @DeptID
    AND salary >= @MinSalary
    ORDER BY salary DESC;
    
    -- Return count
    SELECT @@ROWCOUNT AS total_employees;
END
