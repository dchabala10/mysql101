USE rockstarday2;

DROP procedure IF EXISTS uspFuelSurcharge ;

DELIMITER $$
 
CREATE PROCEDURE uspFuelSurcharge(
        in  p_region varchar(25), 
        out p_surcharge int)
BEGIN
    
 
    CASE p_region
        WHEN  'Southeast' THEN
           SET p_surcharge = '20';
        WHEN 'Northeast' THEN
           SET p_surcharge = '30';
		WHEN 'Lower Midwest' THEN
           SET p_surcharge = '30';
		WHEN 'Upper Midwest' THEN
           SET p_surcharge = '40';
		WHEN 'SouthWest' THEN
           SET p_surcharge = '40';
        WHEN 'Mountain West' THEN
           SET p_surcharge = '50';
		ELSE
           SET p_surcharge = '70';
    END CASE;
 
END$$
DELIMITER ;


SET @surcharge = 0;
CALL uspFuelSurcharge('Canada', @surcharge);
Select  @surcharge;


