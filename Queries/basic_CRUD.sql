-- show databases;
-- CREATE DATABASE DogApp;
-- CREATE DATABASE pet_shop;
-- SELECT database();
-- USE pet_shop;
-- CREATE TABLE cats(
-- name VARCHAR(50),
-- age INT);
-- SHOW TABLES;
-- SHOW COLUMNS FROM cats;
-- DESC cats;
-- Activity 1
-- CREATE TABLE pastries (
-- name VARCHAR(50),
-- quantity INT
-- );
-- SHOW TABLES;
-- DESC pastries;
-- DROP TABLE pastries; 
 -- CREATE DATABASE activity;
--  SELECT database();
-- CREATE TABLE people(
-- first_name VARCHAR(20),
-- last_name VARCHAR(20),
-- age int
-- );
-- INSERT INTO people (first_name,last_name,age) 
-- VALUES ("Tina","Belcher",13);
-- INSERT INTO people (first_name,age,last_name)
-- VALUES("Bob",42,"Belcher");
-- INSERT INTO people (first_name,last_name,age) 
-- VALUES ("Linda","Belcher",45),
-- ("Phillip","Frond",38),
-- ("Calvin","Fischoeder",70);
-- Activity 2
-- CREATE TABLE employee (
-- id INT PRIMARY KEY AUTO_INCREMENT,
-- last_name VARCHAR(20) NOT NULL,
-- first_name VARCHAR(20) NOT NULL,
-- middle_name VARCHAR(20),
-- age INT NOT NULL,
-- current_status VARCHAR(30) NOT NULL DEFAULT 'employed'
-- );
-- DESC employee;
-- Drop the current cats table (if you have one)

DROP TABLE cats;

-- Create the new cats table:

CREATE TABLE cats (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
); 
-- Insert some cats:

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
-- Activity 3

-- SELECT cat_id FROM cats;
-- SELECT name,breed FROM cats;
-- SELECT name, age FROM cats WHERE breed = 'tabby';
-- SELECT cat_id, age FROM cats WHERE cat_id = age; 
-- UPDATE cats SET name='Jack' WHERE name='Jackson';
-- UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
-- UPDATE cats SET age=12 WHERE breed='Maine Coon';

-- Activity 4
-- DELETE FROM cats WHERE age = 4;
-- DELETE FROM cats WHERE age = cat_id;
-- DELETE FROM cats;