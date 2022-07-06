USE employees;

-- In your script, use DISTINCT to find the unique titles in the titles table
SELECT DISTINCT title
FROM titles;
-- How many unique titles have there ever been? 7 titles


-- Write a query to to find a list of all unique last names of all 
-- employees that start and end with 'E' using GROUP BY
SELECT last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY last_name; 
-- 5 disticnt last names


-- Write a query to to find all unique combinations of first and last names of all employees 
-- whose last names start and end with 'E'
SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name LIKE 'E%E'
GROUP BY first_name, last_name;
-- 846 rows returned


-- Write a query to find the unique last names with a 'q' but not 'qu' 
SELECT last_name
FROM employees
Where last_name LIKE '%Q%' AND
	last_name NOT LIKE '%QU%'
GROUP BY last_name;
-- Include those names in a comment in your sql code.
-- Chleq, Lindqvist, Qiwen


--  Add a COUNT() to your results (the query above) to find the number of employees 
-- with the same last name.
SELECT last_name,
count(*)
FROM employees
WHERE last_name LIKE '%Q%' AND
	last_name NOT LIKE '%QU%'
GROUP BY last_name;
/*'Chleq','189'
'Lindqvist','190'
'Qiwen','168'*/


-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and 
-- GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, count(gender)
FROM employees
WHERE first_name in ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;
/*
'Vidya','M','151'
'Irena','M','144'
'Irena','F','97'
'Maya','F','90'
'Vidya','F','81'
'Maya','M','146'

*/


-- Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
-- Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name, 1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username , count(*)
FROM employees
GROUP BY username;
-- 285782 rows returned
-- yes there are duplicates 

SELECT LOWER(CONCAT(SUBSTR(first_name,1,1),SUBSTR(last_name, 1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username , count(*)
FROM employees
GROUP BY username
HAVING count(username) > 1;
-- yes
-- 13251 usernames have duplicates

-- Determine the historic average salary for each employee. 
SELECT emp_no, AVG(salary)
FROM salaries
WHERE to_date  < '9999-01-01'
GROUP BY emp_no
LIMIT 5;

/*
'10001','74540.8750'
'10002','68120.0000'
'10003','42983.5000'
'10004','55342.6000'
'10005','86657.7500'


*/

-- Using the dept_emp table, count how many current employees work 
-- in each department. The query result should show 9 rows, one for each department and the employee count
SELECT dept_no,count(emp_no)
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no;
/*
'd001','14842'
'd002','12437'
'd003','12898'
'd004','53304'
'd005','61386'
'd006','14546'
'd007','37701'
'd008','15441'
'd009','17569'
 
*/

-- Determine how many different salaries each employee has had. This includes both historic and current.
SELECT emp_no, count(salary)
FROM salaries
GROUP by emp_no
LIMIT 4;
 /* '10001','17'
'10002','6'
'10003','7'
'10004','16'
*/

-- Find the maximum salary for each employee.
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
limit 5;
/*
'10001','88958'
'10002','72527'
'10003','43699'
'10004','74057'
'10005','94692'
*/


-- Find the minimum salary for each employee.
SELECT emp_no, Min(salary)
FROM salaries
GROUP BY emp_no
limit 5;
/*
'10001','60117'
'10002','65828'
'10003','40006'
'10004','40054'
'10005','78228'
*/


-- Find the standard deviation of salaries for each employee.
SELECT emp_no, STDDEV(salary)
FROM salaries
GROUP BY emp_no
limit 5;
/*
'10001','8460.613692597202'
'10002','2676.784560500402'
'10003','1240.5372930751435'
'10004','10659.852734090653'
'10005','4169.995612501767'
*/


-- Now find the max salary for each employee where that max salary is greater than $150,000
SELECT emp_no, MAX(salary)
FROM salaries
GROUP BY emp_no
HAVING  MAX(salary)> 150000
LIMIT 5;
/*
'43624','158220'
'46439','150345'
'47978','155709'
'66793','150052'
'80823','154459'

*/

-- Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT emp_no, AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 80000 AND 900000
LIMIT 5;
/*
'10005','87275.7692'
'10017','87064.7000'
'10024','90572.4000'
'10042','88329.0000'
'10050','88987.3333'

*/



