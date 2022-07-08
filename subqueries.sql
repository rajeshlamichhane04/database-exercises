USE employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query
SELECT emp_no, first_name, last_name, hire_date
FROM employees
	join dept_emp
		using (emp_no)
WHERE hire_date = (
	SELECT hire_date 
    FROM employees
    WHERE emp_no = 101010
					)
AND to_date > now();
	    
-- 2 Find all the titles ever held by all current employees with the first name Aamod
SELECT title, count(*)
FROM titles
WHERE emp_no IN (
	SELECT emp_no
    FROM employees
		JOIN dept_emp
		USING (emp_no)
	WHERE first_name = 'Aamod'
    
AND to_date > now()
)
GROUP BY title;

/*
'Senior Staff','60'
'Staff','64'
'Engineer','62'
'Technique Leader','9'
'Senior Engineer','51'
'Assistant Engineer','5'

*/


-- 3 How many people in the employees table are no longer working for the company?

SELECT count(emp_no)
FROM employees
WHERE emp_no NOT IN
	(SELECT emp_no
	FROM dept_emp
	WHERE to_date > now()
    );

-- 59900

-- 4. Find all the current department managers that are female.

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE gender = 'F'
					) AND 
	to_date > now()
					);

/* 4 current dept managers are female
'110114','Isamu','Legleitner'
'110228','Karsten','Sigstam'
'110567','Leon','DasSarma'
'111534','Hilary','Kambil'*/

-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT emp_no
FROM salaries
WHERE 
	to_date > now() AND
    salary > (
			SELECT AVG(salary)
			FROM salaries
            ); 
            
-- 154543


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 

SELECT MAX(salary)
FROM salaries
WHERE to_date > now() ;
					
SELECT stddev(salary)
FROM salaries
WHERE to_date > now();
    
		SELECT count(salary)
        FROM salaries
        where salary > ( 
						(SELECT MAX(salary)
						FROM salaries
						WHERE to_date > now()
                        ) 
						- 
						(SELECT stddev(salary)
						FROM salaries
						WHERE to_date > now()
						)
                        )
		AND to_date > now();
        
	-- 83 current salaries
    
    -- What percentage of all salaries is this?
SELECT 
    (
		SELECT count(salary)
        FROM salaries
        where salary > ( 
						(SELECT MAX(salary)
						FROM salaries
						WHERE to_date > now()
                        ) 
						- 
						(SELECT stddev(salary)
						FROM salaries
						WHERE to_date > now()
						)
                        )
		AND to_date > now()
        
        )
    /
		(
        SELECT COUNT(*)
        FROM salaries
        WHERE to_date > now()
        
        )* 100;
        
        -- 0.0346 %


























				