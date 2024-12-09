SHOW DATABASES;

use mysql;

SHOW TABLES;

select * from user;

CREATE USER 'hemant'@'localhost' IDENTIFIED BY '123hemant';

DROP USER 'patel'@'localhost';
DROP USER 'peter'@'localhost';


select user, host from mysql.user;

GRANT USAGE ON *.* TO `hemant`@`localhost`


GRANT privileges ON *.* TO 'hemant'@'localhost';

SHOW GRANTS FOR 'hemant'@'localhost';

REVOKE privileges ON *.* FROM 'hemant'@'localhost';

alter USER 'hemant'@'localhost' IDENTIFIED BY '987hemant';

DROP USER 'hemant'@'localhost';