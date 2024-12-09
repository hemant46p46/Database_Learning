-- There are 3 ways to use loop statement
    -- LOOP
    -- WHILE
    -- REPEAT


-- 1 LOOP
DELIMITER //

CREATE PROCEDURE PrintNumber()
BEGIN
    DECLARE counter INT DEFAULT 1; -- Declare a counter variable

    my_loop: LOOP
        IF counter > 5 THEN
            LEAVE my_loop; -- Exit the loop when the condition is met
        END IF;

        SELECT counter; -- Display the counter value
        SET counter = counter + 1; -- Increment the counter
    END LOOP my_loop;
END //

DELIMITER ;

CALL PrintNumber();


show DATABASES;
use control_flow_exs;


-- 2nd while 
DELIMITER //
CREATE PROCEDURE calculateFactorial(IN n int, OUT result BIGINT)
BEGIN
    DECLARE i int DEFAULT 1;
    SET result = 1;
    WHILE i<=n DO
        SET result = result*i;
        SET i = i+1;
    END WHILE;
END //
DELIMITER;

CALL calculateFactorial(5, @fact);
SELECT @fact as Factorial;



-- 3rd REPEAT
DELIMITER //
CREATE PROCEDURE sumNum(IN n int, out total int)
BEGIN
    DECLARE counter int DEFAULT 1;
    SET total = 0;

    REPEAT
        SET total = total + counter;
        SET counter = counter + 1;
    UNTIL counter > n
    END REPEAT;
END //
DELIMITER;

call sumNum(5, @sum);
SELECT @sum as TotalSum;