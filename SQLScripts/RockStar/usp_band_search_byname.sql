
USE rockstarday2;

DROP procedure IF EXISTS usp_band_search_byname;


DELIMITER $$

CREATE PROCEDURE usp_band_search_byname(IN pname varchar(40))
BEGIN

SELECT ID,
    Name,
    YearFormed,
    IsTogether,
    Genre
FROM band
WHERE NAME LIKE CONCAT('%', pname ,'%');

END$$

DELIMITER ;

CALL usp_band_search_byname('Rolling');

