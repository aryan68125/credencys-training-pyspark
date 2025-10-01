-- Create table
CREATE TABLE test_table (
id SERIAL PRIMARY KEY,
name VARCHAR(30),
roll_no INT, 
mobile_no VARCHAR(10)
);

-- Display all the contents of the table
SELECT * FROM test_table;

-- Insert the elemennts in the table
INSERT INTO test_table (name,roll_no,mobile_no) VALUES
('Rollex',997,'997'),
('Ballistic',1000,'1000'),
('Barbatos',117,'117'),
('Bullet',762,'762');

--create an orders table 
CREATE TABLE customers (
customer_id SERIAL PRIMARY KEY,
city VARCHAR(40),
state_province VARCHAR(50),
country VARCHAR(50),
region VARCHAR(50)
);

-- delete table data + schema
DROP TABLE orders;

-- command to load data using csv file in postgreSql
COPY customers FROM 'D:\training\postgreSQL-database\Advanced+SQL+Querying\Course Materials\Data\customers.csv' DELIMITER ',' CSV HEADER;  

-- show all data from the customers table
SELECT * FROM customers;

-- create a products table
CREATE TABLE products (
product_id VARCHAR(255),
product_name VARCHAR(255),
factory VARCHAR(255),
division VARCHAR(255),
unit_price NUMERIC(11,4)
);

DROP TABLE products;

-- load data into the products table using csv file
COPY products from 'D:\training\postgreSQL-database\Advanced+SQL+Querying\Course Materials\Data\products.csv' DELIMITER ',' CSV HEADER;

-- Print all the data in products table
SELECT * FROM products;

-- creating a new table orders 
CREATE TABLE orders (
    transaction_id VARCHAR(255),
    order_id VARCHAR(255),
    order_date DATE,
    product_id VARCHAR(255),
    customer_id BIGINT,
    units INT,
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
);

-- load data from a csv file in orders table
COPY orders FROM 'D:\training\postgreSQL-database\Advanced+SQL+Querying\Course Materials\Data\orders.csv' DELIMITER ',' CSV HEADER;
