SHOW DATABASES;

CREATE DATABASE data_manage_db_01_prct;

CREATE TABLE students (
  id int unique primary key,
  name varchar(40)
);

alter table students add column course varchar(40);

-- 1: insert data into table
insert into students (id, name, course) value (201, "Hemant", "BTech"), (204, "Deepak", "BPharm"), (207, "Shivam", "BCA") ;

-- 2: Retrieve Data
SELECT * FROM students;

-- 3: Update Data
UPDATE students SET id = 211 WHERE name="Shivam";

-- 4: Delete Data
DELETE FROM students WHERE id=201;