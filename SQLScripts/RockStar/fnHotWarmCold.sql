DROP FUNCTION IF EXISTS fnHotWarmCold;

DELIMITER $$

CREATE FUNCTION fnHotWarmCold (pTempc int)
RETURNS char(4)
BEGIN
	DECLARE fahrenheit int;
	DECLARE result char(4);

	 SET fahrenheit = fnCelsiusToFahrenheit(ptempc);

    
    IF fahrenheit < 60 THEN SET result = 'Cold';
    ELSEIF fahrenheit >= 60 and fahrenheit < 76 THEN SET result = 'Warm';
    ELSEIF fahrenheit >= 76 THEN SET result = 'Hot';
    END IF;

    RETURN result;

END$$

SELECT fnHotWarmCold(0) as WeatherCheck1
, fnHotWarmCold(20) as WeatherCheck2
, fnHotWarmCold(38) as WeatherCheck3;