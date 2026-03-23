CREATE DATABASE Collage_Joins;

USE Collage_Joins;

CREATE TABLE employee
( 
      emp_id      VARCHAR(20),
      emp_name    VARCHAR(50),
      salary      INT,
      dept_id     VARCHAR(20),
      manager_id  VARCHAR(20)
);

INSERT INTO employee (emp_id, emp_name, salary, dept_id, manager_id)
VALUES
('E1', 'Rahul', 15000, 'D1', 'M1'),
('E2', 'Manoj', 15000, 'D1', 'M1'),
('E3', 'James', 55000, 'D2', 'M2'),
('E4', 'Michael', 25000, 'D2', 'M2'),
('E5', 'Ali', 20000, 'D10', 'M3'),
('E6', 'Robin', 35000, 'D10', 'M3');


CREATE TABLE department
(
	dept_id     VARCHAR(20),
    dept_name   VARCHAR(50)
);

INSERT INTO department (dept_id, dept_name)
VALUES
('D1', 'IT'),
('D2', 'HR'),
('D3', 'Finance'),
('D4', 'Admin');


CREATE TABLE manager
( 
     manager_id     VARCHAR(20),
     manager_name   VARCHAR(50),
     dept_id        VARCHAR(20)
);

INSERT INTO manager (manager_id, manager_name, dept_id)
VALUES
('M1', 'Prem', 'D3'),
('M2', 'Shripadh', 'D4'),
('M3', 'Nick', 'D1'),
('M4', 'Cory', 'D1');


CREATE TABLE projects
(
     project_id      VARCHAR(20),
     project_name    VARCHAR(100),
     team_member_id  VARCHAR(20)
);

INSERT INTO projects (project_id, project_name, team_member_id)
VALUES
('P1', 'Data Migration', 'E1'),
('P1', 'Data Migration', 'E2'),
('P1', 'Data Migration', 'M3'),
('P2', 'ETL Tool', 'E1'),
('P2', 'ETL Tool', 'M4');


SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;


-- Outer Join
      • Left Outer Join   OR   Left Join
      • Right Outer Join  OR   Right Join
      • Full Outer Join   OR   Full Join


-- Fetch the employee name and the department name they belong to.

-- 1st we have to find which tables we required to achive the output
-- Check the required tables and join the similar Data column
-- In this case we need to use employee AND department TABLES 

-- INNER JOIN / JOIN     Both Are Inner join

SELECT e.emp_name, d.dept_name
FROM employee e      -- here e is the Alias name   This syntax also we can use --> FROM employee AS e
INNER JOIN department d
ON e.dept_id = d.dept_id;     -- ON is used to specify the condtion to Join the tables i.e What is the join condition? What are the columns on which this two tables are joined
-- When ever we are trying to join two table that time we have to specify some conditions to Join this two table  
-- We can join this two tables based on some columns
-- To Join first we can check in both tables what are the columns have same data By using this columns we can join two tables (Does not matter column name same or not but 
--  data must be kind of similar)

-- Output =>
/*
	emp_name    dept_name
	'Rahul'     'IT'
	'Manoj'     'IT'
	'James'     'HR'
	'Michael'   'HR'
*/


SELECT e.emp_name, d.dept_name
FROM employee e              -- This table is refered as left table
JOIN department d            -- This table is refered as right table
ON e.dept_id = d.dept_id;    -- Join condition

-- Inner join only display the matching data form this both tables  (e.dept_id and d.dept_id It returns only matching data rows)



-- Fetch All the employee name and the department name they belong to.

-- Left Join

-- Left Join -> Left side table will take priority
-- It can returns similar data form both tables and also returs unmatched data form left table

-- left join = inner join  + Any additional records in the left table
 
SELECT e.emp_name, d.dept_name
FROM employee e                   -- This table is refered as left table
LEFT JOIN department d            -- This table is refered as right table
ON e.dept_id = d.dept_id;         -- Condition to join the data

-- Output =>
/*
 	emp_name   dept_name
 	'Rahul'    'IT'
 	'Manoj'    'IT'
 	'James'    'HR'
 	'Michael'  'HR'
 	'Ali'       NULL
 	'Robin'     NULL
*/


-- Right join

-- Right Join -> Right side table will take priority
-- It can returns similar data form both tables and also returs unmatched data form Right table

-- Right join = inner join  + Any additional records in the Right table

SELECT e.emp_name, d.dept_name
FROM employee e           
RIGHT JOIN department d    
ON e.dept_id = d.dept_id; 

-- Output =>
/*
	emp_name    dept_name
	'Rahul'     'IT'
	'Manoj'     'IT'
	'James'     'HR'
	'Michael'   'HR'
	NULL        'Finance'
	NULL        'Admin'
*/



-- Fetch details of All emp, their manager, their department and the projects they works on.

SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM manager;
SELECT * FROM projects;


SELECT e.emp_name AS Emp_Name,  d.dept_name AS Dept_Name,  m.manager_name AS Manager_Name,  p.project_name
FROM employee e
LEFT JOIN department d  ON e.dept_id = d.dept_id
INNER JOIN manager m  ON e.manager_id = m.manager_id     -- This whole tables is treated as left table for project table while joining
LEFT JOIN projects p  ON e.emp_id = p.team_member_id; 
 
-- Output =>
/*
       Emp_Name    dept_name     Manager_Name    project_name
       'Rahul'       'IT'         'Prem'        'Data Migration'
	   'Manoj'       'IT'         'Prem'        'Data Migration'
       'Rahul'       'IT'         'Prem'        'ETL Tool'
       'James'       'HR'        'Shripadh'       NULL
	   'Michael'     'HR'        'Shripadh'       NULL
         'Ali'        NULL         'Nick'         NULL
        'Robin'       NULL         'Nick'         NULL

*/

