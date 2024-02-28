CREATE DATABASE exercise;
CREATE TABLE employee (
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    dept VARCHAR(10)
);
INSERT INTO employee (first_name, last_name, age, dept) 
VALUES ('Messa', 'Loop', 30, 'Acct'), 
		('Smith', 'Oak', 27, 'devl'), 
        ('John', 'Jorz', 37, 'QA'), 
        ('Hary', 'Gaga', 32, 'QA');

-- 1. Write a mysql statement to find the concatenated first_name, last_name where the age of the employee is greater than 30.
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employee
WHERE
    age > 30;

-- 2. Write a mysql statement to get user, current date and mysql version.
SELECT USER(), CURDATE(), VERSION();

-- 3. Write a mysql statement to get item id, item, price of the most expensive item.
CREATE TABLE items (
    item_id INT,
    item VARCHAR(20),
    price INT
);
INSERT INTO items (item_id, item, price) 
VALUES (1001, 'Book', 1200), 
		(1002, 'Pen', 930), 
        (1003, 'Bag', 1430), 
        (1004, 'Copy', 1030);

SELECT 
    *
FROM
    items
WHERE
    price = (SELECT 
            MAX(price)
        FROM
            items);

-- 4. Write a mysql statement to create a new user and set a password and privileges for an existing database.
CREATE USER student@Root IDENTIFIED BY 'stud@123';
GRANT CREATE, INSERT, SELECT, UPDATE 
ON exercise.* 
to 'student'@'Root' WITH GRANT OPTION;
SHOW GRANTS FOR 'student'@'Root';

-- 5. Write a mysql statement to select data of only CS and IT departments.
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(20),
    department CHAR(2),
    age INT
);
INSERT INTO students (full_name, department, age) 
VALUES ('Maria Gloria', 'CS', 22),   
	   ('John Smith', 'IT', 23), 
       ('Gal Rao', 'CS', 22), 
       ('Jackey Smith', 'EC', 24), 
       ('Rama Saho', 'IT', 22), 
       ('Maria Gaga', 'EC', 23);

SELECT 
    *
FROM
    students
WHERE
    department = 'CS' OR department = 'IT';

-- 6. Write a mysql statement to select data of all departments in descending order by age.
SELECT 
    full_name, department, age
FROM
    students
ORDER BY age DESC;

-- 7. Write a mysql statement to determine the age of each of the students.
ALTER TABLE students DROP COLUMN age;
ALTER TABLE students ADD COLUMN birth DATE;
UPDATE students 
SET 
    birth = '1994-03-12'
WHERE
    id = 1;
UPDATE students 
SET 
    birth = '1993-02-07'
WHERE
    id = 2;
UPDATE students 
SET 
    birth = '1992-09-11'
WHERE
    id = 3;
UPDATE students 
SET 
    birth = '1990-08-31'
WHERE
    id = 4;
UPDATE students 
SET 
    birth = '1994-12-09'
WHERE
    id = 5;
UPDATE students 
SET 
    birth = '1993-10-09'
WHERE
    id = 6;

-- SELECT (YEAR(CURDATE()) - YEAR(birth)) AS age FROM students; 
SELECT 
    *, TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age
FROM
    students;

-- 8. Write a mysql statement to retrieve name beginning with 'm'.
SELECT 
    full_name
FROM
    students
WHERE
    full_name LIKE 'M%';

-- 9. Write a mysql statement to find the name, birth, department name, department block from the given tables.
ALTER TABLE students DROP COLUMN department;
ALTER TABLE students ADD COLUMN dept_id INT;
UPDATE students 
SET 
    dept_id = 2
WHERE
    id = 1;
UPDATE students 
SET 
    dept_id = 1
WHERE
    id = 2;
UPDATE students 
SET 
    dept_id = 4
WHERE
    id = 3;
UPDATE students 
SET 
    dept_id = 2
WHERE
    id = 4;
UPDATE students 
SET 
    dept_id = 1
WHERE
    id = 5;
UPDATE students 
SET 
    dept_id = 4
WHERE
    id = 6;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    dept_block CHAR(7)
);

