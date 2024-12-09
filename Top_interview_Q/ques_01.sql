-- 01 How to check version of mysql
SHOW VARIABLES LIKE "%VERSION%";
------------------------ Creating procedure ----------------------------
DELIMITER // -- Changes the delimiter temporarily to avoid conflicts with semicolons inside the procedure body.
CREATE PROCEDURE GetAllRows(IN tableName VARCHAR(64))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tableName);
    PREPARE stmt FROM @query; -- Prepares the dynamically constructed SQL query
    EXECUTE stmt; -- Executes the prepared statement.
    DEALLOCATE PREPARE stmt; -- Frees resources used by the prepared statement.
END //
DELIMITER ; --Resets the delimiter back to semicolon.
-------------------------------------------------------------------------

------------------------ CALLING PROCEDURE ------------------------
CALL GetAllRows('employees');
-------------------------------------------------------------------




--------------------Creating database and table for queries----------------------
create DATABASE interviewQ_db;

show DATABASES;

use interviewQ_db;

show tables;

create table employees(
    emp_id int PRIMARY KEY UNIQUE,
    name VARCHAR(40),
    salary FLOAT
);

insert into employees (emp_id, name, salary) values (101, "Alex", 20034),
(103, "Bob", 321432);

UPDATE employees SET salary = 56043 WHERE emp_id=101;

select * from employees;

drop table employees;
show tables;
------------------------------------------------------------------------

-- o2 how to add column in table;
alter table employees add department_id int after name;
insert into employees (emp_id, name, department_id, salary) values (105, "Charlie", 5041 , 20034),
(102, "David", 5044 ,10021);
UPDATE employees SET department_id = 5049 WHERE emp_id = 103;
UPDATE employees SET department_id = 5044 WHERE emp_id = 101 ;

-- 03 how to drop a table
create table students (stud_id int, name VARCHAR(29));
drop table students;


------------------- creating other table---------------------------------
create table departments (
    dep_id int PRIMARY KEY UNIQUE,
    department_name VARCHAR(30)
);

insert into departments(dep_id, department_name) values (5041, "HR"), (5044, "Developer"), 
(5049, "Sales");
SELECT * from departments;
-------------------------------------------------------------------------


-- 4 set foreign key
alter Table employees
add CONSTRAINT fkDepartment FOREIGN KEY (department_id)
REFERENCES departments (dep_id)
ON DELETE SET NULL
ON UPDATE CASCADE;


SELECT * from employees;
SELECT * from departments;


SELECT e.emp_id, e.name, e.salary, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.dep_id
WHERE d.department_name = "Developer";


---------------- test tables -------------------
create table test_tbl (
    a_col int PRIMARY KEY UNIQUE,
    b_col VARCHAR(20) DEFAULT "b",
    c_col BIGINT(10),
    d_col ENUM("d1", "d2", "d3", "d4")
    );

desc TABLE test_tbl;

SELECT * FROM test_tbl;

alter Table test_tbl CHANGE COLUMN c_col c_new_col int after d_col;

-- alter table test_tbl add COLUMNS e_col int, f_col float, g_col varchar(10) after c_new_col;
alter table test_tbl add COLUMN e_col int;
alter table test_tbl add COLUMN f_col int;
alter table test_tbl add COLUMN g_col int;
alter table test_tbl drop COLUMN e_col, DROP COLUMN f_col, DROP COLUMN g_col;

alter table test_tbl
drop COLUMN f_col,
drop COLUMN g_col;



select * from employees;
alter table employees change column name emp_name varchar(30);

-- 2nd highest salary in employee table
SELECT emp_name, salary
FROM (SELECT emp_name, salary FROM employees ORDER BY salary DESC LIMIT 2) AS emp
ORDER BY salary LIMIT 1;
-- OR (Using MAX)

SELECT emp_name, salary FROM employees WHERE salary < (SELECT MAX(salary) from employees) LIMIT 1;

-- OR Using LIMIT with OFFSET
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;


-- for 3rd highest salary
SELECT emp_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;-- LIMIT 1 OFFSET 2: Skips the top 2 rows (highest and second-highest salaries) and retrieves the next row (third-highest salary).


-- 2nd minimum salary in employees table
SELECT emp_name, salary FROM employees WHERE salary > (SELECT MIN(salary) from employees) ORDER BY salary LIMIT 1;


SHOW DATABASES;
DROP DATABASE control_flow_exs;

SELECT CONCAT('DROP DATABASE ', SCHEMA_NAME, ';') FROM information_schema.SCHEMATA
WHERE SCHEMA_NAME IN ('db1', 'db_table_manage', 'db_test2', 'join_practices', 'school', 'studentdb', 'transact_1', 'variable_test');


DROP DATABASE school;

DROP DATABASE db_test2;

DROP DATABASE db1;

DROP DATABASE studentdb;

DROP DATABASE variable_test;

DROP DATABASE join_practices;

DROP DATABASE transact_1;

DROP DATABASE test_db2;



SELECT
    table_schema AS database_name,
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS size_in_mb
FROM
    information_schema.tables
GROUP BY
    table_schema
ORDER BY
    size_in_mb DESC;

