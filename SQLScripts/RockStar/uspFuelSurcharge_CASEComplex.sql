USE RockStarDay2;

DROP FUNCTION IF EXISTS fnCalulateLoanRisk;

DELIMITER $$
CREATE FUNCTION fnCalulateLoanRisk (ploan_amt float, phousehold_income float) 
RETURNS varchar(25)
COMMENT 'calculates the risk of giving a loan using loan amount and household income'
DETERMINISTIC

BEGIN
	DECLARE returnrisklevel varchar(10);
	DECLARE ratio float;

	SET ratio = ploan_amt / phousehold_income;

	CASE
		WHEN ratio < .10 THEN 
			SET returnrisklevel = 'Low';
		WHEN ratio <= .25 and ratio >= .10 THEN 
			SET returnrisklevel = 'Moderate';
		WHEN ratio <= .35 and ratio >= .26 THEN 
			SET returnrisklevel = 'High';
		WHEN ratio > .35 THEN 
			SET returnrisklevel = 'No Loan';		
	END CASE;

	RETURN returnrisklevel;
END$$
DELIMITER ;

SELECT fnCalulateLoanRisk(10000, 150000) as lowrisklevel
,  fnCalulateLoanRisk(25000, 150000) as moderaterisklevel
, fnCalulateLoanRisk(50000, 150000) as highrisklevel;




