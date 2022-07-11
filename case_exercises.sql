-- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
USE employees;
SELECT emp_no,dept_no,from_date, to_date,
CASE 
	When to_date > now() THEN TRUE
    ELSE False
END AS 'is_current_employee'
FROM dept_emp;

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT last_name,
CASE 
	WHEN substr(last_name,1,1) BETWEEN 'A' AND 'H' THEN 'A-H'
    WHEN substr(last_name,1,1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
    WHEN substr(last_name,1,1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
    END AS 'alpha_group'
FROM employees
GROUP BY alpha_group;

-- 3. How many employees (current or previous) were born in each decade?
SELECT birth_date, 
COUNT (),
CASE
	WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN 'Born in 50s'
	WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN 'Born in 60s'
    WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' THEN 'Born in 70s'
END AS birth_decade
FROM employees
GROUP BY birth_decade;

-- 4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT ROUND(AVG(salary),2),
CASE 
	WHEN dept_name IN ('Research' ,'Development') THEN 'R&D'
	WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
	WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
	WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
	ELSE 'Customer Service'
END AS dept_group
 FROM departments
 JOIN dept_emp USING(dept_no)
 JOIN salaries USING(emp_no)
	WHERE salaries.to_date > NOW()
 GROUP BY dept_group;
    