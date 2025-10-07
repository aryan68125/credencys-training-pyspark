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
