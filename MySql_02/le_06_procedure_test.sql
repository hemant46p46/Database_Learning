-- addition of two values
DELIMITER //

CREATE PROCEDURE add_two_values(IN val1 INT, IN val2 INT, OUT result INT)
BEGIN
    SET result = val1 + val2;
END //

DELIMITER ;



CALL add_two_values(5, 10, @sum);
SELECT @sum AS Result;