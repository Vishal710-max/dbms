USE ex;

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- IMP things
SELECT  -- Mention all the columns
FROM    -- The table which has the data
WHERE   -- Filter condition 


-- PROBLEM STATEMENTS:

-- 1. Identify the total no of products sold

SELECT SUM(quantity) AS Sold_products
FROM sales_order;
-- WHERE status IN ('Completed', 'Pending', 'On Hold');


-- 2. Other than Completed, display the available delivery status's

SELECT order_id, customer_id, status
FROM sales_order
WHERE status NOT IN ('completed', 'completed');    -- <>  Not equal to     

-- OR

SELECT order_id, customer_id, status
FROM sales_order
WHERE LOWER(status) != 'completed';    -- <>  Not equal to     

-- DISTINCT keyword are used to display unique data
SELECT DISTINCT status
FROM sales_order
WHERE status IN ('Completed');

SELECT UPPER('shreysh'), LOWER('SHREYASH');


-- 3. Display the order id, order_date and product_name for all the completed orders.

SELECT order_id, order_date, name Product_name      -- Or -- SELECT s.order_id, s.order_date, p.name Product_name  (Here did not addes alias order_id, order_date, name 
-- because this columns are only present in sales_order table and products table SQL knows that order_id and order_date only in sales_order table and name in products table
-- If both table has same column name that time we have to mention Alias name of table )
FROM sales_order s
INNER JOIN products p
ON s.prod_id = p.id     -- ON defines condition how will join happens between two tables
WHERE LOWER(s.status) = 'completed';


-- 4. Sort the above query to show the earliest orders at the top. Also display the customer who purchased these orders.

SELECT s.order_id, s.order_date, c.name Customer_name, p.name Product_name
FROM sales_order s
INNER JOIN products p
ON s.prod_id = p.id
INNER JOIN customers c
ON s.customer_id = c.id
WHERE s.status = 'Completed'
ORDER BY s.order_date;


SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;

-- 5. Display the total no of orders corresponding to each delivery status

SELECT status, COUNT(*) Total_orders       -- This COUNT(*) Function is qpplied on group data (i.e It counts how many records have each group (unique value record) And display it for all groups)
FROM sales_order
GROUP BY status;

-- GROUP BY :
--  Group the data based on that column that means unique values in that column it going to create seperate group and same value single group
-- Between that groups what ever the Aggregate function we going to run that are seperatily run for each groups and display the output
--  It is used to grouping the records
-- 1st SQL finds UNIQUE values then create unique values saperate groups and same value single group
-- Once we created groups then we apply any Aggregate functions on group data

-- Syntax :
SELECT col1_name, col2_name, ..
FROM table_name
GROUP BY col1_name;




SELECT status 
FROM sales_order;

SELECT status 
FROM sales_order
GROUP BY status;

-- SELECT DISTINCT status      -- Only we have to find unique values then we use distinct But If we have to no of records correspoding to single record then we use group by
-- FROM sales_order;


-- 6. For orders purchasing more than 1 item, how many are still not completed?

SELECT * 
FROM sales_order;

SELECT  COUNT(*) AS Not_completed_count
FROM sales_order
WHERE quantity > 1 AND lower(status) != 'completed';


-- 7. Find the total no of orders corresponding to each delivery status by ignoring the case in delivery status. Status with highest no of orders should be at the top.

SELECT status, COUNT(*) AS Total_orders
FROM sales_order
GROUP BY status;


-- 1st way to ignore the case
-- Adding some conditions to ignnore the case insensitive i.e Following query can make a new column updated_status which contains the small completed status in Completed from

SELECT status, 
CASE WHEN status = 'completed' 
        	THEN 'Completed'
     ELSE status
   END AS updated_status
FROM sales_order;


SELECT updated_status, COUNT(*) AS Total_orders
FROM (SELECT status,                             -- This sub query is used to ignore the case of rows data and create the new column with simpliar words like completed To Completed
	     CASE WHEN status = 'completed' 
				  THEN 'Completed'
		       ELSE status
	     END AS updated_status
	  FROM sales_order) sq 
GROUP BY updated_status
ORDER BY Total_orders DESC;

-- 2nd way to ignore the case
SELECT LOWER(status), COUNT(*) AS Total_orders
FROM sales_order
GROUP BY LOWER(status)
ORDER BY Total_orders DESC;


-- 8. Write a query to identify the total products purchased by each customer

SELECT * FROM sales_order;

-- SELECT c.name, COUNT(*) Total_products_purchased
-- FROM sales_order s
-- INNER JOIN customers c
-- ON s.customer_id = c.id
-- GROUP BY c.name;

SELECT c.name, SUM(s.quantity) Total_products_purchased
FROM sales_order s
INNER JOIN customers c
ON s.customer_id = c.id
-- WHERE s.status NOT IN ('Rejected', 'Cancelled')
GROUP BY c.name;


-- 9. Display the total sales and average sales done for each day.

SELECT * FROM sales_order;
SELECT * FROM products;

-- SELECT order_date, price 
-- FROM sales_order s
-- JOIN products p
-- ON p.id = s.prod_id;

SELECT order_date, SUM(price * quantity) AS Total_sales, AVG(price) AS Average_sales 
FROM sales_order s
JOIN products p
ON p.id = s.prod_id
GROUP BY order_date
ORDER BY order_date;


-- 10. Display the customer name, employee name and total sale amount of all orders which are either on hold or pending.

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


SELECT c.name AS Customer_name, e.name AS Employee_name, SUM(p.price * quantity)
FROM sales_order s
JOIN employees e ON s.emp_id = e.id
JOIN products p ON s.prod_id = p.id
JOIN customers c On s.customer_id = c.id
WHERE s.status IN ('On Hold', 'Pending')
GROUP BY c.name, e.name;


