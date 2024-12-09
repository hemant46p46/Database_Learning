show DATABASES;
CREATE DATABASE IF NOT EXISTS db1;
use db1;

create table student (
    id int primary key,
    name varchar(40),
    branch varchar(100)
);

show tables;
desc student;

INSERT INTO student VALUES(2, "Hemant Patel", "CSE");
INSERT INTO student VALUES(11, "Anshuman", "EC");

select * from student;
SELECT * FROM student WHERE name like 'A%';
SELECT * FROM student WHERE name like '%m';

INSERT INTO student VALUES(1, "Deepak", "Med"),(3, "Shivam", "BCA");

INSERT INTO student VALUES(6, "Abhay", "Civil"),(8, "Vaibhav", "MBBS"), (5, "Rimjhim", "Dentist"), (9, "Vidhi", "BCOM");

select name, branch from student WHERE id=6;



-- update query
UPDATE student SET branch='BCOM' where id=1;
SELECT * FROM student;


alter Table student add age int DEFAULT 0 after branch;

alter table student drop age;



-- delete

DELETE from student WHERE id >= 9;

show tables;

CREATE TABLE employee_detail (
    Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Working_hours VARCHAR(20)
);

alter Table employee_detail ADD Working_hours int;
alter Table employee_detail drop COLUMN Working_hours;

INSERT INTO employee_detail (Id, Name, Email, Phone, City, Working_hours) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', '123-456-7890', 'New York', '9 AM - 5 PM'),
(2, 'Bob Smith', 'bob.smith@example.com', '234-567-8901', 'Los Angeles', '10 AM - 6 PM'),
(3, 'Charlie Brown', 'charlie.brown@example.com', '345-678-9012', 'Chicago', '8 AM - 4 PM'),
(4, 'Diana Prince', 'diana.prince@example.com', '456-789-0123', 'San Francisco', '11 AM - 7 PM'),
(5, 'Edward Green', 'edward.green@example.com', '567-890-1234', 'Miami', '9 AM - 5 PM'),
(6, 'Fiona White', 'fiona.white@example.com', '678-901-2345', 'Houston', '10 AM - 6 PM'),
(7, 'George Black', 'george.black@example.com', '789-012-3456', 'Seattle', '8 AM - 4 PM'),
(8, 'Hannah Gray', 'hannah.gray@example.com', '890-123-4567', 'Boston', '11 AM - 7 PM'),
(9, 'Ian Blue', 'ian.blue@example.com', '901-234-5678', 'Phoenix', '9 AM - 5 PM'),
(10, 'Julia Red', 'julia.red@example.com', '012-345-6789', 'Denver', '10 AM - 6 PM');

SELECT * from employee_detail;
UPDATE employee_detail SET
Working_hours=7 WHERE Id=10;


SELECT Name, City from employee_detail;

SELECT Name City, SUM(Working_hours) AS "Total Working Hours"
From employee_detail Group By Name HAVING SUM(Working_hours) > 10;