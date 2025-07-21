--  Improving Performance of Slow Queries in MySQL

-- download the database zip file by running the following command:
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/employeesdb.zip

-- unzip the file
-- unzip employeesdb.zip

-- import the database by running the following command:
-- mysql --host=mysql --port=3306 --user=root --password -t < employees.sql

-- open the MySQL CLI and connect to the database

mysql -u root -p

-- connect to the database
USE employees;

-- show the tables in the database
SHOW TABLES;


-- select all employees in the employees table
SELECT * FROM employees;

-- use explain to analyze the query
EXPLAIN SELECT * FROM employees;

-- Exercise 3: Add an Index to Your Table

SHOW INDEX FROM employees;

-- select all employees hired after 2000
SELECT * FROM employees WHERE hire_date > '2000-01-01';

-- use explain to analyze the query
EXPLAIN SELECT * FROM employees WHERE hire_date > '2000-01-01';

-- create an index on the hire_date column
CREATE INDEX idx_hire_date ON employees (hire_date);

-- verify that the index was created
SHOW INDEX FROM employees;

-- now select all employees hired after 2000 again
SELECT * FROM employees WHERE hire_date > '2000-01-01';
-- this time, the query should be faster due to the index

-- index can be dropped if not needed anymore
DROP INDEX idx_hire_date ON employees;

-- Exercise 4: Use an UNION ALL Clause

-- sometimes we need to run query containing union or or
SELECT * FROM employees WHERE first_name LIKE 'C%' OR last_name LIKE 'C%';

-- use explain to analyze the query
EXPLAIN SELECT * FROM employees WHERE first_name LIKE 'C%' OR last_name LIKE 'C%';

-- add an index on the first_name and last_name columns
CREATE INDEX idx_first_name ON employees (first_name);
CREATE INDEX idx_last_name ON employees (last_name);

-- run the query again
SELECT * FROM employees WHERE first_name LIKE 'C%' OR last_name LIKE 'C%';

--perform a union all operation
SELECT * FROM employees WHERE first_name LIKE 'C%' UNION ALL SELECT * FROM employees WHERE last_name LIKE 'C%';

-- Exercise 5: Be Selective with Your SELECT Statement
-- select only the first_name and last_name columns
SELECT first_name, last_name FROM employees;

--Practice Exercise 1: select only the salary column
SELECT salary FROM employees;

-- Practice Exercise 2: Select only the emp_no and title of employees
SELECT emp_no, title FROM titles;

-- check the performance of the query
EXPLAIN SELECT emp_no, title FROM titles;
