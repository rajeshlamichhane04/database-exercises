USE employees;
SHOW tables;
SHOW DATABASES;
USE employees;	
SHOW tables;
-- exploring employee table using describe
DESCRIBE employees;
DESCRIBE departments;
SELECT * FROM employees;
-- Which table(s) do you think contain a numeric type column? employee number
-- Which table(s) do you think contain a string type column? first_name and last_name
-- Which table(s) do you think contain a date type column? hire_date

DESCRIBE employees;
DESCRIBE departments;
-- What is the relationship between the employees and the departments tables? same primary key
SHOW CREATE TABLE dept_manager;
-- CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1

