USE ex;

-- What is an Database?

-- Database is the container to store the data

-- Relational database (RDBMS) --> Data is related to one another

-- Data is stored in tables (This tables are crerated inside the RDBMS)

-- Tables :
-- Table is a collection of rows and columns
DROP TABLE products;
CREATE TABLE products
(
	product_code     INT,               -- This defines a columns (Data type defines data rule) and seperate it by comma to each column
    product_name     VARCHAR(50),
    price            FLOAT,
    released_date    DATE
); 

-- How to read all data form a table

SELECT * FROM products;


-- Insert the data into table

INSERT INTO products 
(product_code, product_name, price, released_date)
VALUES
(1, 'iPhone 15', 999.5, DATE '2023-08-22'),
(2, 'Mackbook', 2000, DATE '2021-07-25'),
(3, 'AirPods', 400, DATE '2022-02-02');


-- Filter the data
SELECT * 
FROM products
WHERE price > 1000;

-- Only access single column
SELECT product_name
FROM products
WHERE price > 1000;

-- Featch the data from given date
SELECT product_name
FROM products
WHERE TO_CHAR(released_date, 'yyyy') = 2023;

-- By using extract() featch the data
SELECT *
FROM products
WHERE EXTRACT(year FROM released_date) = 2023;

-- Format the data by using TO_CHAR()
SELECT TO_CHAR(released_date, 'dd-mm-yy') 
FROM products; 

SELECT TO_CHAR(NOW(), 'DD-MM-YYYY') AS Formated_date 
FROM dual;

SELECT TO_CHAR(NOW(), 'YY-dd-MM') AS Formated_date 
FROM dual;


-- Alias 
SELECT product_name AS product     -- Nick name to column by using AS keyword
FROM products
WHERE price > 1000;

SELECT product_name AS "product"     -- You can also use here single quote ''
FROM products
WHERE price > 1000;

SELECT product_name product     -- We can also give nick name with out using AS keyword
FROM products
WHERE price > 1000;


-- Print the current date
SELECT CURRENT_DATE AS Now_date 
FROM dual; 

-- Get Current Date and Time:
SELECT current_timestamp;
SELECT NOW();

-- Get Only the Date:
SELECT current_date;
SELECT CURDATE();

-- Get Only the Time:
SELECT current_time;
SELECT CURTIME();


-- Format the date
SELECT DATE_FORMAT('2024-09-27', '%Y-%m-%d') AS formatted_date;


-- Aggregate Functions

-- Count the total number of records
SELECT COUNT(*) 
FROM products;

SELECT COUNT(*)
FROM products
WHERE price > 1000;

-- Find maximum price of product
SELECT MAX(price) 
FROM products;

-- Find minimum price of product
SELECT  MIN(price) 
FROM products;

-- Total price of all products
SELECT SUM(price)
FROM products;

-- Find average of all product prices
SELECT AVG(price)
FROM products;


-- Modify the data
-- Enabe safe mode
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM products;

-- Update the price of product 1
UPDATE products
SET price = 50000
WHERE product_code = 1;

-- Update multiple columns
UPDATE products
SET price = 3000, product_name = 'iPHONE 15 PRO', released_date = TO_CHAR('2024-02-12', 'yyyy-mm-dd')
-- SET price = 3000, product_name = 'iPHONE 15 PRO', released_date = '2024-02-12'    -- It will also works
WHERE product_code = 1;

SELECT * FROM products;

UPDATE products
SET price = 10000
WHERE product_name LIKE 'MacKbook%';

UPDATE products
SET price = 1000011
WHERE product_name LIKE '%15%';

UPDATE products
SET price = 5000
WHERE LOWER(product_name) LIKE 'airpods';


-- Remove the prticular row from table
SELECT * FROM products;

DELETE FROM products
WHERE product_code = 1;

-- Remove all records from table
DELETE FROM products;     -- All records are deleted

DELETE FROM products
WHERE product_name NOT LIKE '%iPhone%';

-- Remove all records by using Truncate
TRUNCATE TABLE products;        -- We can not use where condition (filter condition) here It can also delete whole table


DROP TABLE products_bkp;

-- Create an another table by using existing table
CREATE TABLE products_bkp 
AS
SELECT * FROM products;

SELECT * FROM products_bkp;

-- Create the only structure of existing table
CREATE TABLE product
AS 
SELECT * FROM products
WHERE 1 = 2;

SELECT * FROM product;


SELECT * FROM products;
SELECT * FROM products_bkp;
SELECT * FROM product;

-- Modify the table
DROP TABLE products;

-- 1) Rename the table
ALTER TABLE products_bkp RENAME TO products;

SELECT * FROM products;

-- SELECT * FROM products_bkp;     -- Now This statement got an error because this table renamed to products

-- 2) Rename the column of table
ALTER TABLE products RENAME COLUMN product_code TO ID;

-- 3) Add new column to products table
ALTER TABLE products ADD DOB DATE;

-- 4) Modify the data type of column
ALTER TABLE products MODIFY ID INT(20);

DESC products;

-- 5) Drop column form table
ALTER TABLE products DROP COLUMN DOB;

SELECT * FROM products;
