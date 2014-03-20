USE rockstarday2;

DROP procedure IF EXISTS uspFahrenheitToCelciusINOUT ;


DELIMITER $$

CREATE PROCEDURE uspFahrenheitToCelciusINOUT (INOUT ptemp INT)
BEGIN

	SELECT fnFahrenheitToCelcius(ptemp) INTO ptemp;

END$$

DELIMITER ;

SET @temperature = 95;

CALL uspFahrenheitToCelciusINOUT(@temperature);

Select  @temperature;