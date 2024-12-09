SHOW DATABASES;

-- copying database from practice_join database.
-- Step - 1 : Create the new database
CREATE DATABASE query_practice_db;

-- Step - 2 : Clone the schema and data: For each table in the existing database, you can copy it to the new database:
CREATE TABLE query_practice_db.employees as SELECT * FROM practice_join.employees;
CREATE TABLE query_practice_db.departments as SELECT * FROM practice_join.departments;


-- Step - 3 : Copy multiple tables: Loop through the tables in your application or write a script to automate this for all tables.




use query_practice_db;
SHOW TABLES;
SHOW TABLE STATUS;

SELECT * FROM employees;
SELECT * FROM departments;



--------------------- 1 WHERE Clause ---------------------
-- filter rows based on specific conditions.
-- 1 : Get employees with a salary greater than 50,000
SELECT * FROM employees where salary>60000;


-- 2 Find employees in the HR department
SELECT id INTO @hr_id from departments WHERE name = 'hr';

SELECT * FROM employees WHERE department_id = @hr_id;


-- 3 Get employees who join after 2022
SELECT * FROM employees where date_of_join > '2022-01-01';


-- 4 list employees with names starting with 'A'
SELECT * FROM employees where name like 'A%';

-- 5 : find employees between 60000 and 65000
SELECT * FROM employees WHERE salary between 60000 and 65000;

-- 6 : Get employees not in Finance department
select id into @finance_id from departments where name = 'Finance';
SELECT * FROM employees where department_id != @finance_id;


-- 7 : Find Employees whose names contains 'e'
SELECT * FROM employees where name like '%e%';


-- 8: Get employees who joined in 2022
SELECT * FROM employees where YEAR(date_of_join) = 2022;



-- 9 List employees with NULL salaries
SELECT * FROM employees where salary IS NULL;

-- 10 : employees with odd ids
SELECT * FROM employees where id%2=1;



------------------------ DISTINCT Clause ------------------------
-- Returns UNIQUE values from column

-- 1: Get distinct departments from employees:
select DISTINCT department_id from employees;

-- 2: list all unique employees join years
select DISTINCT YEAR(date_of_join) as join_year FROM employees;


-- 3: Find unique salaries
select DISTINCT salary from employees;


-- 4: List unique department names
select DISTINCT name from employees;


-- 5: Get distinct department IDs where employees exists
select DISTINCT department_id from employees where salary>60000;

-- 6 List distinct combinations of department and join year
select distinct department_id, YEAR(date_of_join) from employees;

-- 7 Find unique first letters of employee names
select DISTINCT LEFT(name, 1) from employees;

-- 8 List distinct employees IDs
SELECT DISTINCT id from employees;

-- 9 Get distinct employees salaries above 70000
select distinct salary from employees WHERE salary > 70000;

-- 10 List distinct department names of employees earning above 70,000:
SELECT DISTINCT departments.name
FROM employees
JOIN departments ON employees.department_id = departments.id
WHERE salary > 70000;




------------------------------------ 3 FROM Clause ------------------------------------
-- 1: select all employees
select * from employees;

-- 2 select department names
select * from departments;

-- 3 combine data from employees and departments
select employees.name, departments.name
from employees join departments on employees.department_id = departments.id;


-- 4 select employees grouped by department
select count(*), department_id from employees group by department_id;


-- 5 Query using a subquery in the FROM clause
select * from (select * from employees where salary > 70000) as high_salary_employee;


-- 6 Count employees per department
SELECT department_id, count(*) from employees group by department_id;


-- 7 Retrieve data from multiple table
select e.name, d.name as department_name
from employees e, departments d
where e.department_id = d.id;


-- 8 Query employees using an alias for the table
select e.name from employees as e;


-- 9 use multiple subqueries
select * from (select * from employees where salary < 60000) as subquery;


-- 10 Retrieve department data stored alphabetically
select name from departments order by name;


------------------------------ 4 ORDER BY ------------------------------
-- sort the result set

-- 1 sort employees by salary in ascending order
select * from employees order by salary asc;

-- 2 sort employees by salary in descending order
SELECT * FROM employees order by salary desc;


-- 3 sort by department  and then by salary;
SELECT * FROM employees order by department_id, salary;
SELECT * FROM employees order by department_id, salary desc;

SELECT * FROM employees order by department_id desc, salary;
SELECT * FROM employees order by department_id desc, salary desc;


-- 4 sort by date of joining
SELECT * FROM employees order by date_of_join;


--5 order employees by name alphabetically
SELECT * FROM employees order by name;

-- 6 Sort by employee name in reverse alphabetical order
SELECT * FROM employees order by name desc;

-- 7 Order by department and name
select * from employees order by department_id, name;

-- 8 Order by year of joining
select * from employees order by year(date_of_join);


------------------------   5 GROUP BY Clause -------------------------
-- Groups rows sharing a  property
-- 1 Group employees by department
select department_id, count(*) from employees group by department_id;

-- 2 Get average salary per department
select department_id, avg(salary) from employees group by department_id;

-- 3 Count employees joined in each year
SELECT year(date_of_join), count(*) from employees group by year(date_of_join);


