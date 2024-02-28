-- Exercises ============================================
-- 1. Find earliest date a user joined
SELECT 
    DATE_FORMAT(MIN(created_at), "%b %D %Y") AS earliest_date 
FROM users;
-- 2. Find email of first user ORDER BY created_at LIMIT 1
SELECT * 
FROM users 
WHERE created_at = (SELECT MIN(created_at) FROM users);
-- 3. Number of users according to the month they joined
SELECT 
    MONTHNAME(created_at) AS month, 
    COUNT(*) AS count 
FROM users 
GROUP BY MONTHNAME(created_at) 
ORDER BY count DESC;
-- 4. Count number of users with Yahoo email
SELECT 
    COUNT(*) AS yahoo_users 
FROM users 
WHERE email LIKE "%@yahoo.com";
-- 5. Calculate total number of users for each email host
SELECT CASE 
    WHEN email LIKE '%@gmail.com' THEN 'gmail' 
    WHEN email LIKE '%@yahoo.com' THEN 'yahoo' 
    WHEN email LIKE '%@hotmail.com' THEN 'hotmail' 
    ELSE 'other' 
END AS provider, 
COUNT(*) AS total_users 
FROM users 
GROUP BY provider
ORDER BY total_users DESC;