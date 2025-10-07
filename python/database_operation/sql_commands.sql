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

TRUNCATE TABLE customers;
TRUNCATE TABLE products;
TRUNCATE TABLE orders;
TRUNCATE TABLE country_stats;
TRUNCATE TABLE happiness_scores;
TRUNCATE TABLE inflation_rates;
TRUNCATE TABLE players;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM country_stats;
SELECT * FROM happiness_scores;
SELECT * FROM inflation_rates;
SELECT * FROM players;