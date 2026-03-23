USE Joins;

CREATE TABLE student(
     id    INT PRIMARY KEY,
     Name  VARCHAR(20)
);
    
INSERT INTO student (id, Name)
VALUES
(101, 'Shreyash'),
(102, 'Ram'),
(103, 'Sham');
    
SELECT *  FROM student;

CREATE TABLE cource(
	id    INT PRIMARY KEY,
    course  VARCHAR(20)
);

INSERT INTO cource (id, course)
VALUES
(102, 'English'),
(105, 'Math'),
(103, 'Science'),
(107, 'CS');

SELECT * FROM cource;

# Inner Join
#  Returns records that have matching values in both tables

# Syntax -->
-- SELECT column(s)
-- FROM tableA
-- INNER JOIN tableB
-- ON tableA.col_name = tableB.col_name;

SELECT *
FROM student
INNER JOIN cource
ON student.id = cource.id;

# Alias ->
#  Give duplicate name to tables

SELECT *
FROM student AS s
INNER JOIN cource AS c
ON s.id = c.id;



# Left Join
#  Returns all records from the left tables, and the matched records from the right tables

# Syntax -->
-- SELECT column(s)
-- FROM tableA
-- LEFT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

SELECT * 
FROM student AS s
LEFT JOIN cource AS c
ON s.id = c.id;



# Right Join
#  Returns all records from the right table, and the matched records from the left table

# Syntax -->
-- SELECT column(s)
-- FROM tableA
-- RIGHT JOIN tableB
-- ON tableA.col_name = tableB.col_name;

SELECT * 
FROM student AS s
RIGHT JOIN cource AS c
ON s.id = c.id;



# Full Join
# Returns all the records when there is a match in either left or right table

SELECT * 
FROM student AS s
LEFT JOIN cource AS c
ON s.id = c.id
UNION
SELECT * 
FROM student AS s
RIGHT JOIN cource AS c
ON s.id = c.id;


# Q) Write SQL command to display the left exclusive join  AND  right exclusive join AND Full exclusive join

-- Left Exclusive Join (NOT common)
SELECT *
FROM student AS s
LEFT JOIN cource AS c
ON s.id = c.id
WHERE c.id IS NULL;

-- Right Exclusive Join 
SELECT * 
FROM student AS s
RIGHT JOIN cource AS c
ON s.id = c.id
WHERE s.id IS NULL;

-- Full Exclusive Join
SELECT *
FROM student AS s
LEFT JOIN cource AS c
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM student AS s
RIGHT JOIN cource AS c
ON s.id = c.id
WHERE s.id  IS NULL;
 
 

# Self Join
#  It is a regular join but the table is joined with itself

# Syntax -->
-- SELECT column(s)
-- FROM table as a
-- JOIN table as b
-- ON a.col_name = b.col_name;

CREATE TABLE employee(
    id    INT PRIMARY KEY,
    name  VARCHAR(20),
    manager_name   int
);

ALTER TABLE employee  
RENAME COLUMN
manager_name TO manager_id;


INSERT INTO 
employee (id, name, manager_id)
VALUES
(101, 'AAA', 103),
(102, 'BBB', 104),
(103, 'CCC', NULL),
(104, 'DDD', 103);


# Ex ->

SELECT *
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id;


SELECT a.name as manager_name, b.name
FROM employee AS a
JOIN employee AS b
ON a.id = b.manager_id; 


SELECT *
FROM student AS s
JOIN cource AS c
ON s.id = c.id;