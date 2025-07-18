-- first download the sql file to create the database and tables
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql

-- get the sql file to update the tables
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_A.sql

-- create a database 
CREATE DATABASE world;

-- use the database
USE world;

-- source the sql file to create the tables
SOURCE world_mysql_script.sql;

-- see the tables created
SHOW TABLES;


-- retrieve all the Canada (countrycode=’CAN’) related records from the countrylanguage table
SELECT * FROM countrylanguage WHERE countrycode = 'CAN';
-- returns emply set, 
-- this is because the countrycode 'CAN' does not exist in the country table
-- so we need to update the country table first
-- update the country table to add the countrycode 'CAN'
SOURCE world_mysql_update_A.sql;

-- switch to the terminal and run the following command to backup the database
-- $ mysqldump --host=mysql --port=3306 --user=root --password world countrylanguage > world_countrylanguage_mysql_backup.sql

-- to view the backup file, you can use the following command
-- $ cat world_countrylanguage_mysql_backup.sql


-- to restore the database, you can use the following command
-- $ mysql --host=mysql --port=3306 --user=root --password world < world_countrylanguage_mysql_backup.sql


-- Practice Exercise 1: Perform Logical Backup and Restore

-- 1. Fetch the necessary scripts files to the Cloud IDE user session storage using Cloud IDE Terminal.
-- $ wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_script.sql
-- $ wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0231EN-SkillsNetwork/datasets/World/world_mysql_update_1.sql

-- create a database
create database newworld;

use newworld;

-- source the sql file to create the tables
SOURCE world_mysql_script.sql;

-- update the database to add the country code 'BGD'
SOURCE world_mysql_update_1.sql;

-- Perform a logical backup of the city table.

-- $ mysqldump --host=mysql --port=3306 --user=root --password world_P1 city > world_P1_city_mysql_backup.sql

-- Drop the city table and try to restore it with the backup you created to validate if your created backup is in working state.

-- $ mysql --host=mysql --port=3306 --user=root --password --execute="DROP TABLE world_P1.city;"

-- $ mysql --host=mysql --port=3306 --user=root --password --execute="SELECT * FROM world_P1.city;"

-- $ mysql --host=mysql --port=3306 --user=root --password world_P1 < world_P1_city_mysql_backup.sql

-- $ mysql --host=mysql --port=3306 --user=root --password --execute="SELECT * FROM world_P1.city;"