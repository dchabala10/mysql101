USE RockStarDay2;

DROP FUNCTION IF EXISTS fnCelsiusToFahrenheit;

CREATE FUNCTION fnCelsiusToFahrenheit (celsius INT) 
RETURNS INT 
COMMENT 'Converts Celsius temperatures to Fahrenheit.'
DETERMINISTIC
RETURN (1.8 * celsius) + 32;


SELECT fnCelsiusToFahrenheit(20) as fahrenheit;


