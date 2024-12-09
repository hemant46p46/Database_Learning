-- if

SET @a = 100;
SET @b = 200;
SELECT "SMALLER IS";
SELECT IF(@a < @b, @a, @b);

SET @flag = FALSE;
SELECT IF(@flag, "Hello MYSQL", "HELLO Java");


-- IFNULL
SELECT IFNULL(NULL, "EXP1 IS NULL");
SELECT IFNULL("EXP1 HAS VALUE", "EXP1 IS NOT NULL");


-- NULLIF
SELECT NULLIF(10, 10);
SELECT NULLIF("HELLO", "HELLO");
SELECT NULLIF('HELLO', 'hello');
select NULLIF ('a', 'b');


--------------------------------------
SHOW DATABASES;
CREATE DATABASE control_flow_exs;
use control_flow_exs;
create table employee (employee_id int, name varchar(40), department varchar(10));
insert into employee( employee_id, name, department) values (101, "John Doe", "Sales"),
(102, "Jane Smith", "HR"), (103, "Alice Lee", "Other");

select * from employee;
alter table employee ADD column department_id int;

-- 2nd Searched CASE statement
UPDATE employee
SET department_id = 
    CASE 
        WHEN employee_id = 101 THEN 1
        WHEN employee_id = 102 THEN 2
        WHEN employee_id = 103 THEN 3
        ELSE department_id -- Retains the current value if no condition matches
    END
WHERE employee_id IN (101, 102, 103);


delete from employee WHERE employee_id IS NULL;
---------------------------------------

-- CASE

-- 1st Simple CASE Statement
SELECT employee_id, name,
    case department_id
        WHEN 1 THEN 'sales'
        WHEN 2 THEN 'hr'
        WHEN 3 THEN 'it'
        ELSE 'other'
    END as department_name
FROM employee;



-- IF statement
