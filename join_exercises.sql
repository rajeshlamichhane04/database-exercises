-- Use the employees database.
USE employees;

-- 2.write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name,' ',e.last_name) as 'Department Manager'
FROM dept_manager dm
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE dm.to_date > curdate()
ORDER BY d.dept_name ASC;

/*
'Customer Service','Yuchang Weedman'
'Development','Leon DasSarma'
'Finance','Isamu Legleitner'
'Human Resources','Karsten Sigstam'
'Marketing','Vishwani Minakawa'
'Production','Oscar Ghazalie'
'Quality Management','Dung Pesch'
'Research','Hilary Kambil'
'Sales','Hauke Zhang'

*/


-- 3. Find the name of all departments currently managed by women.

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name,' ',e.last_name) as 'Department Manager'
FROM dept_manager dm
JOIN departments d
ON dm.dept_no = d.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no
WHERE dm.to_date > curdate() AND
	e.gender = 'F'
ORDER BY d.dept_name ASC;

/*
'Development','Leon DasSarma'
'Finance','Isamu Legleitner'
'Human Resources','Karsten Sigstam'
'Research','Hilary Kambil'
*/

-- 4. Find the current titles of employees currently working in the Customer Service department.

SELECT title, count(title)
FROM dept_emp de
JOIN titles t
ON de.emp_no = t.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE t.to_date = '9999-01-01'AND 
de.to_date = '9999-01-01' AND
d.dept_name = 'Customer Service'
GROUP BY title
ORDER BY title ASC;
/*
'Assistant Engineer','68'
'Engineer','627'
'Manager','1'
'Senior Engineer','1790'
'Senior Staff','11268'
'Staff','3574'
'Technique Leader','241'

*/


-- 5.Find the current salary of all current managers.
SELECT d.dept_name 'Department Name', CONCAT(e.first_name,' ',e.last_name) as 'Name', s.salary
FROM departments d
JOIN dept_manager dm
USING (dept_no)
JOIN salaries s
USING (emp_no)
JOIN employees e
USING (emp_no)
WHERE dm.to_date > curdate()
AND s.to_date > curdate()
ORDER BY d.dept_name ASC;

/*
'Customer Service','Yuchang Weedman','58745'
'Development','Leon DasSarma','74510'
'Finance','Isamu Legleitner','83457'
'Human Resources','Karsten Sigstam','65400'
'Marketing','Vishwani Minakawa','106491'
'Production','Oscar Ghazalie','56654'
'Quality Management','Dung Pesch','72876'
'Research','Hilary Kambil','79393'
'Sales','Hauke Zhang','101987'

*/
-- 6. Find the number of current employees in each department.
SELECT d.dept_no,d.dept_name, count(de.emp_no) as num_employees
FROM dept_emp de
JOIN departments d
USING (dept_no)
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY d.dept_no ASC;

/*
'd001','Marketing','14842'
'd002','Finance','12437'
'd003','Human Resources','12898'
'd004','Production','53304'
'd005','Development','61386'
'd006','Quality Management','14546'
'd007','Sales','37701'
'd008','Research','15441'
'd009','Customer Service','17569'

*/
-- 7 Which department has the highest average salary?

SELECT d.dept_name, AVG(salary) as average_salary
FROM dept_emp de
JOIN salaries s
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE de.to_date > curdate() 
AND s.to_date > curdate()
GROUP BY d.dept_name
ORDER BY AVG(salary) DESC
LIMIT 1;
/*
'Sales','88852.9695'
*/



-- 8. Who is the highest paid employee in the Marketing department?

SELECT e.first_name, e.last_name
FROM dept_emp de	
JOIN salaries s
USING (emp_no)
JOIN employees e
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date > curdate()
AND de.to_date > curdate()
AND d.dept_name = 'Marketing'
ORDER BY salary DESC
LIMIT 1;
 
 /*
 ''Akemi','Warwick'
 */
 
 -- 9.  Which current department manager has the highest salary?
SELECT first_name,last_name, salary, dept_name
FROM employees e
JOIN salaries s
USING (emp_no)
JOIN dept_manager dm
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date > now()
AND dm.to_date > now()
ORDER BY s.salary DESC
LIMIT 1;

 /*
 'Vishwani','Minakawa','106491','Marketing'
 */
 
-- 10 Determine the average salary for each department. 

SELECT dept_name, ROUND(AVG(salary),0) AS Salary
FROM dept_emp de
JOIN departments d
USING (dept_no)
JOIN salaries s
USING (emp_no) 
GROUP BY dept_name 
ORDER BY AVG(salary) DESC;

/*
'Sales','80668'
'Marketing','71913'
'Finance','70489'
'Research','59665'
'Production','59605'
'Development','59479'
'Customer Service','58770'
'Quality Management','57251'
'Human Resources','55575'
*/
























