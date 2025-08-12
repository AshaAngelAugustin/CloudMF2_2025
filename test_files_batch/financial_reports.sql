-- Financial Report Generation
SELECT 
    d.department_name,
    COUNT(e.employee_id) as employee_count,
    AVG(e.salary) as avg_salary,
    SUM(e.salary) as total_salary,
    MAX(e.hire_date) as latest_hire
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE d.active_status = 'Y'
    AND e.hire_date >= '2020-01-01'
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 5
ORDER BY total_salary DESC;

-- Update department budgets
UPDATE departments 
SET budget = budget * 1.05,
    last_budget_review = GETDATE()
WHERE department_id IN (
    SELECT DISTINCT department_id 
    FROM employees 
    WHERE salary > 50000
);
