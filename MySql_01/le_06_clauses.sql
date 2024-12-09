show databases;

use db_test2;

CREATE Table officers (
    officer_id int UNIQUE not NULL,
    officer_name VARCHAR(45) NOT NULL,
    address VARCHAR(60)
);

INSERT INTO officers (officer_id, officer_name, address) VALUES 
(1, 'Ajeet', 'Mau'),(2, 'Deepika', 'Lucknow'),(3, 'Vimal','Faizabad'),(4, 'Rahul', 'Lucknow');

SELECT * FROM officers;

-- WHERE  clause
SELECT * FROM officers WHERE address='Mau';
SELECT * FROM officers WHERE address='Lucknow' AND officer_id < 3;
SELECT * FROM officers WHERE address='Lucknow' OR address='Mau';

-- DISTINCT clause
SELECT DISTINCT address from officers;


-- ORDER BY
SELECT * FROM officers ORDER BY officer_name DESC;
SELECT * FROM officers ORDER BY address;

-- GROUP BY

SELECT address, COUNT(*)
FROM officers
GROUP BY address;

SELECT COUNT(*)
FROM officers;