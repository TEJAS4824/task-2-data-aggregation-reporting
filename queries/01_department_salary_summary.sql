-- Department Salary Summary Report

SELECT
    d.dept_name AS department,
    COUNT(DISTINCT e.emp_no) AS employees,
    ROUND(AVG(s.salary), 2) AS avg_salary,
    MIN(s.salary) AS min_salary,
    MAX(s.salary) AS max_salary,
    MAX(s.salary) - MIN(s.salary) AS salary_range
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN employees e ON de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE de.to_date > CURRENT_DATE
AND s.to_date > CURRENT_DATE
GROUP BY d.dept_name
ORDER BY avg_salary DESC;
