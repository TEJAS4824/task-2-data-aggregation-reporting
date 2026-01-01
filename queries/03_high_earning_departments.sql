-- High Earning Departments Report

SELECT
    d.dept_name,
    ROUND(AVG(s.salary)) AS avg_salary,
    COUNT(*) AS employees
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date > CURRENT_DATE
GROUP BY d.dept_name
HAVING AVG(s.salary) > 70000
AND COUNT(*) > 10000
ORDER BY avg_salary DESC;
