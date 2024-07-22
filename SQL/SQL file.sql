Select Count(*) as total_perfumes from menperfumes;    -- Basic Data Overview


-- Count Null Values in each column
SELECT COUNT(*) AS null_count,
'brand_name ' AS column_name FROM menperfumes WHERE brand IS NULL
UNION ALL
SELECT COUNT(*), 'title' FROM menperfumes WHERE title IS NULL
UNION ALL
SELECT COUNT(*), 'type_of_perfume' FROM menperfumes WHERE type  IS NULL
UNION ALL
SELECT COUNT(*), 'price'FROM menperfumes WHERE price
IS NULL; 


Select brand,
	count(*) as Product_count,-- count unique products 
	avg(price)as avg_price, --Count avg pricr
	min(price) as Min_price, --count max price 
Max(Price)As Max_price 
from menperfumes group by brand order by product_count DESC;  --high to low  ranking
--brand analysis


-- List of unique Type of perfume , count as product_count& avg price
Select type ,
count(*) as product_count,
avg(price) as avg_price from menperfumes 
group by type order by product_count DESC;


--Price Range Distribution Analysis
 SELECT  CASE 
   WHEN price < 50 THEN 'Under $50'
   WHEN price BETWEEN 50 AND 100 THEN '$50 - $100'
 WHEN price BETWEEN 101 AND 200 THEN '$101 - $200'
 ELSE 'Over $200'
 END AS price_range,
 COUNT(*) AS product_count
FROM menperfumes
GROUP BY price_range
ORDER BY price_range;


--Checking availability of perfume 
SELECT available, availabletext,
 COUNT(*) AS product_count FROM menperfumes
GROUP BY available, availabletext
ORDER BY product_count DESC;


--Top 10 Perfumes
SELECT brand, title, type, price, pricewithcurrency FROM menperfumes
ORDER BY price DESC LIMIT 10;

--Analysis based on brand and type of perfume 
SELECT brand,type, COUNT(*) AS product_count
FROM menperfumes
GROUP BY brand, type
ORDER BY product_count DESC
LIMIT 15;


--Availability by Price Range 

SELECT CASE 
WHEN price < 50 THEN 'Under $50'
 WHEN price BETWEEN 50 AND 100 THEN '$50 - $100'
 WHEN price BETWEEN 101 AND 200 THEN '$101 - $200'
 ELSE 'Over $200'
 END AS price_range,
  available,
 COUNT(*) AS product_count FROM menperfumes
GROUP BY price_range, available
ORDER BY price_range, available;


--Number of types of Brand 
SELECT brand,
COUNT(DISTINCT type) AS type_count
FROM menperfumes
GROUP BY brand
ORDER BY type_count DESC;




-----Female Perfumes--
CREATE TABLE femaleperfume (
    ftitle VARCHAR(255),
    fbrand VARCHAR(255),
    ftype VARCHAR(255),
    fprice DECIMAL(10, 2),
    fpriceWithCurrency VARCHAR(50),
    favailable INT,
    favailableText VARCHAR(255),
    fsold INT,
    flastUpdated TIMESTAMP,
    perfumeLocation VARCHAR(255)
);



--Counting null values in female perfumes data 
SELECT COUNT(*) AS null_count,
'fbrand ' AS column_name FROM femaleperfume WHERE fbrand IS NULL
UNION ALL
SELECT COUNT(*), 'ftitle' FROM femaleperfume WHERE ftitle IS NULL
UNION ALL
SELECT COUNT(*), 'ftype' FROM femaleperfume WHERE ftype  IS NULL
UNION ALL
SELECT COUNT(*), 'fprice'FROM femaleperfume WHERE fprice
IS NULL; 



Select Count(*) as total_perfumes from femaleperfumes;    -- Basic Data Overview Of female perfume 

	
Select fbrand,
	count(*) as Product_count,-- count unique products 
	avg(fprice)as avg_price, --Count avg pricr
	min(fprice) as Min_price, --count max price 
Max(fPrice)As Max_price 
from femaleperfumes group by fbrand order by product_count DESC;  --high to low  ranking
--brand analysis for female perfume
	

-- List of unique Type of perfume , count as product_count& avg price
Select ftype ,
count(*) as product_count,
avg(fprice) as avg_price from femaleperfumes 
group by ftype order by product_count DESC;



--Price Range Distribution Analysis
 SELECT  CASE 
   WHEN fprice < 50 THEN 'Under $50'
   WHEN fprice BETWEEN 50 AND 100 THEN '$50 - $100'
 WHEN fprice BETWEEN 101 AND 200 THEN '$101 - $200'
 ELSE 'Over $200'
 END AS price_range,
 COUNT(*) AS product_count
FROM femaleperfumes
GROUP BY price_range
ORDER BY price_range;


--Number of types of Brand 
SELECT fbrand,
COUNT(DISTINCT ftype) AS type_count
FROM femaleperfumes
GROUP BY fbrand
ORDER BY type_count DESC;



--Returns all the row from male perfume table and matched rows from female perfume table 
SELECT m.title, m.brand, m.price, f.ftitle AS women_title, f.fprice AS women_price
FROM menperfumes m
LEFT JOIN femaleperfumes f ON m.title = f.ftitle AND m.brand = f.fbrand
ORDER BY m.brand, m.title;






--Returns all the row from FEMALE perfume table and matched rows from MALE perfume table 
SELECT fbrand, ftitle, fprice, title AS men_title, price
FROM menperfumes m
RIGHT JOIN femaleperfumes f ON brand = fbrand AND title = ftitle
ORDER BY fbrand, ftitle;




