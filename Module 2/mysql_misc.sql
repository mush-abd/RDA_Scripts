-- MySQL Miscellaneous Commands, 
-- Managing permissions and roles
-- and other administrative tasks

-- create a new database customerorders
CREATE DATABASE customerorders;

use customerorders;

-- source the sql file to create the tables
source customerorders.sql;

-- see the tables created
SHOW TABLES;

-- create a new user by using phpmyadmin or the MySQL CLI
-- For example, to create a user named 'sales_rep' with password 'password123', you can use the following command
CREATE USER 'sales_rep' IDENTIFIED BY 'password123';
-- Grant the sales_rep user permissions to access the customerorders database
GRANT ALL PRIVILEGES ON customerorders.* TO 'sales_rep';

-- To view the permissions granted to the sales_rep user, you can use the following command
SHOW GRANTS FOR 'sales_rep';

-- complete other access tasks on phpmyadmin