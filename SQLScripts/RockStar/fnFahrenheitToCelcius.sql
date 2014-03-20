USE RockStarDay2;

DROP FUNCTION IF EXISTS fnFahrenheitToCelcius;


CREATE FUNCTION fnFahrenheitToCelcius (fahrenheit INT) 
RETURNS INT 
COMMENT 'Converts F temperatures to C'
DETERMINISTIC
/* C = 5/9 (F-32) */
RETURN (5/9)*(fahrenheit-32);


SELECT fnFahrenheitToCelcius(32) as celcius;