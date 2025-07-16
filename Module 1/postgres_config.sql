-- PostgreSQL Instance Configuration and System Catalog

-- download the database by running the following command:
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/example-guided-project/flights_RUSSIA_small.sql

-- In the PostgreSQL CLI, enter the command \i <file_name>.
-- In your case, the file name will be the name of the file you downloaded, flights_RUSSIA_small.sql. 
-- This will restore the data into a new database called demo.

\i flights_RUSSIA_small.sql;

-- Verify that the database was properly created by entering the following command:
\dt

-- Exercise 1: Configure Your PostgreSQL Server Instance

-- A PostgreSQL server instance has a corresponding file named postgresql.conf that contains
-- the configuration parameters for the server. By modifying this file, you can enable, disable,
-- or otherwise customize the settings of your PostgreSQL server instance to best suit your needs
-- as a database administrator. While you can manually modify this postgresql.conf file and restart
-- the server for the changes to take effect, you can also edit some configuration parameters directly 
-- from the command line interface (CLI).

-- First, let’s take a look at the current setting of the wal_level parameter. 
-- You can do so by entering the following command into the CLI:
SHOW wal_level;

-- The ALTER SYSTEM command is a way to modify the global defaults of a PostgreSQL instance 
-- without having to manually edit the configuration file. Let’s give it a try and change the 
-- wal_level parameter to logical. To change the parameter, enter the following command into the CLI:
ALTER SYSTEM SET wal_level = logical;



-- Exercise 2: Navigate the System Catalog

-- The system catalog stores schema metadata, such as information about tables and columns
-- and internal bookkeeping information. In PostgreSQL, the system catalogs are regular tables 
-- in which you can add columns and insert and update values. In directly modifying the system catalogs,
-- you can cause severe problems in your system, so it is generally recommended to avoid doing so.
-- Instead, the system catalogs are updated automatically when performing other SQL commands. 
-- For example, if you run a CREATE DATABASE command, a new database is created on the disk and 
-- a new row is automatically inserted into the pg_database system catalog table, storing metadata
-- about that database.

-- First, you need to connect to the database by entering the following command:
\connect demo;


-- Start with a simple query of pg_tables, which is a system catalog containing metadata about each table in the database.
-- Let’s query it to display metadata about all the tables belonging to the bookings schema in the demo database by 
-- entering the following command into the CLI:
SELECT * FROM pg_tables WHERE schemaname = 'bookings';

-- Suppose as the database administrator, you would like to enable row-level security for the boarding_passes 
-- table in the demo database. When row security is enabled on a table, all normal access to the table for 
-- selecting or modifying rows must be specified by a row security policy. Since row security policies are not
-- the focus of this lab, we will not go in depth about specifying a policy but will simply enable it for demonstration purposes.
-- However, if you wish to learn more about this topic, you can check out the PostgreSQL documentation. 
-- To enable row security on the boarding_passes table, enter the following command in the CLI:
ALTER TABLE boarding_passes ENABLE ROW LEVEL SECURITY;

--  Use the CLI to query the pg_tables to display metadata about the tables belonging to the bookings
-- schema and confirm that the row security for the boarding_passes was successfully enabled.
SELECT * FROM pg_tables WHERE schemaname = 'bookings';

-- pg settings is a system catalog that contains the current values of all configuration parameters.
-- You can query it to display the current value of the wal_level parameter by entering the following
select * from pg_settings where name = 'wal_level';

-- changing the name of a table;
ALTER TABLE aircrafts_data RENAME TO aircraft_fleet;

-- To confirm that the table was successfully renamed, query pg_tables from the system catalog 
-- by schemaname ‘bookings’ to display the tablename column.
SELECT tablename FROM pg_tables WHERE schemaname = 'bookings';