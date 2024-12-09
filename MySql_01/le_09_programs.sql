
CREATE PROCEDURE addNum(IN n1 int, IN n2 int, out result int)
BEGIN
    SET result = n1 + n2;
END

CALL addNum(10, 20, @sum);
SELECT @sum as result;


CREATE PROCEDURE greater(IN n1 int, IN n2 int)
BEGIN
    SELECT IF(n1>n2, n1, n2) as Greater;
END

CALL greater(20, 50);
