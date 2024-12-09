SHOW DATABASES;

CREATE DATABASE abc_db;

use abc_db;

GRANT privileges ON abc_db.* TO 'hemant'@'localhost';

FLUSH PRIVILEGES;


select user, host from mysql.db where db = 'abc_db';

show tables;

CREATE TABLE table1 (
  column1 int,
  column2 varchar(10)
);

CREATE TABLE table2 (
  column1 int,
  column2 float
);

CREATE TABLE table3 (
  column1 float,
  column2 int
);




-- Renaming is not possible in mysql but we can perform it by another way
-- step 1: create a new database
CREATE DATABASE abc_new_db;

--step 2:Move All Tables to the New Database: You can use the RENAME TABLE command to move tables one by one:

RENAME TABLE abc_db.table1 TO abc_new_db.table1;
RENAME TABLE abc_db.table2 TO abc_new_db.table2;
RENAME TABLE abc_db.table3 TO abc_new_db.table3;


-- step 3: Drop the Old Database: Once you’ve moved all the tables and verified the new database, you can drop the old database
DROP DATABASE abc_db;



-- to check;
SHOW DATABASES;

use abc_new_db;

SHOW TABLES;

-- now drop database
drop database abc_new_db;