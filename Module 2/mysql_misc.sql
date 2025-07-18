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

-- complete other access/authorization tasks on phpmyadmin

-- encryption and decryption of data
-- MySQL does not have built-in support for encryption like PostgreSQL, but you can use functions to encrypt and decrypt data.
-- we have encrypted the following string using sha2_512
SET @key_str = SHA2('My secret passphrase', 512);


-- now suppose we want to encrypt the addressline1 column in the customer table
-- first convert the addressline1 column to a binary format
ALTER TABLE customers MODIFY COLUMN addressLine1 varbinary(255);

-- now encrypt the addressline1 column using the aes encryption with our key_str
UPDATE customers SET addressLine1 = AES_ENCRYPT(addressLine1, @key_str);

-- to decrypt the addressline1 column, we can use the AES_DECRYPT function
SELECT customerID, AES_DECRYPT(addressLine1, @key_str) AS addressLine1
FROM customers;
SELECT cast(AES_DECRYPT(addressLine1 , @key_str) as char(255)) FROM customers;