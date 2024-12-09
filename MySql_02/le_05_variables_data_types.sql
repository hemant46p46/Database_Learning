-- There are 3 types of variable
-- 1: local variable in Stored Programs => Local variables can be defined and used within stored procedures, functions, and triggers.

-- 2: System variable =>
    -- Scope: Can be global or session-specific.
    -- Global Variables: Affect the entire server and all sessions.
    -- Session Variables: Apply only to the current session.

-- 3: User Defined
    -- Scope: Available only within the session where they are defined.
    -- Syntax: Use the @ symbol to define and access user-defined variables.

------------------------------------------------------------------------------------------------------
-- 1: System Variable : We can not create system variable, but we can modify with privileges
-- Viewing System variable
SHOW VARIABLES;

-- Filter specific variable
SHOW VARIABLES LIKE 'variable_name%';


SET GLOBAL max_connections = 200;


SET SESSION sql_mode = 'STRICT_ALL_TABLES';

------------------------------------------------------------------------------------------------------
-- 2 User Defined: End the Session: Closing the current connection to the MySQL server automatically clears all user-defined variables.
SET @var=10;-- initialization
SELECT @var1 := 203; -- initialization and access
SELECT @var2 = 201;-- wrong declaration, will return NULL

SELECT @var; -- accessing @var

select @student_name := "Jack";
select @student_id := 123;
select @student_dob := '1999-05-30';
select @current_date := CURDATE();-- yyyy-mm-dd
select @current_date_time := NOW(); -- yyyy-mm-dd hh-mm-ss
select @current_date1 := DATE(NOW());-- yyyy-mm-dd

-- you can add or subtract days using the DATE_ADD() or DATE_SUB() functions.
select @day_after_7days := DATE_ADD(CURDATE(), INTERVAL 7 DAY); -- 7 days
select @day_after_7months := DATE_ADD(CURDATE(), INTERVAL 7 MONTH); -- add 7 months
select @day_after_Year := DATE_ADD(CURDATE(), INTERVAL 1 YEAR);



--------------------------------- Data Type-------------------------------------
-- Numeric Types:   TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT, DECIMAL, FLOAT, DOUBLE.
-- Date and Time    Types: DATE, DATETIME, TIMESTAMP, TIME, YEAR.
-- String Types:    CHAR, VARCHAR, TEXT, TINYTEXT, MEDIUMTEXT, LONGTEXT.
-- Binary Types:    BINARY, VARBINARY, BLOB, TINYBLOB, MEDIUMBLOB, LONGBLOB.
-- Spatial Types:   POINT, LINESTRING, POLYGON.
-- JSON Type:       JSON.

SHOW DATABASES;
CREATE DATABASE datatype_test_db;
use datatype_test_db;

-- Examples
-- 1: Numeric Types:
    -- 1.1 TINYINT:
    -- Stores very small integers
    --Range: -128 to 127 (Signed), 0 to 255 (Unsigned)
create table ex_tinyint(num TINYINT);
INSERT INTO ex_tinyint values (127);
INSERT INTO ex_tinyint values (-128);
-- INSERT INTO ex_tinyint values (156);
-- INSERT INTO ex_tinyint values (-231);

RENAME TABLE ex_tinyint TO ex_tinyint_tbl;
SELECT * FROM ex_tinyint_tbl;


-- 1.2 SMALLINT:
-- Stores small integers.
--Range: -32,768 to 32,767 (Signed), 0 to 65,535 (Unsigned)
create table ex_smallint_tbl(num SMALLINT);
INSERT INTO ex_smallint_tbl values(32767);
INSERT INTO ex_smallint_tbl values(-32767);
-- INSERT INTO ex1 values(33867);
-- INSERT INTO ex1 values(-37267);
INSERT INTO ex_smallint_tbl values(2767);
SELECT * from ex_smallint_tbl;


-- 1.3 MEDIUMINT:
-- Stores Medium-sized integers
--Range: -8,388,608 to 8,388,607 (Signed), 0 to 16,777,215
create table ex2 (num MEDIUMINT);
INSERT INTO ex2 values (8388607);
-- INSERT INTO ex2 values (8388609);
-- INSERT INTO ex2 values (8388608);
RENAME TABLE ex2 TO ex_mediumint_tbl;
select * from ex_mediumint_tbl;



