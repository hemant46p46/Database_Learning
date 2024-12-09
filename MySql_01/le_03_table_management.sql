
show DATABASES;
create DATABASE db_table_manage;
use db_table_manage;
-------------------------------------- 1. Show Tables -------------------------------------
show tables;
show full tables;

show tables in db_table_manage;
show tables from db_table_manage;

show tables from db_table_manage LIKE "stud%";

show tables in mysql like "time%";
show tables in mysql like "%zone%";
SHOW TABLES FROM sakilla WHERE table_type= "VIEW";



--------------------------------------2. Create Tables -------------------------------------

-- CREATE TABLE [IF NOT EXISTS] table_name(
--     column_definition1,
--     column_definition2,
--     ........,
--     table_constraints
-- );


CREATE TABLE employee_table(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(45) NOT NULL,
    occupation varchar(35) NOT NULL,
    age int NOT NULL,
    PRIMARY KEY (id)
);

DESC employee_table;
DESC employee;

-------------------------------------- 3. Create Tables -------------------------------------
-- The ALTER statement is always used with "ADD", "DROP" and "MODIFY" commands according to the situation.

-- ALTER TABLE table_name
-- ADD new_column_name column_definition
-- [ FIRST | AFTER column_name ];

ALTER Table employee_table add city VARCHAR(40);

ALTER Table employee_table add salary FLOAT AFTER city;
ALTER Table employee_table add DOJ DATE AFTER city;


ALTER Table employee_table MODIFY city VARCHAR(45);

ALTER Table employee_table DROP DOJ;

ALTER Table employee_table CHANGE COLUMN name empname VARCHAR(50);

ALTER Table employee_table RENAME to employee;
ALTER Table employee RENAME to employee_name;


-------------------------------------- 3. Create Temporary Tables -------------------------------------
CREATE TEMPORARY TABLE students (
    student_name VARCHAR(40) NOT NULL,
    total_marks DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    total_subjects INT UNSIGNED NOT NULL DEFAULT 0
)

select * from students;

INSERT INTO students(student_name, total_marks, total_subjects) VALUES
('Joseph', 150.75, 2), ('Peter',  180.76, 2);



show tables;




-- Creation of view
show databases;
use db_test2;
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    trainer VARCHAR(100) NOT NULL,
    course_fee DECIMAL(10, 2) NOT NULL
);
show tables;

INSERT INTO course (course_name, trainer, course_fee) VALUES
('Introduction to Programming', 'John Doe', 200.00),
('Web Development Basics', 'Jane Smith', 250.00),
('Data Science with Python', 'Alice Johnson', 300.00),
 ('Machine Learning Fundamentals', 'Bob Brown', 350.00),
('Database Management Systems', 'Emily Davis', 280.00),
 ('Digital Marketing Strategies', 'Chris Wilson', 220.00),
 ('Cybersecurity Essentials', 'Mary White', 400.00),
('Cloud Computing Basics', 'David Green', 320.00),
('Mobile App Development', 'Sarah Black', 270.00),
('Project Management Principles', 'Michael Gray', 230.00);

select * from course;

CREATE VIEW trainer AS SELECT course_name, trainer from course;
select * from trainer;
show tables;

DROP View trainer;

-- INDEX
CREATE TABLE Shirts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(35),
    size ENUM('small','medium','large','x-large')
);

INSERT INTO Shirts(id, name, size) VALUES
(1, 't-shirt', 'medium'),
(2, 'casual-shirt', 'small'),
(3, 'formal-shirt', 'large');

CREATE INDEX idx_name on Shirts(name);

SELECT * FROM Shirts use INDEX(idx_name);


