USE employees;

-- Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name
SELECT CONCAT (first_name,' ',last_name) AS full_name
FROM employees
WHERE last_name like 'E%E';

-- Convert the names produced in your last query to all uppercase
SELECT UPPER (CONCAT (first_name,' ',last_name)) AS full_name
FROM employees
WHERE last_name like 'E%E';

-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company
SELECT first_name, last_name, datediff ( NOW(), hire_date)
FROM employees
WHERE hire_date LIKE '199%'
	AND birth_date LIKE '%-12-25';
    
-- Find the smallest and largest current salary from the salaries table.
SELECT MAX(salary) FROM employees.salaries;
-- 158220

SELECT MIN(salary) FROM employees.salaries;
-- 38623

SELECT 
LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name, 1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username
FROM employees;
/* some of username 
'gface_0953'
'bsimm_0664'
'pbamf_1259'
ckobl_0554*/

