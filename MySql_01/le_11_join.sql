create DATABASE join_practices;

use join_practices;

create table employees(
    id int PRIMARY KEY,
    name VARCHAR(40)
);
create table department(
    id int PRIMARY KEY,
    department VARCHAR(20)
);

insert into employees (id, name) values (1, "Alice"), (2, "Bob"), (3, "Charlie");

insert into department (id, department) values (1, "IT"), (3, "HR");

SELECT * FROM employees;
SELECT * FROM department;

-- INNER JOIN
SELECT employees.name, department.department FROM employees INNER JOIN department ON employees.id = department.id;