-- 1.4: INT(INTEGER)
-- Stores standard integers.
-- Range: -2,147,483,648 to 2,147,483,647 (Signed), 0 to 4,294,967,295 (Unsigned)
create table ex_int (num int);
insert into ex_int values (2147483647);
-- insert into ex_int values (2147483648);
insert into ex_int values (-2147483648);
-- insert into ex_int values (-2147483649);
RENAME table ex_int to ex_int_tbl;
SELECT * FROM ex_int_tbl;



-- 1.5 BIGINT:
-- Stores large integers
-- Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 (Signed), 0 to 18,446,744,073,709,551,615 (Unsigned)
CREATE table ex_big_int(num BIGINT);
INSERT INTO ex_big_int VALUES (9223372036854775807);
-- INSERT INTO ex_big_int VALUES (9223372036854775808);
INSERT INTO ex_big_int VALUES (-9223372036854775808);
-- INSERT INTO ex_big_int VALUES (-9223372036854775809);
SELECT * FROM ex_big_int;
rename table ex_big_int to ex_big_int_tbl;
SELECT * FROM ex_big_int_tbl;



-- 1.6 DECIMAL Types
-- DECIMAL(M, D): Used for storing exact fixed-point numbers. M is the total number
    -- of digits, and D is the number of digits after the decimal point.
create table ex_decimal(price DECIMAL(10, 2));
insert into ex_decimal values (12324345.673);
SELECT * FROM ex_decimal;
rename table ex_decimal to ex_decimal_tbl;
select * from ex_decimal_tbl;

-- 1.7 FLOAT:
-- Stores approximate floating point numbers.
create table ex_float (value FLOAT);
INSERT INTO ex_float VALUES (4.123);
SELECT * from ex_float;
RENAME TABLE ex_float TO ex_float_tbl;


-- 1.8 DOUBLE:
-- Stores approximate double-precision floating-point numbers;
create table ex_double_tbl(num DOUBLE);
INSERT INTO ex_double_tbl VALUES (3.14159265359);
SELECT * FROM ex_double_tbl;

show tables;
----------------------------- Date and Time Data Types -----------------------------
-- 1 DATE: Stores dates in YYYY-MM-DD format
create table ex_date(birthday Date);
INSERT INTO ex_date VALUES ('1999-05-30');
SELECT * FROM ex_date;

-- 2 DATETIME: Stores both date and time in yyyy-mm-dd hh--mm--ss format
create table ex_datetime(created_at DATETIME);
INSERT INTO ex_datetime VALUES ('2024-12-08 14:30:00');
SELECT * FROM ex_datetime;


-- 3 TIMESTAMP: Stores timestamp values (automatic conversion between UTC and local time zone). Format: YYYY-MM-DD HH:MM:SS.
CREATE TABLE ex_timestamp (updated_at TIMESTAMP);
INSERT INTO ex_timestamp VALUES (CURRENT_TIMESTAMP);
SELECT * FROM ex_timestamp;



-- 4 TIME: Stores time values in HH:MM:SS format.
CREATE TABLE ex_time (event_time TIME);
INSERT INTO ex_time VALUES ('14:30:00');
SELECT * FROM ex_time;



-- 5 YEAR: Stores a 4-digit year.
CREATE TABLE ex_year (year_value YEAR);
INSERT INTO ex_year VALUES (2024);
SELECT * FROM ex_year;

show tables;
-------------------------------  3. String (Character) Data Types -------------------------------------------------

-- 1 CHAR(M): Fixed-length string, where M is the number of characters (1-255).
CREATE TABLE ex_char (code CHAR(5));
INSERT INTO ex_char VALUES ('ABC E');
-- INSERT INTO ex_char VALUES ('ABCDEF');
SELECT * FROM ex_char;



-- 2 VARCHAR(M): Variable-length string, where M is the maximum number of characters.
CREATE TABLE ex_varchar (code VARCHAR(5));
alter table ex_varchar change column code name varchar(20);
INSERT INTO ex_varchar VALUES ('Hank pin');
INSERT INTO ex_varchar VALUES ('ABCDdfsfsfsdfsdfsdEF');
-- INSERT INTO ex_varchar VALUES ('ABCDdfsfsfsdfsdfsdthjtehrtEF');
SELECT * FROM ex_varchar;



