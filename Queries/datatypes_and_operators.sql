-- Exercise
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(7 , 2 ),
    quantity INTEGER
);
SELECT CURTIME();
SELECT CURDATE();
SELECT DAYOFWEEK(CURDATE());
SELECT DAYNAME(CURDATE());
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');
CREATE TABLE tweets (
    content VARCHAR(180),
    username VARCHAR(30),
    creation_time TIMESTAMP DEFAULT NOW ()
);
-- Exercise - 11
-- 0, 1, 1
SELECT 
    *
FROM
    books
WHERE
    released_year < 1980;
SELECT 
    *
FROM
    books
WHERE
    author_lname IN ('Eggers' , 'Chabon');
SELECT 
    *
FROM
    books
WHERE
    author_lname = 'Lahiri'
        AND released_year > 2000;
SELECT 
    *
FROM
    books
WHERE
    pages BETWEEN 100 AND 200;
-- SELECT * FROM books WHERE author_lname LIKE'C%' OR author_lname LIKE'S%';
SELECT 
    *
FROM
    books
WHERE
    SUBSTR(author_lname, 1, 1) IN ('S' , 'C');
SELECT 
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN
            title = 'Just Kids'
                OR title LIKE 'A Heartbreaking Work%'
        THEN
            'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM
    books;
SELECT 
    author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS count
FROM
    books
GROUP BY author_fname , author_lname;