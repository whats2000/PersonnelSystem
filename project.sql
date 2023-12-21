SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `Personnel` CASCADE
;

DROP TABLE IF EXISTS `Content` CASCADE
;

DROP TABLE IF EXISTS `CargoHistory` CASCADE
;

DROP TABLE IF EXISTS `Cargo` CASCADE
;

DROP TABLE IF EXISTS `Address` CASCADE
;

CREATE TABLE `Personnel`
(
	`personnelNumber` TINYTEXT,
	`personnelPassword` TINYTEXT,
	`personnelID` INTEGER NOT NULL,
	CONSTRAINT `PK_Personnel` PRIMARY KEY (`personnelID`)
)
;

CREATE TABLE `Content`
(
	`cargoName` TINYTEXT,
	`quantity` INTEGER,
	`contentID` INTEGER NOT NULL,
	`cargoID` INTEGER,
	CONSTRAINT `PK_Content` PRIMARY KEY (`contentID`)
)
;

CREATE TABLE `CargoHistory`
(
	`currentState` TINYTEXT,
	`historyNumber` INTEGER,
	`timeOfArrival` TIMESTAMP(0),
	`mPersonnel` INTEGER,
	`origin` INTEGER,
	`destination` INTEGER,
	`cargoHistoryID` INTEGER NOT NULL,
	`mCargo` INTEGER,
	CONSTRAINT `PK_CargoHistory` PRIMARY KEY (`cargoHistoryID`)
)
;

CREATE TABLE `Cargo`
(
	`cargoNumber` TINYTEXT,
	`estimatedDeliveryDate` DATE,
	`limit` TINYTEXT,
	`origin` INTEGER,
	`destination` INTEGER,
	`cargoID` INTEGER NOT NULL,
	`shippingDate` DATE,
	CONSTRAINT `PK_Cargo` PRIMARY KEY (`cargoID`)
)
;

CREATE TABLE `Address`
(
	`city` TINYTEXT,
	`street` TINYTEXT,
	`unitNumber` TINYTEXT,
	`addressID` INTEGER NOT NULL,
	CONSTRAINT `PK_Address` PRIMARY KEY (`addressID`)
)
;

ALTER TABLE `Content` 
 ADD CONSTRAINT `FK_Content_Cargo`
	FOREIGN KEY (`cargoID`) REFERENCES `Cargo` (`cargoID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `CargoHistory` 
 ADD CONSTRAINT `FK_origin`
	FOREIGN KEY (`origin`) REFERENCES `Address` (`addressID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `CargoHistory` 
 ADD CONSTRAINT `FK_destination`
	FOREIGN KEY (`destination`) REFERENCES `Address` (`addressID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `CargoHistory` 
 ADD CONSTRAINT `FK_mCargo`
	FOREIGN KEY (`mCargo`) REFERENCES `Cargo` (`cargoID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `CargoHistory` 
 ADD CONSTRAINT `FK_mPersonnel`
	FOREIGN KEY (`mPersonnel`) REFERENCES `Personnel` (`personnelID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Cargo` 
 ADD CONSTRAINT `FK_origin`
	FOREIGN KEY (`origin`) REFERENCES `Address` (`addressID`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Cargo` 
 ADD CONSTRAINT `FK_destination`
	FOREIGN KEY (`destination`) REFERENCES `Address` (`addressID`) ON DELETE No Action ON UPDATE No Action
;

SET FOREIGN_KEY_CHECKS=1
