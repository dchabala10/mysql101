USE rockstarday2;


DROP procedure IF EXISTS usp_search_individualbylast;

DELIMITER //
CREATE PROCEDURE usp_search_individualbylast(IN plastname VARCHAR(50))
    BEGIN
        SELECT * 
         FROM Individual
         WHERE LastName = plastname;
    END //
DELIMITER ;


CALL usp_search_individualbylast('Ramone');