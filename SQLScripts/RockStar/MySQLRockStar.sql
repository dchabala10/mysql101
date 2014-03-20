CREATE DATABASE RockStarDay2;
USE RockStarDay2;

drop table `RockStar`.`Individual`;

CREATE TABLE Individual (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(25) DEFAULT NULL,
  `BirthDate` date NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DeceasedDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;



