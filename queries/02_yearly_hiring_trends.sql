-- Yearly Hiring Trends with Year-over-Year Growth

SELECT
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*) AS new_hires,
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY EXTRACT(YEAR FROM hire_date)) AS yoy_change,
    ROUND(
        100.0 *
        (COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY EXTRACT(YEAR FROM hire_date)))
        / NULLIF(LAG(COUNT(*)) OVER (ORDER BY EXTRACT(YEAR FROM hire_date)), 0),
        1
    ) AS growth_rate_percent
FROM employees
GROUP BY hire_year
HAVING hire_year BETWEEN 1985 AND 1995
ORDER BY hire_year;