-- 11. Fetch all the orders which were neither completed/pending or were handled by the employee Abrar. Display employee name and all details or order.

SELECT e.name AS Emp_name, s.*
FROM sales_order s
INNER JOIN employees e 
ON s.emp_id = e.id
WHERE LOWER(status) NOT IN ('completed', 'pending')
OR e.name like '%Abrar%'; 


-- 12. Fetch the orders which cost more than 2000 but did not include the macbook pro. Print the total sale amount as well.

SELECT * FROM products;
SELECT * FROM sales_order;

-- SELECT s.order_id, s.quantity, s.prod_id, p.price, (s.quantity * p.price) AS Total_cost, (s.quantity * p.price) AS Total_sale
-- FROM sales_order s
-- INNER JOIN products p
-- ON s.prod_id = p.id
-- WHERE (s.quantity * p.price) > 2000 AND LOWER(p.name) NOT LIKE '%macbook%'; 

SELECT s.*, p.price, (s.quantity * p.price) AS Total_cost, (s.quantity * p.price) AS Total_sale
FROM sales_order s
INNER JOIN products p
ON s.prod_id = p.id
WHERE (s.quantity * p.price) > 2000 AND LOWER(p.name) NOT LIKE '%macbook%'; 


-- 13. Identify the customers who have not purchased any product yet.

SELECT * FROM customers;
SELECT * FROM sales_order;

-- 1st way
SELECT name AS Not_Purchased_any_product
FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id 
FROM sales_order);

-- 2nd way
SELECT c.name AS Not_Purchased_any_product
FROM sales_order s
RIGHT JOIN customers c
ON s.customer_id = c.id
WHERE s.order_id IS NULL;

-- 3rd way
SELECT c.name AS Not_Purchased_any_product
FROM customers c
LEFT JOIN sales_order s
ON s.customer_id = c.id
WHERE s.order_id IS NULL;


-- 14. Write a query to identify the total products purchased by each customer. Return all customers irrespective of wether they have made a purchase or not. 
--     Sort the result with highest no of orders at the top.

SELECT * FROM customers;
SELECT * FROM sales_order;

SELECT c.name, COALESCE(SUM(s.quantity), 0) AS Total_products_purchased
FROM sales_order s
RIGHT JOIN customers c
ON s.customer_id = c.id
GROUP BY c.name
ORDER BY Total_products_purchased DESC;


-- 15. Corresponding to each employee, display the total sales they made of all the completed orders. Display total sales as 0 if an employee made no sales yet

SELECT * FROM employees;
SELECT * FROM sales_order;
SELECT * FROM products;

SELECT e.name AS Employee_Name, COALESCE(SUM(quantity * p.price ), 0) AS Total_sales
FROM sales_order s
JOIN products p
ON s.prod_id = p.id
RIGHT JOIN employees e
    ON s.emp_id = e.id 
    AND LOWER(s.status) = 'completed' -- OR s.emp_id IS NULL
GROUP BY e.name
ORDER BY Total_sales DESC;


-- 16. Re-write the above query so as to display the total sales made by each employee corresponding to each customer. 
--     If an employee has not served a customer yet then display "-" under the customer.

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM sales_order;

SELECT e.name AS Employee_Name, COALESCE(c.name, '-') AS Customer_name, COALESCE(SUM(quantity * p.price ), 0) AS Total_sales
FROM sales_order s
JOIN products p
ON s.prod_id = p.id
JOIN customers c
ON s.customer_id = c.id
RIGHT JOIN employees e
    ON s.emp_id = e.id 
    AND LOWER(s.status) = 'completed'
GROUP BY c.name, e.name
ORDER BY 1, 2;


-- 17. Re-write above query so as to display only those records where the total sales is above 1000

SELECT e.name AS Employee_Name, COALESCE(c.name, '-') AS Customer_name, COALESCE(SUM(quantity * p.price ), 0) AS Total_sales
FROM sales_order s
JOIN products p
ON s.prod_id = p.id
JOIN customers c
ON s.customer_id = c.id
RIGHT JOIN employees e
    ON s.emp_id = e.id 
    AND LOWER(s.status) = 'completed'
GROUP BY c.name, e.name
HAVING Total_sales > 1000
ORDER BY 1, 2;


-- 18. Identify employees who have served more than 2 customer.

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM sales_order;


SELECT e.name AS Employees, COUNT(DISTINCT c.name) AS Customers
FROM sales_order s
INNER JOIN employees e
ON s.emp_id = e.id
INNER JOIN customers c
ON s.customer_id = c.id
GROUP BY e.name
HAVING Customers > 2
ORDER BY 1;


-- 19. Identify the customers who have purchased more than 5 products
 
SELECT * FROM customers;
SELECT * FROM sales_order;

SELECT c.name AS Customer, SUM(s.quantity) AS Total_products
FROM sales_order s
INNER JOIN customers c
ON s.customer_id = c.id AND LOWER(s.status) = 'completed'
GROUP BY c.name
HAVING Total_products > 5;
 

-- 20. Identify customers whose average purchase cost exceeds the average sale of all the orders.

SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM sales_order;

SELECT AVG(quantity * price)
FROM sales_order s
INNER JOIN products p
ON s.prod_id = p.id;


SELECT c.name AS Customers,  AVG(s.quantity * p.price)
FROM sales_order s
INNER JOIN customers c
ON s.customer_id = c.id
INNER JOIN products p
ON s.prod_id = p.id
GROUP BY c.name
HAVING AVG(s.quantity * p.price) > ( SELECT AVG(quantity * price)
									 FROM sales_order s
									 INNER JOIN products p
									 ON s.prod_id = p.id);
