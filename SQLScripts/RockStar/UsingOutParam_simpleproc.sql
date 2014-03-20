USE rockstarday2;

DROP PROCEDURE IF EXISTS simpleproc;

delimiter //
CREATE PROCEDURE simpleproc (OUT param1 INT)
BEGIN 
SELECT COUNT(*) INTO param1 FROM individual;
END//
delimiter ;


CALL simpleproc(@a);
SELECT @a;


