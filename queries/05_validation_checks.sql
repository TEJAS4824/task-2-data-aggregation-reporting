-- Validation & Quality Checks

-- Total active employees
SELECT COUNT(DISTINCT emp_no)
FROM salaries
WHERE to_date > CURRENT_DATE;

-- Check for null department assignments
SELECT COUNT(*)
FROM dept_emp
WHERE dept_no IS NULL;