-- 3 TEXT: Stores long text (up to 65,535 characters).
CREATE TABLE ex_text (description TEXT);
INSERT INTO ex_text VALUES ('This is a long description...');
SELECT * FROM ex_text;




-- 4 TINYTEXT: Stores shorter text (up to 255 characters).
CREATE TABLE ex_tinytext (short_desc TINYTEXT);
INSERT INTO ex_tinytext VALUES ('Short description');
SELECT * FROM ex_tinytext;




-- 5 MEDIUMTEXT: Stores medium-length text (up to 16,777,215 characters).
CREATE TABLE ex_mediumtext (medium_desc MEDIUMTEXT);
INSERT INTO ex_mediumtext VALUES ('A medium-length description...');
SELECT * FROM ex_mediumtext;



-- 6 LONGTEXT: Stores very long text (up to 4,294,967,295 characters).
CREATE TABLE ex_longtext (long_desc LONGTEXT);
INSERT INTO ex_longtext VALUES ('A very long description...');
SELECT * FROM ex_longtext;


------------------------- 4. Binary Data Types ----------------------------------------------
-- 4. Binary Data Types
-- Used for storing binary data (like images, files, etc.).

-- 1 BINARY(M): Fixed-length binary data (stores exactly M bytes).
CREATE TABLE ex_binary (image BINARY(16));
INSERT INTO ex_binary VALUES (0xA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5);
SELECT * FROM ex_binary;




-- 2 VARBINARY(M): Variable-length binary data (up to M bytes).
CREATE TABLE ex_varbinary (image VARBINARY(255));
INSERT INTO ex_varbinary VALUES (0xA5A5A5A5);
SELECT * FROM ex_varbinary;



-- 3 BLOB: Binary large object (up to 65,535 bytes).
CREATE TABLE ex_blob (file BLOB);
INSERT INTO ex_blob VALUES (0xA5A5A5A5);
SELECT * FROM ex_blob;



-- 4 TINYBLOB: Stores smaller binary data (up to 255 bytes).
CREATE TABLE ex_tinyblob (small_file TINYBLOB);
INSERT INTO ex_tinyblob VALUES (0xA5);
SELECT * FROM ex_tinyblob;



-- 5 MEDIUMBLOB: Stores medium-sized binary data (up to 16,777,215 bytes).
CREATE TABLE ex_mediumblob (medium_file MEDIUMBLOB);
INSERT INTO ex_mediumblob VALUES (0xA5A5A5);
SELECT * FROM ex_mediumblob;



-- 6 LONGBLOB: Stores very large binary data (up to 4,294,967,295 bytes).
CREATE TABLE ex_longblob (large_file LONGBLOB);
INSERT INTO ex_longblob VALUES (0xA5A5A5A5A5);
SELECT * FROM ex_longblob;




-----------------  5. Spatial Data Types -----------------
-- Used for geographic and spatial data.


-- 1 POINT: Represents a point in 2D space.
CREATE TABLE ex_point (location POINT);
INSERT INTO ex_point VALUES (POINT(10, 20));
SELECT * FROM ex_point;



-- 2 LINESTRING: Represents a sequence of points forming a line.
CREATE TABLE ex_linestring (route LINESTRING);
INSERT INTO ex_linestring (route) VALUES (ST_GeomFromText('LINESTRING(0 0, 10 10)'));
SELECT * FROM ex_linestring;



-- 3 POLYGON: Represents a polygon.
CREATE TABLE ex_polygon (area POLYGON);
INSERT INTO ex_polygon (area) VALUES (ST_GeomFromText('POLYGON((0 0, 0 10, 10 10, 10 0, 0 0))'));
SELECT * FROM ex_polygon;


------------------------------- 6. JSON Type ----------------------------

-- Used to store JSON (JavaScript Object Notation) data.
-- JSON: Stores JSON-formatted data.
CREATE TABLE ex_json (data JSON);
INSERT INTO ex_json VALUES ('{"name": "John", "age": 30}');
select * from ex_json;




