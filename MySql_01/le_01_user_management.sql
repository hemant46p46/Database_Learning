-------------------------------------- Showing Users -------------------------------------


-- 1 showing user lists
SELECT user from mysql.user;

-- desc user
desc mysql.user;

select user, host, account_locked, password_expired from mysql.user;

-- showing current user
SELECT user();  -- will show username@hostname ie account name
SELECT CURRENT_USER();

SELECT user from information_schema.PROCESSLIST;-- will show current logged user lists


-------------------------------------- Creating Users -------------------------------------
-- account_name = username@hostname
-- CREATE USER if NOT EXISTS username@hostname IDENTIFIED BY 'password';
CREATE USER if NOT EXISTS peter@localhost IDENTIFIED BY 'peter@pass22';

-- another way to create a user
CREATE user patel@localhost IDENTIFIED BY 'patel@pass24';

CREATE user 'user1@localhost1' IDENTIFIED BY 'abc@pass20';

-------------------------------------- Granting permission to Users -------------------------------------


-- show all granted permission to an user
SHOW GRANTS for patel@localhost;
SHOW GRANTS for 'patel'@'localhost';

-- granting all permission to all database to an user
GRANT ALL PRIVILEGES ON *.* TO patel@localhost;

GRANT CREATE, SELECT, INSERT ON *.* TO patel@localhost;

-- this will grant all permission to my_database
GRANT ALL PRIVILEGES ON my_database.* TO patel@localhost;

-- this will grant all permission for specific table of specific database to a user
GRANT ALL PRIVILEGES ON my_database.my_table to patel@localhost;

-- to ensure that changes take effect immediately
FLUSH PRIVILEGES;

-- revoking all permission from a user
REVOKE ALL PRIVILEGES on *.* from 'patel'@'localhost';


-------------------------------------- Updating User's Password -------------------------------------


ALTER USER 'peter'@'localhost' IDENTIFIED BY 'new_secure_password';
SET PASSWORD FOR 'peter'@'localhost' = PASSWORD('new_secure_password');

FLUSH PRIVILEGES;
-------------------------------------- Drop Users to database -------------------------------------

-- delete a user from database
DROP USER 'patel'@'localhost';

DROP USER 'user1'@'localhost1';

-- droping multiple user from database;
DROP USER 'user1'@'localhost1', 'user2'@'localhost', 'user3'@'localhost';

