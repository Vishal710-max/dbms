
DROP TABLE IF EXISTS products;
CREATE TABLE products
(
	id		    INT AUTO_INCREMENT PRIMARY KEY,
	name	    VARCHAR(100),
	price		FLOAT,
	release_date 	DATE
);

INSERT INTO products (name, price, release_date) VALUES ('iPhone 15', 800, DATE '2023-08-22');
INSERT INTO products (name, price, release_date) VALUES ('Macbook Pro', 2100, DATE '2022-10-12');
INSERT INTO products (name, price, release_date) VALUES ('Apple Watch 9', 550, DATE '2022-09-04');
INSERT INTO products (name, price, release_date) VALUES ('iPad', 400, DATE '2020-08-25');
INSERT INTO products (name, price, release_date) VALUES ('AirPods', 420, DATE '2024-03-30');



DROP TABLE IF EXISTS customers;
CREATE TABLE customers
(
    id         INT AUTO_INCREMENT PRIMARY KEY, -- generated always as identity primary key,
    name       VARCHAR(100),
    email      VARCHAR(30)
);

INSERT INTO customers (name, email) VALUES('Meghan Harley', 'mharley@demo.com');
INSERT INTO customers (name, email) VALUES('Rosa Chan', 'rchan@demo.com');
INSERT INTO customers (name, email) VALUES('Logan Short', 'lshort@demo.com');
INSERT INTO customers (name, email) VALUES('Zaria Duke', 'zduke@demo.com');


DROP TABLE IF EXISTS employees;
CREATE TABLE employees
(
    id         INT AUTO_INCREMENT PRIMARY KEY,  -- generated always as identity primary key,
    name       VARCHAR(100)
);

INSERT INTO employees (name) VALUES('Nina Kumari');
INSERT INTO employees (name) VALUES('Abrar Khan');
INSERT INTO employees (name) VALUES('Irene Costa');



DROP TABLE IF EXISTS sales_order;
CREATE TABLE sales_order
(
	order_id		INT AUTO_INCREMENT PRIMARY KEY,  -- generated always as identity primary key,
	order_date		DATE,
	quantity		INT,
	prod_id			INT REFERENCES products(id),
	status			VARCHAR(20),
	customer_id		INT REFERENCES customers(id),
	emp_id			INT,
	CONSTRAINT fk_so_emp FOREIGN KEY (emp_id) REFERENCES employees(id)
);

INSERT INTO sales_order (order_date, quantity, prod_id, status, customer_id, emp_id) 
VALUES
(DATE '2024-01-01', 2, 1, 'Completed', 1, 1),
(DATE '2024-01-01', 3, 1, 'Pending', 2, 2),
(DATE '2024-01-02', 3, 2, 'Completed', 3, 2),
(DATE '2024-01-03', 3, 3, 'Completed', 3, 2),
(DATE '2024-01-04', 1, 1, 'Completed', 3, 2),
(DATE '2024-01-04', 1, 3, 'Completed', 2, 1),
(DATE '2024-01-04', 1, 2, 'On Hold', 2, 1),
(DATE '2024-01-05', 4, 2, 'Rejected', 1, 2),
(DATE '2024-01-06', 5, 5, 'completed', 1, 2),
(DATE '2024-01-06', 1, 1, 'Cancelled', 1, 1);



SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;
