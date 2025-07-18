-- User Management and Access Control in PostgreSQL

-- loading the flight_russia database 

-- download the database by running the following command:
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/example-guided-project/flights_RUSSIA_small.sql

-- In the PostgreSQL CLI, enter the command \i <file_name>.
-- In your case, the file name will be the name of the file you downloaded, flights_RUSSIA_small.sql. 
-- This will restore the data into a new database called demo.

create database flights_russia;
\c flights_russia;

\i flights_RUSSIA_small.sql;

-- Verify that the database was properly created by entering the following command:
\dt

-- Exercise 1: Create New Roles and Grant them Relevant Privileges

-- Task A: Create a read_only role and grant it privileges
CREATE ROLE read_only;

GRANT CONNECT ON DATABASE flights_russia TO read_only;

GRANT USAGE ON SCHEMA bookings TO read_only;

GRANT SELECT ON ALL TABLES IN SCHEMA bookings TO read_only;

-- Task B: Create a read_write role and grant it privileges
CREATE ROLE read_write;

GRANT CONNECT ON DATABASE flights_russia TO read_write;

GRANT USAGE ON SCHEMA bookings TO read_write;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA bookings TO read_write;


-- Exercise 2: Add a New User and Assign them a Relevant Role

-- create a new user named mushii
CREATE USER mushii WITH PASSWORD 'password123';

-- assign the read_only role to mushii
GRANT read_only TO mushii;

-- check the privileges 
\du mushii;

-- Exercise 3: Revoke and Deny Access

--revokes select privilege on table aircrafts_data from mushii
REVOKE SELECT ON aircrafts_data FROM mushii;

-- deny the read_only role to mushii
REVOKE read_only FROM mushii;