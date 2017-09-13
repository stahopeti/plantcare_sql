SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP TABLE SYSTEM_CONFIG, FREQ_LIGHT, COMMANDS, POTS, PLANT_CONFIGS, SENSOR_DATA;

CREATE TABLE `SYSTEM_CONFIG` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`REMOTE_ID` INT NOT NULL,
	`REMOTE_USER_ID` INT NOT NULL,
	`MAC_ADDRESS` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `FREQ_LIGHT` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`TIMESTAMP` DATETIME NOT NULL,
	`LIGHT` FLOAT NOT NULL,
	`POT_ID` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `COMMANDS` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`REMOTE_ID` INT NOT NULL,
	`POT_ID` INT NOT NULL,
	`TIMESTAMP` DATETIME NOT NULL,
	`TASK` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `POTS` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`REMOTE_ID` INT NOT NULL,
	`NAME` VARCHAR(255) NOT NULL,
	`PLANT_CONFIG_ID` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `PLANT_CONFIGS` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`PLANT_CODE` VARCHAR(255) NOT NULL,
	`PLANT_NAME` VARCHAR(255) NOT NULL,
	`REQ_TEMP` FLOAT NOT NULL,
	`REQ_MOIST` FLOAT NOT NULL,
	`REQ_LIGHT` FLOAT NOT NULL,
	`REQ_LIGHT_MINUTES` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `SENSOR_DATA` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`POT_ID` INT NOT NULL,
	`TIMESTAMP` DATETIME NOT NULL,
	`TEMPERATURE` FLOAT NOT NULL,
	`MOISTURE` FLOAT NOT NULL,
	`LIGHT` FLOAT NOT NULL,
	`BLINDER_ON` INT NOT NULL,
	`WATERTANK_EMPTY` INT NOT NULL,
	`CONNECTION_DOWN` INT NOT NULL,
	PRIMARY KEY (`ID`)
);


ALTER TABLE `FREQ_LIGHT` ADD CONSTRAINT `FREQ_LIGHT_fk0` FOREIGN KEY (`POT_ID`) REFERENCES `POTS`(`ID`);

ALTER TABLE `COMMANDS` ADD CONSTRAINT `COMMANDS_fk0` FOREIGN KEY (`POT_ID`) REFERENCES `POTS`(`ID`);

ALTER TABLE `POTS` ADD CONSTRAINT `POTS_fk0` FOREIGN KEY (`PLANT_CONFIG_ID`) REFERENCES `PLANT_CONFIGS`(`ID`);

ALTER TABLE `SENSOR_DATA` ADD CONSTRAINT `SENSOR_DATA_fk0` FOREIGN KEY (`POT_ID`) REFERENCES `POTS`(`ID`);

INSERT INTO SYSTEM_CONFIG(REMOTE_ID, REMOTE_USER_ID, MAC_ADDRESS) VALUES(1,1, 'b8:27:eb:ce:9e:44');
INSERT INTO PLANT_CONFIGS(PLANT_CODE, PLANT_NAME, REQ_TEMP, REQ_MOIST, REQ_LIGHT, REQ_LIGHT_MINUTES) VALUES('001', 'Avocado', 101.01, 202.02, 850, 480);
INSERT INTO POTS(REMOTE_ID, NAME, PLANT_CONFIG_ID) VALUES(1, 'Cserep1', 1);

SELECT * FROM SYSTEM_CONFIG;
SELECT * FROM PLANT_CONFIGS;
SELECT * FROM POTS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;