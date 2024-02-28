-- CREATE TABLE exercise
-- 1. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id.
CREATE TABLE countries 
( country_id INT PRIMARY KEY, 
country_name VARCHAR(30), 
region_id INT );

-- 2. Write a MySQL query to create the structure of a table dup_countries similar to countries.
CREATE TABLE dup_countries LIKE countries;

-- 3. Write a MySQL query to create a duplicate copy of countries table including structure and data by name dup_countries.
CREATE TABLE IF NOT EXISTS dup_countries AS SELECT * FROM countries;

-- 4. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary 
-- and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE jobs (
job_id INT PRIMARY KEY, 
job_title VARCHAR(20) NOT NULL, 
min_salary DECIMAL(6,0), 
max_salary DECIMAL(6,0),
CHECK(max_salary <= 25000));

-- 5. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id 
-- and make sure that no countries except Italy, India and China will be entered in the table.
CREATE TABLE IF NOT EXISTS countries (
country_id INT PRIMARY KEY, 
country_name VARCHAR(30), 
region_id INT, 
CHECK(country_name IN ('Italy', 'India', 'China'))
);

-- ALTER TABLE exercise
-- 1. Write a SQL statement to rename the table countries to country_new.
ALTER TABLE countries RENAME country_new;

-- 2. Write a SQL statement to add a column region_id to the table locations.
ALTER TABLE locations ADD COLUMN region_id INT;

-- 3. Write a SQL statement to add a columns ID as the first column of the table locations.
ALTER TABLE locations ADD COLUMN region_id INT FIRST;

-- 4. Write a SQL statement to add a column region_id after state_province to the table locations.
ALTER TABLE locations ADD COLUMN region_id INT AFTER state_province;

-- 5. Write a SQL statement change the data type of the column country_id to integer in the table locations.
ALTER TABLE locations MODIFY COLUMN country_id INT;

-- 6. Write a SQL statement to drop the column city from the table locations.
ALTER TABLE locations DROP COLUMN city;

-- 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.
ALTER TABLE locations RENAME COLUMN state_province TO state;

-- 8. Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history.	
ALTER TABLE job_history ADD INDEX indx_job_id(job_id);

-- 9. Write a SQL statement to drop the index indx_job_id from job_history table.
ALTER TABLE job_history DROP INDEX indx_job_id;

-- Exercises on hr database
-- Basic SELECT statement
-- 1. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
SELECT first_name, last_name, salary, (0.15 * salary) AS PF FROM employees;

-- 2.  Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTRING(first_name, 1, 3) FROM employees;

-- 3. Write a query to get first name from employees table after removing white spaces from both side.
SELECT TRIM(first_name) FROM employees;

-- 4. Write a query to get the length of the employee names (first_name, last_name) from employees table.
SELECT employee_id, CHAR_LENGTH(CONCAT(first_name, last_name)) FROM employees;

-- 5. Write a query to check if the first_name fields of the employees table contains numbers.
SELECT first_name FROM employees WHERE FIRST_NAME REGEXP('[0-9]');

-- 6. Write a query to get monthly salary (round 2 decimal places) of each and every employee
-- Note : Assume the salary field provides the 'annual salary' information. 
SELECT first_name, last_name, ROUND(salary/12, 2) AS monthly_salary FROM employees;

-- Restricting and sorting queries
-- 1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
SELECT first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 10000 AND 15000;

-- 2.  Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date) = 1987;

-- 3. Write a query to display the first_name of all employees who have both "b" and "c" in their first name.
SELECT first_name FROM employees WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';

-- 4. Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, 
-- and whose salary is not equal to $4,500, $10,000, or $15,000.
SELECT last_name, job_id, salary FROM employees 
WHERE JOB_ID IN ('IT_PROG', 'SH_CLERK') 
AND SALARY NOT IN (45000, 10000, 15000);

-- 5. Write a query to display the last name of employees having 'e' as the third character.
SELECT last_name FROM employees WHERE last_name LIKE '__e%';

-- 6. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT * FROM employees WHERE LAST_NAME IN ('BLAKE', 'SCOTT', 'KING', 'FORD');

-- Aggregate functions and group by
-- 1. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT job_id,MAX(salary) FROM employees GROUP BY JOB_ID HAVING JOB_ID = 'IT_PROG'; 

-- 2. Write a query to get the number of employees with the same job.
SELECT job_id, COUNT(*) FROM employees GROUP BY JOB_ID;

-- 3. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) DESC;

-- 4.  Write a query to get the department ID and the total salary payable in each department.
SELECT department_id, SUM(salary) FROM employees GROUP BY DEPARTMENT_ID;

-- 5.  Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT job_id, MAX(salary) FROM employees GROUP BY JOB_ID HAVING MAX(salary) >= 4000;

-- 6.  Write a query to get the average salary for all departments employing more than 10 employees. 
SELECT department_id, AVG(salary) FROM employees GROUP BY DEPARTMENT_ID HAVING COUNT(job_id) > 10; 