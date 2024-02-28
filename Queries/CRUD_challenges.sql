-- CREATE DATABASE shirt_db;
-- CREATE TABLE shirt(
-- shirt_id INT  PRIMARY KEY AUTO_INCREMENT,
-- article VARCHAR(15) NOT NULL,
-- color VARCHAR(10) NOT NULL,
-- shirt_size VARCHAR(3) NOT NULL,
-- last_worn INT
-- );
-- INSERT INTO shirt(article,color,shirt_size,last_worn)
-- VALUES('t-shirt', 'white', 'S', 10),
-- ('t-shirt', 'green', 'S', 200),
-- ('polo shirt', 'black', 'M', 10),
-- ('tank top', 'blue', 'S', 50),
-- ('t-shirt', 'pink', 'S', 0),
-- ('polo shirt', 'red', 'M', 5),
-- ('tank top', 'white', 'S', 200),
-- ('tank top', 'blue', 'M', 15);

-- INSERT INTO shirt(color,article,shirt_size,last_worn) VALUES('purple', 'polo shirt','M',50);
SELECT article, color FROM shirt;
SELECT article,color,shirt_size, last_worn FROM shirt WHERE shirt_size = 'M';
UPDATE shirt SET shirt_size = 'L' WHERE article = 'polo shirt';
UPDATE shirt SET last_worn = 0 WHERE last_worn = 15;
UPDATE shirt SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';
DELETE FROM shirt WHERE last_worn = 200;
DELETE FROM shirt WHERE article = 'tank top';
DELETE FROM shirt;
DROP TABLE shirt;