-- Hands-on Lab: MySQL Configuration, Storage Engines, and System Tables

-- download the database by running the following command:
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
-- use curl if wget is not available
-- curl -O https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql


-- create the database
CREATE DATABASE IF NOT EXISTS world;

-- use the database
USE world;

-- use source to complete the world database
SOURCE world_mysql_script.sql;

-- show the tables in the world database
SHOW TABLES;

-- to see the available storage engines
SHOW ENGINES;

-- make a database engine using csv storage engine
CREATE TABLE if not exist csv_test (i INT NOT NULL, c CHAR(10) NOT NULL) ENGINE = CSV;

-- insert some data into the csv_test table
INSERT INTO csv_test VALUES (1, 'one'), (2, 'two'), (3, 'three');

-- select the data from the csv_test table
SELECT * FROM csv_test;


-- Exercise 3: Navigate the MySQL System Tables

-- show all the databases
SHOW DATABASES;

-- connect to the mysql database
USE mysql;

-- show the tables in the mysql database
SHOW TABLES;

-- show the users in the mysql database
SELECT User, Host FROM user;

-- add a new user
CREATE USER test_user;

-- query the infomation schema
show databases;

-- connnect to the information schema
USE information_schema;

-- select columns from the tables in the information schema
SELECT column_name FROM columns WHERE table_schema = 'world';

-- show the tables in the information schema

SELECT table_name, engine FROM INFORMATION_SCHEMA.TABLES 
WHERE table_name = 'country' OR table_name = 'city' 
OR table_name = 'countrylanguage' OR table_name = 'csv_test';

-- Finally, the TABLES table in the information_schema database contains information on the the size of a given table in bytes. 
-- This information is stored in two columns: data_length and index_length which stores the size of the data in the table and
-- the size of the index file for that table, respectively. Therefore, the total size of the table is the sum of the values 
-- in these two columns. This value would be given in bytes, however, if you wish to use a more convenient unit, the sum can 
-- be converted to kB by dividing by 1024. You can find the size of the tables (in kB) you queried in the previous step with 
-- the following command in the CLI:

SELECT table_name, (data_length + index_length)/1024 FROM INFORMATION_SCHEMA.TABLES 
WHERE table_name = 'country' OR table_name = 'city' 
OR table_name = 'countrylanguage' OR table_name = 'csv_test';


-- Exercise 4: Try it Yourself!

-- Try it yourself: First, connect to the world database using the CLI:
use world;

-- Try it yourself: Create a new table called MyISAM_test that uses the MYISAM storage engine.
Create table MyISAM_test (id INT NOT NULL, name VARCHAR(50)) ENGINE = MyISAM;

-- Try it yourself: Next, you’ll want to query a table in the information_schema database, 
-- but before that, you’ll have to connect to the database first. Use the CLI to connect 
-- to the information_schema database.
use information_schema;

-- Try it yourself: Using the CLI, query the TABLES table in the information_schema database
-- to display the table_name and engine columns of all tables that have table_schema = 'world'. 
-- Confirm that the table you created in this exercise is there and it has the correct storage engine.
select table_name, engine from INFORMATION_SCHEMA.tables where table_schema = 'world';
