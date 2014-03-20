USE rockstarday2;

DROP procedure IF EXISTS uspFahrenheitToCelcius ;


DELIMITER $$

CREATE PROCEDURE uspFahrenheitToCelcius (IN pfahrenheit INT, OUT pcelcius INT)
BEGIN

	SELECT fnFahrenheitToCelcius(pfahrenheit) INTO pcelcius;

END$$

DELIMITER ;

CALL uspFahrenheitToCelcius(100, @celcius);

Select  @celcius;