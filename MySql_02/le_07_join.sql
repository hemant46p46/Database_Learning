SHOW DATABASES;

create database practice_join;

use practice_join;

drop table employees;
drop table departments;


CREATE TABLE employees (
    id INT UNIQUE PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    department_id INT,
    date_of_join DATE,
    salary FLOAT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);


CREATE TABLE departments (
    id INT UNIQUE PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);


INSERT INTO departments (id, name) VALUES
(201, 'HR'),
(204, 'Engineering'),
(208, 'Sales'),
(209, 'Marketing'),
(210, 'Finance'),
(206, 'Operations'),
(205, 'IT'),
(207, 'Support'),
(202, 'Legal'),
(203, 'Research');


INSERT INTO employees (id, name, department_id, date_of_join, salary) VALUES
(1, 'Alice', 209, '2022-01-15', 50000.0),
(2, 'Bob', 204, '2021-11-20', 75000.0),
(3, 'Charlie', 210, '2020-06-01', 55000.0),
(4, 'Diana', 204, '2019-09-10', 60000.0),
(5, 'Eve', 201, '2018-03-25', 70000.0),
(6, 'Frank', 206, '2023-05-05', 65000.0),
(7, 'Grace', 203, '2021-12-12', 48000.0),
(8, 'Hank', 208, '2020-07-07', 52000.0),
(9, 'Ivy', 205, '2019-10-20', 62000.0),
(10, 'Jack', 202, '2023-02-15', 58000.0);




INSERT INTO employees (id, name, department_id, date_of_join, salary) VALUES
(11, 'Kevin', 208, '2020-04-18', 52000.0),
(12, 'Laura', 203, '2021-03-10', 58000.0),
(13, 'Mia', 205, '2019-07-22', 63000.0),
(14, 'Nathan', 202, '2022-02-15', 49000.0),
(15, 'Olivia', 207, '2023-01-05', 77000.0),
(16, 'Paul', 201, '2020-08-12', 68000.0),
(17, 'Quinn', 209, '2018-06-30', 71000.0),
(18, 'Rachel', 204, '2023-09-01', 46000.0),
(19, 'Steve', 206, '2022-11-20', 65000.0),
(20, 'Tina', 210, '2021-01-25', 54000.0);



select * from employees;
SELECT * FROM departments;

-- 1: inner join
select e.id, e.name, e.date_of_join, d.name
from employees e inner join departments d
on e.department_id = d.id order by e.id;


-- 2: Left Join
select e.id, e.name, e.date_of_join, d.name
from employees e left join departments d
on e.department_id = d.id;


-- 3: Right Join
select e.id, e.name, e.date_of_join, d.name
from employees e right join departments d
on e.department_id = d.id;


-- 4: Cross Join
select e.id as id, e.name as name, d.name as department_name
from employees e cross join departments d
on e.department_id = d.id;



-- 5: Full Join
select e.id as id, e.name as name, d.name as department_name
from employees e left join departments d
on e.department_id = d.id
union
select e.id as id, e.name as name, d.name as department_name
from employees e right join departments d
on e.department_id = d.id;



-- 6: Self Join
select e.id as id, e.name as name, e.department_id as department_id
from employees e join  employees e1
on e.department_id = e1.department_id where e1.id != e.id;


SHOW INDEXES FROM employees;

SHOW INDEXES FROM departments;