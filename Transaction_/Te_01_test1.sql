show DATABASES;

create DATABASE transact_1;

use transact_1;

create table Accounts(
    account_id VARCHAR(2),
    balance INT
);
show tables;
desc accounts;

insert into accounts(account_id, balance) values ('A', 500), ('B', 300);

SELECT * FROM accounts;

---------   Performing transaction

-- Step 0: Start a variable
SET @amount = 100;

-- Step 1: Start the transaction
START TRANSACTION;

-- Step 2: Deduct $100 from Account A
UPDATE accounts
SET balance = balance - @amount
WHERE account_id = 'A';

-- Step 3: Add $100 to Account B
UPDATE accounts
SET balance = balance + @amount
WHERE account_id = 'B';

-- Step 4: Check if both operations were successful
-- If everything is fine, commit the transaction
COMMIT;
-- If any error occurs, rollback the transaction
-- ROLLBACK;