INSERT INTO departments (dept_name, dept_block) 
VALUES ('Computer Science', 'B-Block'),   
	   ('Information Technology', 'C-Block'),
       ('Mechanical', 'A-Block'), 
       ('Electronic Communication', 'D-Block');
       
ALTER TABLE students ADD CONSTRAINT FOREIGN KEY (dept_id) REFERENCES departments(dept_id);

SELECT 
    full_name, birth, dept_name, dept_block
FROM
    students
        INNER JOIN
    departments ON students.dept_id = departments.dept_id;

-- 10. Write a mysql statement to get name of students containing exactly four characters.
SET SQL_SAFE_UPDATES = 0;
UPDATE students 
SET 
    full_name = SUBSTRING_INDEX(full_name, ' ', 1);
SELECT 
    full_name AS first_name
FROM
    students
WHERE
    CHAR_LENGTH(full_name) = 4;

-- 11. Delete duplicate row from the table.
DELETE s1 FROM students s1,
    students s2 
WHERE
    s1.id < s2.id
    AND s1.full_name = s2.full_name;

SELECT 
    *
FROM
    students;

-- 12. Display the alternate rows from MySQL table.
SELECT 
    *
FROM
    students
WHERE
    id % 2 = 1;
SELECT 
    *
FROM
    students
WHERE
    id % 2 = 0;

-- 13. Delete alternate rows from MySQL table.
DELETE FROM students 
WHERE
    id = (SELECT 
        id
    FROM
        students
    
    WHERE
        MOD(id, 2) = 1);

-- 14. MySQL update multiple rows in one query.
ALTER TABLE employee ADD COLUMN phone INT;
ALTER TABLE employee ADD COLUMN emp_id INT;
ALTER TABLE employee ADD CONSTRAINT PRIMARY KEY (emp_id), MODIFY emp_id INT AUTO_INCREMENT;
SELECT 
    *
FROM
    employee;
UPDATE employee 
SET 
    phone = CASE
        WHEN emp_id = 1 THEN '840932345'
        WHEN emp_id = 2 THEN '890040908'
        WHEN emp_id = 3 THEN '675748389'
        WHEN emp_id = 4 THEN '909030309'
    END;

-- 15. MySQL get nth highest paid and nth lowest paid salary.
CREATE TABLE IF NOT EXISTS `empsalary` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `emp_name` VARCHAR(100) NOT NULL,
    `salary` INT(50) NOT NULL,
    PRIMARY KEY (`id`)
);

INSERT INTO `empsalary` (`id`, `emp_name`, `salary`) VALUES
(1, 'Smith', 30000),
(2, 'Joney', 20000),
(3, 'Mariya', 40000),
(4, 'Zoya', 35000),
(5, 'Smith', 25000),
(6, 'Rosy', 75000);

-- 4th lowest
SELECT 
    *
FROM
    empsalary
ORDER BY salary ASC
LIMIT 3 , 1;

-- 2nd highest
SELECT 
    *
FROM
    empsalary
ORDER BY salary DESC
LIMIT 1 , 1;

-- 16. Display the nth row from MySQL table.
-- 4th row
SELECT 
    *
FROM
    empsalary
ORDER BY id ASC
LIMIT 3 , 1;

-- 17. Write a MySQL statements for rollback commit and save points.
CREATE TABLE item_order (
    item_id INT,
    name CHAR(20),
    INDEX (item_id)
);
START TRANSACTION;
INSERT INTO item_order VALUES (101, 'Milk');
-- commit above statement
COMMIT;
-- turn off auto-commit
SET autocommit = 0;
INSERT INTO item_order VALUES (102, 'Biscuit');
INSERT INTO item_order VALUES (103, 'Cake');
SAVEPOINT C;
DELETE FROM item_order 
WHERE
    name = 'Cake';
-- rollback
ROLLBACK TO C;
SELECT 
    *
FROM
    item_order;

-- 18. Display details of first 5 highly paid employees using MySQL.
SELECT 
    *
FROM
    empsalary
ORDER BY salary DESC
LIMIT 5;