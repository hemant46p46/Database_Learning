SHOW DATABASES;

create database tbl_mn_db;

use tbl_mn_db;

-- 1: show tables
show tables;

-- 2: create table
create table students(
    s_id int unique primary key,
    s_name varchar(50),
    s_course varchar(40)
);

-- 3: describe table
desc students;

-- 4: rename table
RENAME TABLE students TO students_tbl;
-- ex: RENAME TABLE old_table1 TO new_table1, old_table2 TO new_table2;

-- 5: copy table
--     Summary of Use Cases:
--          Goal                                        Query
-- Copy only structure	                    CREATE TABLE new_table LIKE original_table;
-- Copy structure + data (basic)	        CREATE TABLE new_table AS SELECT * FROM original_table;
-- Copy structure + data + constraints	    CREATE TABLE new_table LIKE original_table;     +       INSERT INTO new_table SELECT * FROM original_table;
-- Copy specific columns	                CREATE TABLE new_table AS SELECT col1, col2 FROM original_table;
-- Copy specific rows	                    CREATE TABLE new_table AS SELECT * FROM original_table WHERE condition;
create table students_copy1 LIKE students_tbl;

create table students_copy2 as SELECT * from students_tbl;

create table students_copy3 LIKE students_tbl;
Insert into students_copy3 SELECT * FROM students_tbl;

create table students_copy4 as select s_name, s_course from students_tbl;

create table students_copy5 as select * from students_tbl where s_id>2;






-- 6: add column
alter table students_copy1 ADD COLUMN age int default 18;

-- 7: remove column
ALTER TABLE students_copy2 DROP COLUMN s_course;

-- 8: change column/rename
ALTER TABLE students_copy3 CHANGE s_course st_course varchar(20);
