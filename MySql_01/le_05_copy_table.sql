-------------------------------------- 3. Create copy/clone/duplicate Tables -------------------------------------
show DATABASES;
CREATE DATABASE db_test2;
use db_test2;
show tables;
CREATE Table ori_table(
    Id int PRIMARY KEY NOT NULL,
    Name VARCHAR(45) NOT NULL,
    Product VARCHAR(45) DEFAULT NULL,
    Country VARCHAR(25) DEFAULT NULL,
    Year int NOT NULL
);
desc ori_table;

INSERT INTO ori_table (Id, Name, Product, Country, Year) VALUES
(1, 'Stephen', 'Computer', 'USA', 2015),
(2, 'Joseph', 'Laptop', 'India', 2016),
(3, 'John', 'TV', 'USA', 2016),
(4, 'Donald', 'Laptop', 'England', 2015),
(5, 'Joseph', 'Mobile', 'India', 2015),
(6, 'Peter', 'Mouse', 'England', 2016);

SELECT * from ori_table;


-- creation of  DUPLICATE table
CREATE TABLE if NOT exists duplicate_table select * from ori_table;

show tables;

select * from duplicate_table;


-- creation of  DUPLICATE table
CREATE Table if not exists duplicate_tab1 select * from  ori_table where year = '2016';

select * from duplicate_tab1;

-- creation of  DUPLICATE table
create table duplicate_tab2 like ori_table;
SELECT * from duplicate_tab2;
insert duplicate_tab2 select * from ori_table;


show columns from ori_table;