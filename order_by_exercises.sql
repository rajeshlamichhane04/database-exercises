USE employees;
SHOW tables;
-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and 
-- order your results returned by first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY first_name;
-- What was the first and last name in the first row of the results? Irene and Reutenauer
-- What was the first and last name of the last person in the table? Vidya and Simmen

-- find all employees with first names 'Irena', 'Vidya', or 'Maya', and 
-- order your results returned by first name and then last name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY first_name, last_name;
--  What was the first and last name in the first row of the results? Irene and Acton
-- What was the first and last name of the last person in the table? Vidya and Zweizig

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya', and
-- order your results returned by last name and then first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY last_name, first_name;
-- What was the first and last name in the first row of the results? Irene and Acton
-- What was the first and last name of the last person in the table? Maya and Zyda

-- Write a query to to find all employees whose last name starts and ends with 'E'.
-- Sort the results by their employee number.
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY emp_no;
-- number of employees returned : 899
-- first employee number, first and last name : 10021 Ramzi Erde
-- last employee number, first and last name: 499648 Tadahiro Erde

-- Write a query to to find all employees whose last name starts and ends with 'E'.
-- Sort the results by their hire date, so that the newest employees are listed first.
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E'
ORDER BY hire_date DESC;
-- The number of employees returned: 899 
-- the name of the newest employee: Teiji Eldridge
-- and the name of the oldest employee: Jianwen Etalle

-- Find all employees hired in the 90s and born on Christmas.
-- Sort the results so that the oldest employee who was hired last is the first result
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25'
ORDER BY hire_date ASC;
-- number of employees returned: 362
-- oldest employee :Alselm Cappello
-- youngest employee: Khun Bernini
