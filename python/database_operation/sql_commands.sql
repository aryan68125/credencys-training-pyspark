CREATE TABLE test_table (
id SERIAL PRIMARY KEY,
name VARCHAR(60),
roll_no VARCHAR(10),
city VARCHAR(50)
);

INSERT INTO test_table (name,roll_no,city) VALUES
('Rollex','997','Lucknow'),
('Ballistic','1000','Kan');

SELECT * FROM test_table;

DROP TABLE customers;
DROP TABLE products;
DROP TABLE orders;
DROP TABLE country_stats;
DROP TABLE happiness_scores;
DROP TABLE inflation_rates;
DROP TABLE players;
DROP TABLE salaries;
DROP TABLE school_details;
DROP TABLE schools;
DROP TABLE student_grades;
DROP TABLE students;
DROP TABLE employees;

TRUNCATE TABLE customers;
TRUNCATE TABLE products;
TRUNCATE TABLE orders;
TRUNCATE TABLE country_stats;
TRUNCATE TABLE happiness_scores;
TRUNCATE TABLE inflation_rates;
TRUNCATE TABLE players;
TRUNCATE TABLE salaries;
TRUNCATE TABLE school_details;
TRUNCATE TABLE schools;
TRUNCATE TABLE student_grades;
TRUNCATE TABLE students;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM country_stats;
SELECT * FROM happiness_scores;
SELECT * FROM happiness_scores_current;
SELECT * FROM inflation_rates;
SELECT * FROM players;
SELECT * FROM salaries;
SELECT * FROM school_details;
SELECT * FROM schools;
SELECT * FROM student_grades;
SELECT * FROM students;

-- 
SELECT grade_level, AVG(gpa) AS avg_gpa
FROM students
WHERE school_lunch = true
GROUP BY grade_level
HAVING AVG(gpa) < 3.3
ORDER BY grade_level;

-- PRACTICE : 


--This command was not working properly in jupyter notebook but they works just fine in PGAdmin
SELECT e1.employees_name , e1.salary , e2.employees_name , e2.salary 
FROM employees e1 
    INNER JOIN employees e2 ON e1.salary = e2.salary
    WHERE e1.employees_name <> e2.employees_name
        AND e1.employees_id > e2.employees_id;

SELECT e1.employees_name , e1.salary , e2.employees_name , e2.salary 
FROM employees e1 
    INNER JOIN employees e2 ON e1.salary > e2.salary
    WHERE e1.employees_name <> e2.employees_name AND e1.employees_id > e2.employees_id;

--Write a query to determine which products are within 25 cents from each other 
--in terms of unit price and return a lits of all the candy pairs.
SELECT p1.product_name,p1.unit_price,p2.product_name,p2.unit_price 
FROM products p1 
	INNER JOIN products p2 ON p1.unit_price - p2.unit_price = 0.25;


SELECT p1.product_name, p1.unit_price, p2.product_name, p2.unit_price,
p1.unit_price - p2.unit_price AS price_difference
FROM products p1
	INNER JOIN products p2 ON p1.product_id <> p2.product_id 
	WHERE ABS(p1.unit_price - p2.unit_price) < 0.25;

SELECT p1.product_name, p1.unit_price, p2.product_name, p2.unit_price,
p1.unit_price - p2.unit_price AS price_difference
FROM products p1
	INNER JOIN products p2 ON p1.product_id <> p2.product_id 
	WHERE ABS(p1.unit_price - p2.unit_price) = 0.25
	AND p1.product_id < p2.product_id
	ORDER BY price_difference DESC;

-- UNION should not have returned duplicate values but I am getting "Hoodie" as a duplicate value in the result
SELECT * FROM tops 
UNION
SELECT * FROM outerwear;

-- I tried resolving the issue using this but it dint make any difference
SELECT id,TRIM(LOWER(type)) FROM tops 
UNION 
SELECT id,TRIM(LOWER(type)) FROM outerwear;

--Since CTE related sql queries are not working on jupyter notebook I am going to write the sql
--queries related to CTE in PgAdmin sql file.

--Goal : Return each country's happiness score for the year alongside the 
-- country's average happiness score
WITH country_hs AS 
    (SELECT country, AVG(happiness_score) AS avg_hs_by_country
    FROM happiness_scores
    GROUP BY country)

SELECT hs.year, hs.country, hs.happiness_score, country_hs.avg_hs_by_country 
FROM happiness_scores hs
    LEFT JOIN country_hs 
    ON hs.country = country_hs.country;