CREATE TABLE shop (
    article INT UNSIGNED DEFAULT '0000' NOT NULL,
    dealer CHAR(20) DEFAULT '' NOT NULL,
    price DECIMAL(16 , 2 ) DEFAULT '0.00' NOT NULL,
    PRIMARY KEY (article , dealer)
);
INSERT INTO shop VALUES
    (1,'A',3.45),(1,'B',3.99),(2,'A',10.99),(3,'B',1.45),
    (3,'C',1.69),(3,'D',1.25),(4,'D',19.95);
    
-- 1. What is the highest item number?
SELECT 
    MAX(article)
FROM
    shop;

-- 2. Find the number, dealer, and price of the most expensive article.
SELECT 
    article, dealer, price
FROM
    shop
WHERE
    price = (SELECT 
            MAX(price)
        FROM
            shop);

-- 3.  Find the highest price per article.
SELECT 
    article, MAX(price)
FROM
    shop
GROUP BY article
ORDER BY article;

-- 4. For each article, find the dealer or dealers with the most expensive price
SELECT 
    article, dealer, price
FROM
    shop s1
WHERE
    price = (SELECT 
            MAX(s2.price)
        FROM
            shop s2
        WHERE
            s1.article = s2.article)
ORDER BY article;

SELECT 
    s1.article, s1.dealer, s1.price
FROM
    shop s1
        LEFT JOIN
    shop s2 ON s1.article = s2.article
        AND s1.price < s2.price
WHERE
    s2.article IS NULL
ORDER BY s1.article;

-- 5. find the articles with the highest and lowest price using user defined variables 
SELECT 
    @min_price:=MIN(price), @max_price:=MAX(price)
FROM
    shop;
SELECT 
    *
FROM
    shop
WHERE
    price = @min_price OR price = @max_price;