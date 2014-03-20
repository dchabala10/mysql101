
USE baseball;

DROP PROCEDURE IF EXISTS usp_teamcountbyleague;

DELIMITER $$

CREATE PROCEDURE usp_teamcountbyleague (IN pleague CHAR(3))
BEGIN
	DECLARE teamcount int;
	
	SELECT COUNT(ID) INTO teamcount
	FROM team
	WHERE team.League = pleague;

    SELECT teamcount;

END$$

CALL usp_teamcountbyleague('AL')

