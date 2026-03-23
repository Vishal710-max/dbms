USE Joins;

SELECT * FROM employee;

# Union
#  It is used to combine the result-set of two or more SELECT statements.
# Gives UNIQUE records

# To use it :
-- Every SELECT should have same no. of columns
-- Columns must have similar data type
-- Columns in every SELECT should be in same order
  
SELECT name from employee
UNION
SELECT name from employee;

# Union all
#  It gives all duplicates   

SELECT name from employee
UNION ALL
SELECT name from employee;