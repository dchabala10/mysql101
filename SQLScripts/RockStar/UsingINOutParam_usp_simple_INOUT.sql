USE rockstarday2;

DROP PROCEDURE IF EXISTS usp_simple_INOUT;

delimiter //

CREATE PROCEDURE usp_simple_INOUT (IN pIn INT, INOUT pInOUT INT)
BEGIN
	# Add the pIn parameter value to the pInOut parameter value and
	#  return the pInOut back out of the stored procedure
  SET pInOut := pIn + pInOut;
  # Increment value of INOUT parameter
  
END//
delimiter ;

SET @in = 1;
SET @inout = 2;

CALL usp_simple_INOUT(@in,@inout);
SELECT @inout;