-- Full Join   OR    Full outer join

-- Full Join = Inner Join
--             + all remaining records from left table (return null value for any column fetch)
--             + all remaining records from Right table (return null value for any column fetch)


-- SELECT e.emp_name, d.dept_name
-- FROM employee e
-- FULL JOIN department d  ON  e.dept_id = d.dept_id;


SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d  ON  e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employee e
RIGHT JOIN department d  ON  e.dept_id = d.dept_id;


-- Output => 
/*
       emp_name       dept_name
       'Rahul'          'IT'
	   'Manoj'          'IT'
	   'James'          'HR'
       'Michael'        'HR'
         'Ali'          NULL
        'Robin'         NULL
          NULL        'Finance'
          NULL         'Admin'

*/



-- Cross Join
-- Cross Join returns cartesion product.alter

SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;    

-- Cross Join does not need the ON condition to join the tables  BCZ  It can match every record from employee with every record from department table

-- In this every single employee from the employee table was matched with every single department from the department table
-- Output contains ( No. of records form left table  *  No. of records form right table )  records
-- Output =>
/*
     emp_name    dept_name
	  'Rahul'     'IT'
	  'Rahul'     'HR'
	  'Rahul'   'Finance'
	  'Rahul'    'Admin'
	  'Manoj'     'IT'
	  'Manoj'     'HR'
	  'Manoj'   'Finance'
	  'Manoj'    'Admin'
	  'James'     'IT'
	  'James'     'HR'
	  'James'  'Finance'
	  'James'   'Admin'
	 'Michael'   'IT'
	 'Michael'   'HR'
	 'Michael' 'Finance'
	 'Michael' 'Admin'
	  'Ali'      'IT'
	  'Ali'      'HR'
	  'Ali'    'Finance'
	  'Ali'     'Admin'
	  'Robin'    'IT'
	  'Robin'    'HR'
	  'Robin' 'Finance'
	  'Robin'  'Admin'
*/

-- Example To unserstand cross join why to use it

CREATE TABLE company
(
     company_id      VARCHAR(10),
     company_name    VARCHAR(50),
     location        VARCHAR(20)
);

INSERT INTO company VALUES ('C001', 'My company', 'Solapur');

SELECT * FROM company;

-- Write a query to fetch the employee name and their corresponding department name.
-- Also make sure to display the company name and the company location corresponding to each employee

SELECT e.emp_name, d.dept_name, c.company_name, c.location
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
CROSS JOIN company c; 

-- Output =>
/*
       emp_name    dept_name     company_name    location
        'Rahul'      'IT'         'My company'   'Solapur'
        'Manoj'      'IT'         'My company'   'Solapur'
        'James'      'HR'         'My company'   'Solapur'
	    'Michael'    'HR'         'My company'   'Solapur'

*/



-- Natural Join
-- IN natural join SQL will decide what is a join condition so based on which column the join should happen will be decided by the SQL not by the user and that can actully
--   measure problem while using natural join

SELECT e.emp_name, d.dept_name
FROM employee e
NATURAL JOIN department d;

-- In Also natural join we don't need to use join condition  iF we use ON condition then SQL can through an error 
--   BCZ  SQl will decide on which column join should happen
-- SQL can decide by column name which is join condition i.e SQL goes in both tables and it will check are there any column sharing the same name then it can join

-- SQL joined both table by dept_id by this column BCZ  both table have same name column
-- Output =>
/*
   emp_name    dept_name
    'Rahul'      'IT'
    'Manoj'      'IT'
    'James'      'HR'
    'Michael'    'HR'
*/

-- Natural join provide output like inner join  but there are certion differences

ALTER TABLE department RENAME COLUMN dept_id TO id;
SELECT * FROM department;

SELECT e.emp_name, d.dept_name
FROM employee e
NATURAL JOIN department d;

-- department table donot have column like dept_id so both table donot have any same name column then Natural Join just do a cross join i.e It will try to match every record form 
--   employee table with department table


 -- INP
 -- Natural Join just do a INNER JOIN IF both tables shareing same name column
 -- If not both table do not have any same name column then Natural Join just do a CROSS JOIN
 -- If the multiple column shareing same name in both  table that time Join will happen on all of those columns
 
 
CREATE TABLE family
(
      member_id    VARCHAR(10),
      name         VARCHAR(50),
      age          INT,
      parent_id    VARCHAR(10)
);
 
INSERT INTO family VALUES('F1', 'David', 4, 'F5');
INSERT INTO family VALUES('F2', 'Carol', 10, 'F5');
INSERT INTO family VALUES('F3', 'Michael', 12, 'F5');
INSERT INTO family (member_id, name, age) VALUES('F4', 'Johnson', 36);
INSERT INTO family VALUES('F5', 'Maryam', 40, 'F6');
INSERT INTO family (member_id, name, age) VALUES('F6', 'Stewart', 70);
INSERT INTO family VALUES('F7', 'Rohan', 6, 'F4');
INSERT INTO family VALUES('F8', 'Asha', 8, 'F4');
 
 
-- Self Join
-- Self Join as the name suggest is when you join a table to it self
 
SELECT * FROM family;
 
SELECT child.name AS Child_Name, child.age AS Child_Age, parent.name AS Parent_Name, parent.age AS Parent_Age
FROM family as child
JOIN family as parent ON child.parent_id = parent.member_id;



-- In self join there is no seperate keyword to self join we just use the regular join i.e Inner Join to do Self Join
 
 
SELECT child.name AS Child_Name, child.age AS Child_Age, parent.name AS Parent_Name, parent.age AS Parent_Age
FROM family as child
LEFT JOIN family as parent ON child.parent_id = parent.member_id;    -- It can return chids who do not have an parents


 