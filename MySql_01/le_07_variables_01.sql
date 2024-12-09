show VARIABLES;

show VARIABLES LIKE 'max_connections';

SET @var1 = 100;

SELECT @var1 + 40;

SET @inc = 50;

SELECT @var1 + @inc;

SELECT @var1 + @inc AS var1;

SELECT @var1;

SET @myVar = 'Hello mysql';

SELECT @myVar;

SET @a = 10;
SET @b = 20;
SELECT @a + @b AS sum;

DELIMITER $$
CREATE PROCEDURE ex_procedure()
BEGIN
    DECLARE my_var INT;
    SET my_var = 10;
    SELECT my_var*2 AS result;
END$$
DELIMITER;


show DATABASES;
create DATABASE variable_test;
use variable_test;
CREATE TABLE student (
    studentid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    class VARCHAR(20),
    age INT
);
select * from student;

INSERT INTO student (studentid, firstname, lastname, class, age) VALUES
(1, 'John', 'Doe', 'Math', 18),
(2, 'Jane', 'Smith', 'Science', 19),
(3, 'Jim', 'Brown', 'History', 17),
(4, 'Emily', 'Davis', 'Math', 20),
(5, 'Michael', 'Wilson', 'English', 21);

select * from student;

select @maxage := MAX(age) from student;


SELECT IF(200>300, 'Yes', 'No')