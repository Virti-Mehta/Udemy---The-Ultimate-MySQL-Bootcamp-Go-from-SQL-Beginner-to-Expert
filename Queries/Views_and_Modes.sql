-- View
CREATE VIEW full_reviews AS
    SELECT 
        title, released_year, genre, rating, first_name, last_name
    FROM
        reviewers
            INNER JOIN
        reviews ON reviews.reviewer_id = reviewers.id
            INNER JOIN
        series ON series.id = reviews.series_id;

CREATE VIEW ordered_series AS
    SELECT 
        *
    FROM
        series
    ORDER BY released_year;

-- Replace view
CREATE OR REPLACE VIEW ordered_series AS
    SELECT 
        *
    FROM
        series
    ORDER BY released_year DESC;

-- Alter view
ALTER VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;

-- Drop view
DROP VIEW ordered_series;

-- Having clause
SELECT 
    title, AVG(rating), COUNT(rating) AS review_count
FROM
    full_reviews
GROUP BY title
HAVING COUNT(rating) > 1;

-- Roll up clause
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;

SELECT 
    title, COUNT(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;

-- Roll up with multiple GROUP BY
SELECT 
    released_year, genre, AVG(rating)
FROM
    full_reviews
GROUP BY released_year , genre WITH ROLLUP;

-- Set modes
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';