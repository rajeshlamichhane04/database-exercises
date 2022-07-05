USE employees;
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya');
-- 709 records returned

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name =  'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709 records returned
-- It matches number of row from Q2	

SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
	OR gender = 'M';
-- 441 records

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%';
-- 7330 records have last names begining with E.

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' OR
	last_name LIKE '%E';
-- 30723 records have last names start or end with 'E'

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%E' AND
	last_name NOT LIKE 'E%';
-- 23393 records have last name end with E but not start with E

SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND
	last_name LIKE '%E';
-- 899 records begins and ends last name with 'E'

SELECT *
FROM employees
WHERE last_name LIKE '%E';
-- 24292 records ends last name with 'E' regardless of whether they start with 'E'

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'; 	
-- 135214 employees were hired in the 90s

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';
-- 842 records were born in christmas


SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND
		hire_date BETWEEN '1990-01-01' AND '1999-12-31';
--  362 record have birthdays in Christmas and hired in 90s


SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- 1873 records showes employees with a 'q' in last name


SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND
	last_name NOT LIKE '%qu%';
-- 547 records showes employees with q in last name but not qu
