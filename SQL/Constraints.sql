-- Constraints in SQL

USE ex;

-- Create table with some constraints

-- 1) Primary key
-- 1st way
-- The primary key which is applied on 1 or more columns that uniquly defines the rows of that table
-- Primary key accepts unique values and can not accept null values

DROP TABLE products;
CREATE TABLE products
(
	product_code     INT PRIMARY KEY,               
    product_name     VARCHAR(50),
    price            FLOAT,
    released_date    DATE
); 


-- Insert the data into table
INSERT INTO products 
(product_code, product_name, price, released_date)
VALUES
(1, 'iPhone 15', 999.5, DATE '2023-08-22'),
-- (1, 'Keyboard', 400, DATE '2024-09-23'),   -- This gives an error because product_code is same as 1st record and this can not accept because product_code is an primary key
(2, 'Mackbook', 2000, DATE '2021-07-25'),
(3, 'AirPods', 400, DATE '2022-02-02');

SELECT * FROM products;


-- 2nd way
DROP TABLE products;
CREATE TABLE products
(
	product_code     INT,               
    product_name     VARCHAR(50),
    price            FLOAT,
    released_date    DATE,
    CONSTRAINT pk_prod PRIMARY KEY (product_code)
); 


-- Insert the data into table
INSERT INTO products 
(product_code, product_name, price, released_date)
VALUES
(1, 'iPhone 15', 999.5, DATE '2023-08-22'),
(2, 'Mackbook', 2000, DATE '2021-07-25'),
(3, 'AirPods', 400, DATE '2022-02-02');

SELECT * FROM products;


-- Make multiple columns of primary key 
DROP TABLE products;
CREATE TABLE products
(
	product_code     INT,  -- PRIMARY KEY,               
    product_name     VARCHAR(50),  -- PRIMARY KEY,      -- This got an error to make multiple columns primary key use 2nd way
    price            FLOAT,
    released_date    DATE,
    CONSTRAINT pk_prod PRIMARY KEY (product_code, product_name)
); 

INSERT INTO products 
(product_code, product_name, price, released_date)
VALUES
(1, 'iPhone 15', 999.5, DATE '2023-08-22'),
(1, 'Mackbook', 2000, DATE '2021-07-25'),
(1, 'AirPods', 400, DATE '2022-02-02');          -- This works because we maked the multiple columns primary key 

SELECT * FROM products;           


# Auto generate the product_code which is unique
DROP TABLE products;
CREATE TABLE products
(
	product_code     INT AUTO_INCREMENT PRIMARY KEY,      -- GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  This works in SQL               
    product_name     VARCHAR(50), 
    price            FLOAT,
    released_date    DATE
); 

INSERT INTO products 
(product_name, price, released_date)
VALUES
('iPhone 15', 999.5, DATE '2023-08-22'),
('Mackbook', 2000, DATE '2021-07-25'),
('AirPods', 400, DATE '2022-02-02');           

SELECT * FROM products;  



CREATE TABLE sales_order
(
    order_id     INT  AUTO_INCREMENT PRIMARY KEY,
    order_date   DATE, 
    quentity     INT,
    prod_id      INT,
    status       VARCHAR(30)
);

INSERT INTO sales_order (order_date, quentity, prod_id, status)
VALUES
(DATE '2024-01-01', 2, 1, 'Completed'),
(DATE '2024-01-01', 1, 2, 'Pending'),
(DATE '2024-01-01', 1, 15, 'Completed');

SELECT * FROM sales_order;

-- Foreign key

DROP TABLE IF EXISTS sales_order;

CREATE TABLE sales_order
(
    order_id     INT  AUTO_INCREMENT PRIMARY KEY,
    order_date   DATE, 
    quentity     INT,
    prod_id      INT REFERENCES products(product_code),
    status       VARCHAR(30)
);

INSERT INTO sales_order (order_date, quentity, prod_id, status)
VALUES
(DATE '2024-01-01', 2, 1, 'Completed'),
(DATE '2024-01-01', 1, 2, 'Pending'),
-- (DATE '2024-01-01', 1, 15, 'Completed');     -- This row got an error because product id 15 is not exists in products (parent) table so this line show error
(DATE '2024-01-01', 1, 3, 'Completed');        -- This works fine

SELECT * FROM sales_order;

