
-- To open the CSV file in MySQL, you can load it into a table using the LOAD DATA statement. Here’s a step-by-step guide:
-- 1 Prepare the table

SHOW DATABASES;

create DATABASE test_db2;
use test_db2;

show tables;
CREATE TABLE employees (
    ID INT NOT NULL,
    Name VARCHAR(100),
    Department VARCHAR(100)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SELECT * FROM employees;


SHOW VARIABLES LIKE 'secure_file_priv';