SELECT COUNT(*) from books;
SELECT 
    released_year, COUNT(*) AS 'no. of books'
FROM
    books
GROUP BY released_year;
SELECT 
    SUM(stock_quantity)
FROM
    books;
SELECT 
    author_fname, author_lname, AVG(released_year)
FROM
    books
GROUP BY author_fname , author_lname;
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author_fullname
FROM
    books
WHERE
    pages = (SELECT 
            MAX(pages)
        FROM
            books);
SELECT 
    released_year,
    COUNT(books) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year;
SELECT 
    released_year AS year,
    COUNT(title) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY released_year
ORDER BY released_year;