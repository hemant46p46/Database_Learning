-- -------------------------------------- Showing databases -------------------------------------
-- CREATE DATABASE [IF NOT EXISTS] database_name
-- [CHARACTER SET charset_name]
-- [COLLATE collation_name];
show DATABASES;

-- show DATABASEs LIKE pattern;     OR      show DATABASEs WHERE expression;
-- show databases which are ending with schema;
show DATABASEs LIKE "%schema";


-- same result as       show databases;
SELECT schema_name FROM information_schema.SCHEMATA;

-- show databases which are starting from s ;
SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 'f%';


------------------------------------ Creating databases -------------------------------------

create DATABASE db_test_creation;

CREATE DATABASE db_creation_test;

CREATE DATABASE if NOT EXISTS db_test CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
show DATABASES;
drop DATABASE db_test;
------------------------------------ Drop databases -------------------------------------

DROP DATABASE db_test_creation;
DROP DATABASE db1;

