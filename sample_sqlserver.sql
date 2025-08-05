-- Sample SQL Server SQL that will show conversions to other databases
CREATE TABLE employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    hire_date DATETIME DEFAULT GETDATE(),
    salary DECIMAL(10,2),
    department_id INT
);

-- Insert sample data
INSERT INTO employees (name, email, hire_date, salary, department_id) 
VALUES ('John Doe', 'john.doe@company.com', GETDATE(), 50000.00, 1);

INSERT INTO employees (name, email, hire_date, salary, department_id) 
VALUES ('Jane Smith', 'jane.smith@company.com', GETDATE(), 60000.00, 2);

-- Query with SQL Server TOP syntax
SELECT TOP 5 * 
FROM employees 
WHERE salary > 40000 
ORDER BY hire_date DESC;

-- Update using SQL Server date function
UPDATE employees 
SET hire_date = GETDATE() 
WHERE department_id = 1;

-- SQL Server specific syntax
SELECT name, email, 
       DATEADD(year, 1, hire_date) as anniversary_date
FROM employees
WHERE hire_date >= GETDATE();

-- Use IDENTITY for auto-increment
INSERT INTO employees (name, email, salary) 
VALUES ('Bob Wilson', 'bob@company.com', 55000);
