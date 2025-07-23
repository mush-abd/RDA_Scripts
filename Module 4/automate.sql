-- automate to backup the database
-- create a cron job to automate the backup process
-- truncate tables in the dateabase
-- restore the database from the backup


-- download the sakila database by running the following command:
-- wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_mysql_dump.sql

-- create the sakila database
CREATE DATABASE sakila;

-- use the sakila database
USE sakila;

-- import the sakila database by running the following command:
source sakila_mysql_dump.sql


-- create a bash script to automate the backup process

-- give the script execute permissions
-- chmode +x backup_sakila.sh

-- make the backup folder
-- mkdir -p ./backups

-- setting up the cron job to run the backup script every day at 2 AM
-- crontab -e

-- add the following line to the crontab file
-- */2 * * * * /home/project/sqlbackup.sh > /home/project/backup.log

-- start the cron service
-- sudo service cron start

-- Truncate datables in the sakila database
-- create a bash script to truncate the tables

-- give the script execute permissions
-- chmod +x truncate_sakila.sh

-- rum the truncate script
-- ./truncate_sakila.sh

