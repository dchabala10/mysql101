DROP SCHEMA IF EXISTS OutdoorOutfitters;
CREATE SCHEMA IF NOT EXISTS OutdoorOutfitters;
SHOW WARNINGS;
USE OutdoorOutfitters;


DROP TABLE IF EXISTS OutdoorOutfitters.Product ;
SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS OutdoorOutfitters.Product 
(ID INT NOT NULL AUTO_INCREMENT COMMENT 'The primary key value in the system.  Uniquely identifies a row.' ,
  Name VARCHAR(50) NOT NULL ,
  PRIMARY KEY (ID) ,
  UNIQUE INDEX Name_UNIQUE (Name ASC) )
ENGINE = InnoDB;

INSERT INTO outdooroutfitters.product (Name) VALUES ('Schlitz');
INSERT INTO outdooroutfitters.product (Name) VALUES ('Shaeffer');
INSERT INTO outdooroutfitters.product (Name) VALUES ('Falstaff');
INSERT INTO outdooroutfitters.product (Name) VALUES ('Cooks');

Select * from product;

UPDATE product SET Name = 'Super Bike'
WHERE NAME = 'Schlitz';

UPDATE product SET Name = 'Plush Ride Bike'
WHERE Name = 'Cooks';

UPDATE product SET Name = 'Super Plush Ride Bike'
WHERE Name = 'Shaeffer';

UPDATE product SET Name = 'Racing Bike'
WHERE Name = 'Falstaff';

DELETE FROM product
WHERE Name = 'Super Bike';

DROP TABLE IF EXISTS OutdoorOutfitters.ProductOption ;
SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS OutdoorOutfitters.ProductOption
(ID INT NOT NULL AUTO_INCREMENT COMMENT 'The primary key value in the system.  Uniquely identifies a row.' ,
  ProductID INT NOT NULL,
  FrameLookupCode varchar(25),
  FrameOptionDesc varchar(100),
  FrameSize Enum('15','17','19','21') NOT NULL ,
  FrameColor varchar(25),
  ComponentPackageCode Enum('Basic', 'Delux', 'Ultimate'),
  PRIMARY KEY (ID) ,
  UNIQUE INDEX FrameOptionName_UNIQUE (FrameLookupCode ASC))
ENGINE = InnoDB;

ALTER TABLE outdooroutfitters.ProductOption 
ADD INDEX FK_PRODUCT_PRODUCTID_idx (ProductID ASC);

ALTER TABLE outdooroutfitters.ProductOption 
ADD CONSTRAINT FK_PRODUCT_PRODUCTID
  FOREIGN KEY (ProductID)
  REFERENCES outdooroutfitters.product (ID)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

SELECT * from Product;

SET @ProductID= NULL;
SELECT  @ProductID :=  ID FROM outdooroutfitters.product WHERE name = 'Racing Bike';

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'RaceBlue15Basic', 'blue 15 inch frame with basic components', '15','Blue','Basic');

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'RaceRed17Delux', 'blue 17 inch frame with basic components', '17','Red','Delux');

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'RaceBlue19Basic', 'blue 19 inch frame with basic components', '19','Blue','Basic');

SELECT  @ProductID :=  ID FROM outdooroutfitters.product WHERE name = 'Plush Ride Bike';

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'PlushYellow15Delux', 'blue 15 inch frame with basic components', '15','Yellow','Delux');

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'PlushBlack17Ultimate', 'blue 17 inch frame with basic components', '17','Black','Ultimate');

INSERT INTO outdooroutfitters.ProductOption (ProductID, FrameLookupCode, FrameOptionDesc, FrameSize, FrameColor,ComponentPackageCode)
VALUES (@ProductID, 'PlushBlue19Basic', 'blue 19 inch frame with basic components', '19','Blue','Basic');
/*
SELECT Product.ID as ProductTableID
, Product.Name
, ProductOption.ID as ProductOptionID
, ProductOption.FrameLookupCode
, ProductOption.FrameSize
, ProductOption.FrameColor
, ProductOption.ComponentPackageCode
FROM Product
INNER JOIN ProductOption ON ProductOption.ProductID = Product.ID;
*/

CREATE VIEW vProductOptions
as

SELECT Product.ID as ProductTableID
, Product.Name
, ProductOption.ID as ProductOptionID
, ProductOption.FrameLookupCode
, ProductOption.FrameSize
, ProductOption.FrameColor
, ProductOption.ComponentPackageCode
FROM Product
INNER JOIN ProductOption ON ProductOption.ProductID = Product.ID;

Select * from vProductOptions;



