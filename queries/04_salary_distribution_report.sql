-- Salary Distribution Report for Sales Department

SELECT
    d.dept_name,
    FLOOR(s.salary / 10000) * 10000 AS salary_bucket,
    COUNT(*) AS employees,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (PARTITION BY d.dept_name),
        1
    ) AS distribution_percent
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE s.to_date > CURRENT_DATE
AND d.dept_name = 'Sales'
GROUP BY d.dept_name, salary_bucket
ORDER BY salary_bucket;
