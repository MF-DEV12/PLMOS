/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.5-10.1.9-MariaDB : Database - plmos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
 

/*Table structure for table `accounts` */

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `AccountNo` INT(11) NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(50) DEFAULT NULL,
  `FirstName` VARCHAR(50) DEFAULT NULL,
  `Username` VARCHAR(50) DEFAULT NULL,
  `Password` VARCHAR(200) DEFAULT NULL,
  `LoginType` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (`AccountNo`)
) ENGINE=INNODB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

/*Data for the table `accounts` */

INSERT  INTO `accounts`(`AccountNo`,`LastName`,`FirstName`,`Username`,`Password`,`LoginType`) VALUES (1,NULL,NULL,'Rolen','5f4dcc3b5aa765d61d8327deb882cf99','admin'),(2,NULL,NULL,'JMDMktg','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(3,NULL,NULL,'VEEnt','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(4,NULL,NULL,'Voschtech','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(5,NULL,NULL,'DJZTrd','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(6,NULL,NULL,'Solarfoam','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(7,NULL,NULL,'HGCECo','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(8,NULL,NULL,'mtest','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(9,NULL,NULL,'TestEmail','25d55ad283aa400af464c76d713c07ad','supplier'),(10,NULL,NULL,'testabc','5f4dcc3b5aa765d61d8327deb882cf99','supplier'),(11,'test','abc','test@yahoo.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(12,NULL,NULL,NULL,'5f4dcc3b5aa765d61d8327deb882cf99','customer'),(13,NULL,NULL,'test@abc.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(14,NULL,NULL,'friazmarkanthony@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(15,NULL,NULL,'friazmarkanthony@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(16,NULL,NULL,'test@abc.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(17,NULL,NULL,'friazmarkanthony@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(18,NULL,NULL,'friazmarkanthony@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(19,NULL,NULL,'test@abc.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(20,NULL,NULL,'test@test.com','5f4dcc3b5aa765d61d8327deb882cf99','customer'),(21,'tedt','test','friazmarkanthony@gmail.com','e89836f3339020e34d9e6ba6e1c6b002','customer'),(22,'tedt','test','friazmarkanthony@gmail.com','b3a24cdcdd28fc64eeea22d6913d65ab','customer'),(23,'tedt','test','friazmarkanthony@gmail.com','28ae95df27d8c8d32a3a1b9459d48a61','customer'),(24,'tedt','test','friazmarkanthony@gmail.com','7b8a76f36bfc5a20b17f763f730b75ba','customer'),(25,'Friaz','Mark Anthony','friazmarkanthony@gmail.com','e0765367ff4b63a17482c3511aae9115','customer'),(26,'te','te','friazmarkanthony@gmail.com','4a67e8182ca96ab5dee9c0562aeda0c5','customer'),(27,'esa','awa','friazmarkanthony@gmail.com','9acbd1b39c034d6486ca4d939aaee184','customer');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `AdminNo` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) DEFAULT NULL,
  `AuthorityLevel` VARCHAR(30) DEFAULT NULL,
  `ContactNo` DECIMAL(11,0) DEFAULT NULL,
  `Address` VARCHAR(50) DEFAULT NULL,
  `AccountNo` INT(11) DEFAULT NULL,
  PRIMARY KEY (`AdminNo`),
  KEY `FKAccount_admin` (`AccountNo`),
  CONSTRAINT `FKAccount_admin` FOREIGN KEY (`AccountNo`) REFERENCES `accounts` (`AccountNo`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

INSERT  INTO `admin`(`AdminNo`,`Name`,`AuthorityLevel`,`ContactNo`,`Address`,`AccountNo`) VALUES (1,'Rolen','Owner','1234124','Gen. Luis',NULL),(2,'Raemond','Co-owner','13134341','Sta Lucia',NULL),(3,'Melyza','Manager','4224231','Sabungan',NULL),(4,'Patrick','Worker','4356345','Caloocan',NULL),(5,'Marc','Worker','9296940118','Bukaneg St Sta Lucia Novaliches Quezon City',NULL),(6,'Hannah','Manager','549811651','Fairview',NULL),(7,'Ed','watcher','897456321','BukanegGroundz',NULL);

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `CustomerNo` INT(11) NOT NULL AUTO_INCREMENT,
  `CustomerType` INT(11) DEFAULT NULL COMMENT '1:Customer; 2: Supplier',
  `Lastname` VARCHAR(30) NOT NULL,
  `Firstname` VARCHAR(30) NOT NULL,
  `CompanyName` VARCHAR(100) DEFAULT NULL,
  `ContactNo` VARCHAR(10) NOT NULL,
  `Email` VARCHAR(50) DEFAULT NULL,
  `HomeAddress` TEXT NOT NULL,
  `ShipAddress` TEXT,
  `CreatedDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerNo`)
) ENGINE=INNODB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

INSERT  INTO `customer`(`CustomerNo`,`CustomerType`,`Lastname`,`Firstname`,`CompanyName`,`ContactNo`,`Email`,`HomeAddress`,`ShipAddress`,`CreatedDate`) VALUES (26,NULL,'Friaz','Mark Anthony',NULL,'9278912149','friazmarkanthony@gmail.com','Block 4 Lot 14 Oregon St. Phase 7 Palmera Homes Northwinds San Jose Del Monte Bulacan','Block 4 Lot 14 Oregon St. Phase 7 Palmera Homes Northwinds San Jose Del Monte Bulacan','2017-01-19 15:45:51'),(27,NULL,'test','test',NULL,'9278912149','test@abc.com','test, test','test','2017-01-19 22:42:08'),(28,NULL,'tesss','teas',NULL,'9278912149','test@test.com','test, test','test','2017-01-19 22:45:34'),(29,NULL,'tedt','test',NULL,'0927891214','friazmarkanthony@gmail.com','test','test','2017-02-02 23:49:03'),(30,NULL,'tedt','test',NULL,'0927891214','friazmarkanthony@gmail.com','test','test','2017-02-02 23:50:41'),(31,NULL,'tedt','test',NULL,'0927891214','friazmarkanthony@gmail.com','test','test','2017-02-02 23:51:29'),(32,NULL,'tedt','test',NULL,'0927891214','friazmarkanthony@gmail.com','test','test','2017-02-02 23:53:03'),(33,NULL,'Friaz','Mark Anthony',NULL,'0927891214','friazmarkanthony@gmail.com','test','test','2017-02-03 00:13:02'),(34,NULL,'te','te',NULL,'12313','friazmarkanthony@gmail.com','tes','test','2017-02-03 01:01:11'),(35,NULL,'esa','awa',NULL,'awr','friazmarkanthony@gmail.com','test','test','2017-02-03 01:04:26');

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `FamilyNo` INT(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Family` VARCHAR(30) DEFAULT NULL,
  `FamilyDescription` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`FamilyNo`)
) ENGINE=INNODB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `family` */

INSERT  INTO `family`(`FamilyNo`,`Family`,`FamilyDescription`) VALUES (001,'Paint and Sundries','avsdasdmnfoangojnaerongoanrgoanrwefvownefonawfnmaw'),(002,'Tools','asrhnawtv'),(003,'Electrical',NULL),(004,'Plumbing',NULL),(005,'Home Hardware',NULL),(006,'Houseware',NULL),(007,'Lawn and Outdoor',NULL),(008,'Automotive',NULL),(009,'Small Appliances',NULL),(010,'Chemicals and Batteries',NULL),(011,'','');

/*Table structure for table `fastmovingitem` */

DROP TABLE IF EXISTS `fastmovingitem`;

CREATE TABLE `fastmovingitem` (
  `FastMovingNo` INT(11) NOT NULL AUTO_INCREMENT,
  `Date` DATE DEFAULT NULL,
  `Quantity` INT(11) DEFAULT NULL,
  `ItemNo` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  PRIMARY KEY (`FastMovingNo`),
  KEY `FKItem_fastmovingitem` (`ItemNo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `fastmovingitem` */

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `forum_id` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `forum_name` VARCHAR(50) DEFAULT NULL,
  `Email` VARCHAR(50) DEFAULT NULL,
  `Contact No.` INT(11) DEFAULT NULL,
  `description` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`forum_id`),
  UNIQUE KEY `Id` (`forum_id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `forum` */

INSERT  INTO `forum`(`forum_id`,`forum_name`,`Email`,`Contact No.`,`description`) VALUES (1,' pat\r\n\r\n',NULL,NULL,NULL),(2,'patrick',NULL,NULL,NULL),(3,'john',NULL,NULL,NULL),(4,'dejesus',NULL,NULL,NULL),(5,'lopez',NULL,NULL,NULL),(6,'decastro',NULL,NULL,NULL),(7,'karen',NULL,NULL,NULL);

/*Table structure for table `forum_post` */

DROP TABLE IF EXISTS `forum_post`;

CREATE TABLE `forum_post` (
  `post_id` INT(8) NOT NULL AUTO_INCREMENT,
  `post_title` VARCHAR(50) DEFAULT NULL,
  `post_author` VARCHAR(50) DEFAULT NULL,
  `post_body` VARCHAR(50) DEFAULT NULL,
  `post_type` ENUM('o','r') DEFAULT 'o',
  `op_id` INT(8) DEFAULT NULL,
  `forum_name` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=INNODB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `forum_post` */

INSERT  INTO `forum_post`(`post_id`,`post_title`,`post_author`,`post_body`,`post_type`,`op_id`,`forum_name`) VALUES (1,'patrick','john','just a little time baby','o',NULL,'patrick'),(2,'asd',NULL,NULL,'o',NULL,NULL),(7,'adf','adsf','asdf','o',0,'adf');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `ItemNo` INT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(50) DEFAULT NULL,
  `UOM` VARCHAR(20) DEFAULT NULL,
  `Image` TEXT,
  `BoolFields` TINYINT(1) DEFAULT NULL,
  `SizeType` VARCHAR(20) DEFAULT NULL,
  `Removed` TINYINT(1) DEFAULT NULL,
  `Owned` TINYINT(1) DEFAULT '1',
  `Level1No` INT(11) DEFAULT NULL,
  `Level2No` INT(11) DEFAULT NULL,
  `Level3No` INT(11) DEFAULT NULL,
  `SupplierNo` INT(11) DEFAULT NULL,
  `SRemoved` TINYINT(4) DEFAULT NULL,
  `ItemFor` INT(11) DEFAULT NULL COMMENT '1:Customer; 2:Supplier',
  PRIMARY KEY (`ItemNo`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

INSERT  INTO `item`(`ItemNo`,`Name`,`UOM`,`Image`,`BoolFields`,`SizeType`,`Removed`,`Owned`,`Level1No`,`Level2No`,`Level3No`,`SupplierNo`,`SRemoved`,`ItemFor`) VALUES (0001,'Asahi Insulating Glass Units','set',NULL,NULL,NULL,0,1,33,57,0,NULL,0,1),(0002,'test','kg',NULL,NULL,NULL,0,1,34,0,0,NULL,0,1),(0003,'tet','ea',NULL,NULL,NULL,0,1,34,0,0,NULL,0,2);

/*Table structure for table `itemattribute` */

DROP TABLE IF EXISTS `itemattribute`;

CREATE TABLE `itemattribute` (
  `AttributeID` INT(11) NOT NULL AUTO_INCREMENT,
  `AttributeName` VARCHAR(50) DEFAULT NULL,
  `IsRequired` TINYINT(1) DEFAULT NULL,
  KEY `AttributeID` (`AttributeID`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `itemattribute` */

INSERT  INTO `itemattribute`(`AttributeID`,`AttributeName`,`IsRequired`) VALUES (1,'Brand',1),(2,'Size',1),(3,'Color',1);

/*Table structure for table `itemvariant` */

DROP TABLE IF EXISTS `itemvariant`;

CREATE TABLE `itemvariant` (
  `VariantNo` INT(11) NOT NULL AUTO_INCREMENT,
  `ItemNo` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  `VariantName` TEXT,
  `VariantNameJSON` TEXT,
  `Size` VARCHAR(75) DEFAULT NULL,
  `Color` VARCHAR(50) DEFAULT NULL,
  `Description` VARCHAR(75) DEFAULT NULL,
  `Stocks` INT(11) DEFAULT NULL,
  `LowStock` INT(11) DEFAULT NULL,
  `Critical` INT(11) DEFAULT NULL,
  `DPOCost` DOUBLE DEFAULT NULL COMMENT 'Suppliers price for Admin',
  `SRP` DOUBLE DEFAULT NULL,
  `Price` DOUBLE DEFAULT NULL COMMENT 'Admin price for Customer',
  `Removed` TINYINT(4) DEFAULT NULL,
  `Owned` TINYINT(4) DEFAULT '1',
  `SupplierNo` INT(11) DEFAULT NULL,
  `SRemoved` TINYINT(4) DEFAULT NULL,
  `ImageFile` TEXT,
  PRIMARY KEY (`VariantNo`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `itemvariant` */

INSERT  INTO `itemvariant`(`VariantNo`,`ItemNo`,`VariantName`,`VariantNameJSON`,`Size`,`Color`,`Description`,`Stocks`,`LowStock`,`Critical`,`DPOCost`,`SRP`,`Price`,`Removed`,`Owned`,`SupplierNo`,`SRemoved`,`ImageFile`) VALUES (1,0001,'Size = 5x5 ft<br/>Thickness = Single<br/>','{\"Size\":\"5x5 ft\",\"Thickness\":\"Single\"}',NULL,NULL,NULL,20,10,10,500,600,600,NULL,1,NULL,NULL,'FILE_20170127092726.gif'),(2,0001,'Size = 5x5 ft<br/>Thickness = Double<br/>','{\"Size\":\"5x5 ft\",\"Thickness\":\"Double\"}',NULL,NULL,NULL,20,10,10,1000,1200,1200,NULL,1,NULL,NULL,'FILE_20170127092759.jpg'),(3,0001,'Size = 5x5 ft<br/>Thickness = Triple<br/>','{\"Size\":\"5x5 ft\",\"Thickness\":\"Triple\"}',NULL,NULL,NULL,20,10,10,1500,1800,1800,NULL,1,NULL,NULL,'FILE_20170127092816.jpg'),(4,0002,'Brand = as<br/>Size = s<br/>Color = d<br/>','{\"Brand\":\"as\",\"Size\":\"s\",\"Color\":\"d\"}',NULL,NULL,NULL,20,15,10,11.11,112.22,112.22,NULL,1,NULL,NULL,'FILE_20170127101012.jpg'),(5,0003,'Brand = dw<br/>Size = as<br/>Color = w<br/>','{\"Brand\":\"dw\",\"Size\":\"as\",\"Color\":\"w\"}',NULL,NULL,NULL,20,NULL,NULL,200,300,300,NULL,1,NULL,NULL,'FILE_20170127102918.jpg');

/*Table structure for table `level1` */

DROP TABLE IF EXISTS `level1`;

CREATE TABLE `level1` (
  `Level1No` INT(11) NOT NULL AUTO_INCREMENT,
  `Name1` VARCHAR(50) DEFAULT NULL,
  `Description` TEXT,
  `ImageFile` TEXT,
  PRIMARY KEY (`Level1No`)
) ENGINE=INNODB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `level1` */

INSERT  INTO `level1`(`Level1No`,`Name1`,`Description`,`ImageFile`) VALUES (26,'Building Materials',NULL,'FILE_20170127114820.jpg'),(33,'Glass',NULL,'FILE_20170127114827.jpg'),(34,'Aluminum',NULL,'FILE_20170127114803.jpg');

/*Table structure for table `level2` */

DROP TABLE IF EXISTS `level2`;

CREATE TABLE `level2` (
  `Level2No` INT(11) NOT NULL AUTO_INCREMENT,
  `Name2` VARCHAR(50) DEFAULT NULL,
  `Description` TEXT,
  `Level1No` INT(11) DEFAULT NULL,
  PRIMARY KEY (`Level2No`)
) ENGINE=INNODB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

/*Data for the table `level2` */

INSERT  INTO `level2`(`Level2No`,`Name2`,`Description`,`Level1No`) VALUES (43,'Building Supplies',NULL,26),(44,'Ligthning',NULL,28),(45,'Electrical supplies',NULL,28),(46,'Door Essentials',NULL,29),(47,'Pipe',NULL,29),(48,'Hardware Accessories',NULL,29),(49,'Chemicals',NULL,30),(50,'Equipment/Materials',NULL,30),(51,'Faucets',NULL,31),(52,'Kitchen Sink',NULL,31),(53,'Shower',NULL,31),(54,'Hand Tools',NULL,32),(55,'Power Tools',NULL,32),(56,'Laminated Glass',NULL,33),(57,'Insulating Glass',NULL,33);

/*Table structure for table `level3` */

DROP TABLE IF EXISTS `level3`;

CREATE TABLE `level3` (
  `Level3No` INT(11) NOT NULL AUTO_INCREMENT,
  `Name3` VARCHAR(50) DEFAULT NULL,
  `Description` TEXT,
  `Level1No` INT(11) DEFAULT NULL,
  `Level2No` INT(11) DEFAULT NULL,
  PRIMARY KEY (`Level3No`)
) ENGINE=INNODB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `level3` */

INSERT  INTO `level3`(`Level3No`,`Name3`,`Description`,`Level1No`,`Level2No`) VALUES (59,'Door knobs',NULL,29,46),(60,'Handle',NULL,29,46),(61,'Locks',NULL,29,46),(62,'Elbow',NULL,29,48),(63,'Clamp',NULL,29,48),(64,'Connector',NULL,29,48),(65,'Hose',NULL,29,48),(66,'Sealants',NULL,30,49),(67,'Thinner',NULL,30,49),(68,'Paint Brush',NULL,30,50),(69,'Sand Paper',NULL,30,50),(70,'Roller',NULL,30,50),(71,'test',NULL,28,44),(72,'test',NULL,26,42);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `MessageNo` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(30) DEFAULT NULL,
  `ContactNo` DECIMAL(11,0) DEFAULT NULL,
  `Email` VARCHAR(30) DEFAULT NULL,
  `Message` TEXT,
  PRIMARY KEY (`MessageNo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `message` */

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `OrderListNo` INT(11) NOT NULL AUTO_INCREMENT,
  `Quantity` INT(11) DEFAULT NULL,
  `Total` DOUBLE DEFAULT NULL,
  `ItemNo` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  `OrderNo` INT(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `Temp` TINYINT(1) DEFAULT NULL,
  `VariantNo` INT(11) DEFAULT NULL,
  PRIMARY KEY (`OrderListNo`),
  KEY `FKOrder_orderlist` (`OrderNo`),
  KEY `FKItem_orderlist` (`ItemNo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `orderlist` */

/*Table structure for table `requestlist` */

DROP TABLE IF EXISTS `requestlist`;

CREATE TABLE `requestlist` (
  `RequestListNo` INT(11) NOT NULL AUTO_INCREMENT,
  `Quantity` INT(11) DEFAULT '1',
  `Total` DOUBLE DEFAULT NULL,
  `Received` INT(11) DEFAULT NULL,
  `TempReceived` INT(11) DEFAULT NULL,
  `SupplyRequestNo` INT(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `ItemNo` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  `VariantNo` INT(11) DEFAULT NULL,
  `SupplyQuantity` INT(11) DEFAULT NULL,
  `Temp` TINYINT(1) DEFAULT NULL,
  `createdby` VARCHAR(50) DEFAULT NULL,
  `createddate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `isPending` INT(11) DEFAULT '0',
  PRIMARY KEY (`RequestListNo`),
  KEY `FKSupplyRequest_requestlist` (`SupplyRequestNo`),
  KEY `FKItem_requestlist` (`ItemNo`)
) ENGINE=INNODB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

/*Data for the table `requestlist` */

INSERT  INTO `requestlist`(`RequestListNo`,`Quantity`,`Total`,`Received`,`TempReceived`,`SupplyRequestNo`,`ItemNo`,`VariantNo`,`SupplyQuantity`,`Temp`,`createdby`,`createddate`,`isPending`) VALUES (211,30,76500,30,1,00000000001,0058,58,NULL,0,'Rolen','2017-01-11 17:13:16',0),(212,30,76500,30,5,00000000001,0058,59,NULL,0,'Rolen','2017-01-11 17:13:17',0),(213,10,112.2,10,5,00000000002,0056,55,NULL,0,'Rolen','2017-01-11 18:06:03',0),(214,10,231.20000000000002,NULL,NULL,00000000002,0057,56,NULL,0,'Rolen','2017-01-11 18:06:06',0);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `SalesNo` INT(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Date` DATE DEFAULT NULL,
  `TotalAmount` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`SalesNo`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `sales` */

INSERT  INTO `sales`(`SalesNo`,`Date`,`TotalAmount`) VALUES (0001,'2016-08-26',800);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `SupplierNo` INT(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` VARCHAR(50) NOT NULL,
  `ContactNo` INT(11) DEFAULT NULL,
  `Address` VARCHAR(50) DEFAULT NULL,
  `Email` VARCHAR(50) DEFAULT NULL,
  `AccountNo` INT(11) DEFAULT NULL,
  PRIMARY KEY (`SupplierNo`),
  KEY `FKAccount_supplier` (`AccountNo`),
  CONSTRAINT `FKAccount_supplier` FOREIGN KEY (`AccountNo`) REFERENCES `accounts` (`AccountNo`)
) ENGINE=INNODB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

INSERT  INTO `supplier`(`SupplierNo`,`SupplierName`,`ContactNo`,`Address`,`Email`,`AccountNo`) VALUES (4,'J.MD. Steel Bars Marketing',2147483647,'Unknown','JMD@gmail.com',2),(11,'V.E. Enterprises',2147483647,'Unknown','VEE@gmail.com',3),(12,'Voschtech',2147483647,'Unknown','VS@gmail.com',4),(13,'DJZ Trading',2147483647,'Unknown','DJZ@gmail.com',5),(14,'Solarfoam',2147483647,'Unknown','SF@gmail.com',6),(16,'House Gem Construction Element Corporation',2147483647,'Unknown','HGCEC@gmail.com',7),(17,'Test Company',0,'Address','Email@gmail.com',8),(18,'Test 2',123456789,'Test 2','friazmarkanthony@gmail.com',9),(19,'test',0,'test','test@yahoo.com',10);

/*Table structure for table `supply` */

DROP TABLE IF EXISTS `supply`;

CREATE TABLE `supply` (
  `SupplyNo` INT(11) NOT NULL AUTO_INCREMENT,
  `QuantityReceived` INT(11) DEFAULT NULL,
  `PendingQuantity` INT(11) DEFAULT NULL,
  `DateReceive` DATETIME DEFAULT NULL,
  `SupplierNo` INT(11) DEFAULT NULL,
  `SupplyRequestNo` INT(11) UNSIGNED ZEROFILL DEFAULT NULL,
  `RequestListNo` INT(11) DEFAULT NULL,
  `ItemNo` INT(11) DEFAULT NULL,
  `Temp` TINYINT(4) DEFAULT NULL,
  PRIMARY KEY (`SupplyNo`),
  KEY `FKSupplier_supply` (`SupplierNo`),
  KEY `FK_supply` (`RequestListNo`),
  CONSTRAINT `FKSupplier_supply` FOREIGN KEY (`SupplierNo`) REFERENCES `supplier` (`SupplierNo`),
  CONSTRAINT `FK_supply` FOREIGN KEY (`RequestListNo`) REFERENCES `requestlist` (`RequestListNo`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `supply` */

INSERT  INTO `supply`(`SupplyNo`,`QuantityReceived`,`PendingQuantity`,`DateReceive`,`SupplierNo`,`SupplyRequestNo`,`RequestListNo`,`ItemNo`,`Temp`) VALUES (1,30,0,'2017-01-11 17:21:13',NULL,00000000001,211,NULL,NULL),(2,30,0,'2017-01-11 17:21:13',NULL,00000000001,212,NULL,NULL),(4,10,0,'2017-01-11 18:10:01',NULL,00000000002,213,NULL,NULL),(5,NULL,NULL,'2017-01-11 18:10:01',NULL,00000000002,214,NULL,NULL);

/*Table structure for table `supplyrequest` */

DROP TABLE IF EXISTS `supplyrequest`;

CREATE TABLE `supplyrequest` (
  `SupplyRequestNo` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `Date` DATETIME DEFAULT NULL,
  `SupplierNo` INT(11) DEFAULT NULL,
  `isReceived` TINYINT(1) DEFAULT NULL,
  `DeliveredStatus` VARCHAR(10) DEFAULT '0',
  `DeliveredDate` DATETIME DEFAULT NULL,
  `ReceivedDate` DATETIME DEFAULT NULL,
  `isPendingItems` INT(11) DEFAULT '0',
  `IsDeliverPending` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SupplyRequestNo`,`IsDeliverPending`),
  KEY `FKSupplier_supplyrequest` (`SupplierNo`),
  CONSTRAINT `FKSupplier_supplyrequest` FOREIGN KEY (`SupplierNo`) REFERENCES `supplier` (`SupplierNo`)
) ENGINE=INNODB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `supplyrequest` */

INSERT  INTO `supplyrequest`(`SupplyRequestNo`,`Date`,`SupplierNo`,`isReceived`,`DeliveredStatus`,`DeliveredDate`,`ReceivedDate`,`isPendingItems`,`IsDeliverPending`) VALUES (00000000001,'2017-01-11 17:13:27',11,1,'1','2017-01-11 17:13:46','2017-01-11 17:21:13',0,0),(00000000002,'2017-01-11 18:06:20',11,1,'1','2017-01-11 18:09:04','2017-01-11 18:10:01',0,0);

/*Table structure for table `tbl_month` */

DROP TABLE IF EXISTS `tbl_month`;

CREATE TABLE `tbl_month` (
  `NO` INT(11) DEFAULT NULL,
  `MONTH` VARCHAR(10) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_month` */

INSERT  INTO `tbl_month`(`NO`,`MONTH`) VALUES (1,'Jan'),(2,'Feb'),(3,'Mar'),(4,'Apr'),(5,'May'),(6,'Jun'),(7,'Jul'),(8,'Aug'),(9,'Sept'),(10,'Oct'),(11,'Nov'),(12,'Dec');

/*Table structure for table `tblauditlogs` */

DROP TABLE IF EXISTS `tblauditlogs`;

CREATE TABLE `tblauditlogs` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `Transaction` VARCHAR(100) DEFAULT NULL,
  `Action` VARCHAR(50) DEFAULT NULL,
  `TransactionDate` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `ModifiedBy` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=498 DEFAULT CHARSET=latin1;

/*Data for the table `tblauditlogs` */

INSERT  INTO `tblauditlogs`(`ID`,`Transaction`,`Action`,`TransactionDate`,`ModifiedBy`) VALUES (1,'Update Family','Update','2016-11-25 18:34:29','Rolen'),(2,'Purchase Order','Insert','2016-11-25 18:57:43','Rolen'),(3,'New Family','Insert','2016-11-25 21:32:45','Rolen'),(4,'New Family','Insert','2016-11-25 21:35:24','Rolen'),(5,'New Category','Insert','2016-11-25 21:36:20','Rolen'),(6,'New Category','Insert','2016-11-25 21:41:01','Rolen'),(7,'New Sub-Category','Insert','2016-11-25 21:41:15','Rolen'),(8,'Update Category','Update','2016-11-25 21:49:10','Rolen'),(9,'Update Sub-Category','Update','2016-11-25 21:49:17','Rolen'),(10,'New Sub-Category','Insert','2016-11-25 21:50:05','Rolen'),(11,'Delete Sub-Category','Delete','2016-11-25 21:50:16','Rolen'),(12,'New Category','Insert','2016-11-25 21:50:41','Rolen'),(13,'Delete Category','Delete','2016-11-25 21:50:47','Rolen'),(14,'New Sub-Category','Insert','2016-11-25 22:11:59','Rolen'),(15,'Delete Sub-Category','Delete','2016-11-25 22:12:27','Rolen'),(16,'Delete Sub-Category','Delete','2016-11-25 22:12:33','Rolen'),(17,'Delete Category','Delete','2016-11-25 22:12:35','Rolen'),(18,'Delete Family','Delete','2016-11-25 22:12:39','Rolen'),(19,'Delete Family','Delete','2016-11-25 22:12:41','Rolen'),(20,'Order number: 00000009  set order status to Process','Update','2016-11-26 00:31:10','Rolen'),(21,'Order number: 00000009  set order status to Ship','Update','2016-11-26 00:31:18','Rolen'),(22,'Decrease Stock after Order to shipped','Update','2016-11-26 00:31:18','Rolen'),(23,'0','Insert','2016-11-30 00:10:17','JMDMktg'),(24,'0','Insert','2016-11-30 00:13:32','JMDMktg'),(25,'0','Insert','2016-11-30 00:13:32','JMDMktg'),(26,'0','Insert','2016-11-30 00:13:32','JMDMktg'),(27,'0','Insert','2016-11-30 00:26:56','JMDMktg'),(28,'0','Insert','2016-11-30 00:26:56','JMDMktg'),(29,'0','Insert','2016-11-30 00:26:56','JMDMktg'),(30,'0','Insert','2016-11-30 00:31:05','JMDMktg'),(31,'0','Insert','2016-11-30 00:31:05','JMDMktg'),(32,'0','Insert','2016-11-30 00:31:05','JMDMktg'),(33,'0','Insert','2016-11-30 00:31:05','JMDMktg'),(34,'0','Insert','2016-11-30 00:31:06','JMDMktg'),(35,'0','Insert','2016-11-30 00:31:06','JMDMktg'),(36,'0','Insert','2016-11-30 00:31:06','JMDMktg'),(37,'Purchase Order','Insert','2016-11-30 00:34:21','Rolen'),(38,'New PO Received','Insert','2016-11-30 00:38:12','Rolen'),(39,'Update Stock after PO Received','Update','2016-11-30 00:38:12','Rolen'),(40,'0','Insert','2016-11-30 14:52:27','JMDMktg'),(41,'0','Insert','2016-11-30 14:52:27','JMDMktg'),(42,'0','Insert','2016-11-30 14:52:27','JMDMktg'),(43,'0','Insert','2016-11-30 17:26:49','JMDMktg'),(44,'0','Insert','2016-11-30 17:26:49','JMDMktg'),(45,'0','Insert','2016-11-30 17:26:49','JMDMktg'),(46,'Purchase Order','Insert','2016-11-30 18:58:18','Rolen'),(47,'New PO Received','Insert','2016-11-30 18:59:04','Rolen'),(48,'Update Stock after PO Received','Update','2016-11-30 18:59:04','Rolen'),(49,'Update Family','Update','2016-12-01 15:07:04','Rolen'),(50,'Update Family','Update','2016-12-01 15:07:11','Rolen'),(51,'Update Family','Update','2016-12-01 17:39:02','Rolen'),(52,'0','Insert','2016-12-01 23:50:21','VEEnt'),(53,'0','Insert','2016-12-01 23:50:21','VEEnt'),(54,'0','Insert','2016-12-01 23:54:18','VEEnt'),(55,'0','Insert','2016-12-01 23:54:18','VEEnt'),(56,'Purchase Order','Insert','2016-12-02 00:07:19','Rolen'),(57,'Purchase Order','Insert','2016-12-02 01:51:01','Rolen'),(58,'New UOM','Insert','2016-12-02 14:51:07','JMDMktg'),(59,'New UOM','Insert','2016-12-02 14:53:31','JMDMktg'),(60,'New UOM','Insert','2016-12-02 15:10:18','JMDMktg'),(61,'New UOM','Insert','2016-12-02 15:11:04','JMDMktg'),(62,'New UOM','Insert','2016-12-02 15:17:26','JMDMktg'),(63,'New UOM','Insert','2016-12-02 15:21:43','JMDMktg'),(64,'New UOM','Insert','2016-12-02 15:22:01','JMDMktg'),(65,'New UOM','Insert','2016-12-02 15:28:57','JMDMktg'),(66,'New UOM','Insert','2016-12-02 15:29:06','JMDMktg'),(67,'New UOM','Insert','2016-12-02 15:29:57','JMDMktg'),(68,'New UOM','Insert','2016-12-02 15:30:39','JMDMktg'),(69,'New UOM','Insert','2016-12-02 21:53:47','JMDMktg'),(70,'New UOM','Insert','2016-12-02 22:01:57','JMDMktg'),(71,'New UOM','Insert','2016-12-02 22:03:43','JMDMktg'),(72,'New UOM','Insert','2016-12-02 22:03:54','JMDMktg'),(73,'New UOM','Insert','2016-12-02 22:04:49','JMDMktg'),(74,'New UOM','Insert','2016-12-02 22:06:21','JMDMktg'),(75,'New UOM','Insert','2016-12-02 22:06:28','JMDMktg'),(76,'New UOM','Insert','2016-12-02 22:06:37','JMDMktg'),(77,'0','Insert','2016-12-02 23:21:06','VEEnt'),(78,'0','Insert','2016-12-02 23:21:06','VEEnt'),(79,'0','Insert','2016-12-02 23:22:48','VEEnt'),(80,'0','Insert','2016-12-02 23:22:48','VEEnt'),(81,'Purchase Order','Insert','2016-12-03 10:00:33','Rolen'),(82,'121','Insert','2016-12-03 10:14:17','VEEnt'),(83,'121','Insert','2016-12-03 10:14:17','VEEnt'),(84,'12','Insert','2016-12-03 10:15:48','VEEnt'),(85,'12','Insert','2016-12-03 10:15:48','VEEnt'),(86,'New PO Received','Insert','2016-12-03 12:56:01','Rolen'),(87,'New PO Received','Insert','2016-12-03 13:03:11','Rolen'),(88,'Update Stock after PO Received','Update','2016-12-03 13:03:11','Rolen'),(89,'Purchase Order','Insert','2016-12-05 22:22:18','Rolen'),(90,'New UOM','Insert','2016-12-07 00:02:09','VEEnt'),(91,'0','Insert','2016-12-07 00:17:14','VEEnt'),(92,'0','Insert','2016-12-07 00:17:14','VEEnt'),(93,'0','Insert','2016-12-07 00:17:14','VEEnt'),(94,'New PO Received','Insert','2016-12-08 01:12:07','Rolen'),(95,'Update Stock after PO Received','Update','2016-12-08 01:12:07','Rolen'),(96,'Purchase Order','Insert','2016-12-08 01:15:13','Rolen'),(97,'New PO Received','Insert','2016-12-08 01:16:26','Rolen'),(98,'Update Stock after PO Received','Update','2016-12-08 01:16:26','Rolen'),(99,'New PO Received','Insert','2016-12-08 01:18:25','Rolen'),(100,'Update Stock after PO Received','Update','2016-12-08 01:18:25','Rolen'),(101,'New PO Received','Insert','2016-12-08 01:18:41','Rolen'),(102,'Update Stock after PO Received','Update','2016-12-08 01:18:41','Rolen'),(103,'Purchase Order','Insert','2016-12-08 01:19:43','Rolen'),(104,'Purchase Order','Insert','2016-12-08 01:25:05','Rolen'),(105,'New PO Received','Insert','2016-12-08 01:26:24','Rolen'),(106,'Update Stock after PO Received','Update','2016-12-08 01:26:24','Rolen'),(107,'0','Insert','2016-12-08 01:34:43','VEEnt'),(108,'0','Insert','2016-12-08 01:34:43','VEEnt'),(109,'0','Insert','2016-12-08 01:34:43','VEEnt'),(110,'0','Insert','2016-12-08 01:34:43','VEEnt'),(111,'0','Insert','2016-12-08 01:34:43','VEEnt'),(112,'Purchase Order','Insert','2016-12-08 01:35:29','Rolen'),(113,'New PO Received','Insert','2016-12-08 01:36:38','Rolen'),(114,'Update Stock after PO Received','Update','2016-12-08 01:36:38','Rolen'),(115,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:20:40','Rolen'),(116,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:21:38','Rolen'),(117,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:24:03','Rolen'),(118,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:24:26','Rolen'),(119,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:24:40','Rolen'),(120,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:24:58','Rolen'),(121,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:27:03','Rolen'),(122,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:27:52','Rolen'),(123,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:28:32','Rolen'),(124,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:30:08','Rolen'),(125,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:30:18','Rolen'),(126,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:30:27','Rolen'),(127,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:30:41','Rolen'),(128,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:31:38','Rolen'),(129,'Update Physical Count for Item variant : 43','Update','2016-12-08 02:31:51','Rolen'),(130,'Update Physical Count for Item variant : 46','Update','2016-12-08 02:31:58','Rolen'),(131,'New UOM','Insert','2016-12-08 23:25:19','VEEnt'),(132,'0','Insert','2016-12-09 00:13:36','VEEnt'),(133,'0','Insert','2016-12-09 00:13:37','VEEnt'),(134,'Purchase Order','Insert','2016-12-09 00:15:09','Rolen'),(135,'New PO Received','Insert','2016-12-09 00:18:29','Rolen'),(136,'Update Stock after PO Received','Update','2016-12-09 00:18:29','Rolen'),(137,'Purchase Order','Insert','2016-12-09 00:25:56','Rolen'),(138,'New PO Received','Insert','2016-12-09 00:26:34','Rolen'),(139,'Update Stock after PO Received','Update','2016-12-09 00:26:34','Rolen'),(140,'Purchase Order','Insert','2016-12-09 00:27:20','Rolen'),(141,'New PO Received','Insert','2016-12-09 00:27:52','Rolen'),(142,'Update Stock after PO Received','Update','2016-12-09 00:27:52','Rolen'),(143,'Update Physical Count for Item variant : 45','Update','2016-12-09 00:33:07','Rolen'),(144,'Update Physical Count for Item variant : 45','Update','2016-12-09 00:33:19','Rolen'),(145,'Update Physical Count for Item variant : 46','Update','2016-12-09 00:34:17','Rolen'),(146,'Update Physical Count for Item variant : 43','Update','2016-12-09 00:35:21','Rolen'),(147,'Update Physical Count for Item variant : 43','Update','2016-12-09 00:35:41','Rolen'),(148,'0','Insert','2016-12-09 01:04:54','VEEnt'),(149,'0','Insert','2016-12-09 01:04:54','VEEnt'),(150,'Purchase Order','Insert','2016-12-09 01:05:41','Rolen'),(151,'0','Insert','2016-12-09 01:08:17','VEEnt'),(152,'0','Insert','2016-12-09 01:08:17','VEEnt'),(153,'Purchase Order','Insert','2016-12-09 01:08:53','Rolen'),(154,'New PO Received','Insert','2016-12-09 01:09:40','Rolen'),(155,'Update Stock after PO Received','Update','2016-12-09 01:09:40','Rolen'),(156,'0','Insert','2016-12-09 01:13:22','VEEnt'),(157,'0','Insert','2016-12-09 01:13:23','VEEnt'),(158,'Purchase Order','Insert','2016-12-09 01:14:24','Rolen'),(159,'New PO Received','Insert','2016-12-09 01:15:31','Rolen'),(160,'Update Stock after PO Received','Update','2016-12-09 01:15:31','Rolen'),(161,'0','Insert','2016-12-09 01:20:39','VEEnt'),(162,'0','Insert','2016-12-09 01:20:39','VEEnt'),(163,'Purchase Order','Insert','2016-12-09 01:23:50','Rolen'),(164,'New PO Received','Insert','2016-12-09 01:24:38','Rolen'),(165,'Update Stock after PO Received','Update','2016-12-09 01:24:38','Rolen'),(166,'0','Insert','2016-12-09 01:28:33','VEEnt'),(167,'0','Insert','2016-12-09 01:28:33','VEEnt'),(168,'Purchase Order','Insert','2016-12-09 01:31:33','Rolen'),(169,'New PO Received','Insert','2016-12-09 01:32:12','Rolen'),(170,'Update Stock after PO Received','Update','2016-12-09 01:32:12','Rolen'),(171,'0','Insert','2016-12-09 08:01:15','VEEnt'),(172,'0','Insert','2016-12-09 08:01:15','VEEnt'),(173,'0','Insert','2016-12-09 08:05:43','VEEnt'),(174,'0','Insert','2016-12-09 08:05:43','VEEnt'),(175,'Purchase Order','Insert','2016-12-09 08:07:49','Rolen'),(176,'New PO Received','Insert','2016-12-09 08:08:29','Rolen'),(177,'New PO Received','Insert','2016-12-09 08:08:31','Rolen'),(178,'New PO Received','Insert','2016-12-09 08:08:43','Rolen'),(179,'New PO Received','Insert','2016-12-09 08:09:17','Rolen'),(180,'New PO Received','Insert','2016-12-09 08:09:47','Rolen'),(181,'Update Stock after PO Received','Update','2016-12-09 08:09:47','Rolen'),(182,'Purchase Order','Insert','2016-12-09 08:15:35','Rolen'),(183,'New PO Received','Insert','2016-12-09 08:16:53','Rolen'),(184,'Update Stock after PO Received','Update','2016-12-09 08:16:53','Rolen'),(185,'Purchase Order','Insert','2016-12-09 08:18:53','Rolen'),(186,'New PO Received','Insert','2016-12-09 09:13:05','Rolen'),(187,'Update Stock after PO Received','Update','2016-12-09 09:13:05','Rolen'),(188,'Purchase Order','Insert','2016-12-09 09:13:55','Rolen'),(189,'New PO Received','Insert','2016-12-09 09:14:40','Rolen'),(190,'Update Stock after PO Received','Update','2016-12-09 09:14:40','Rolen'),(191,'Update Family','Update','2016-12-09 09:28:49','Rolen'),(192,'Delete Family','Delete','2016-12-09 09:29:47','Rolen'),(193,'Delete Family','Delete','2016-12-09 09:29:52','Rolen'),(194,'Delete Category','Delete','2016-12-09 09:29:54','Rolen'),(195,'New Family','Insert','2016-12-09 09:31:57','Rolen'),(196,'New Family','Insert','2016-12-09 09:46:53','Rolen'),(197,'New Family','Insert','2016-12-09 09:47:08','Rolen'),(198,'Delete Family','Delete','2016-12-09 09:47:30','Rolen'),(199,'Delete Family','Delete','2016-12-09 09:47:33','Rolen'),(200,'New Family','Insert','2016-12-09 09:47:55','Rolen'),(201,'New Family','Insert','2016-12-09 09:48:43','Rolen'),(202,'New Family','Insert','2016-12-09 09:49:16','Rolen'),(203,'New Family','Insert','2016-12-09 09:52:26','Rolen'),(204,'Delete Family','Delete','2016-12-09 09:52:50','Rolen'),(205,'Delete Family','Delete','2016-12-09 09:52:53','Rolen'),(206,'Delete Family','Delete','2016-12-09 09:52:55','Rolen'),(207,'Delete Family','Delete','2016-12-09 09:52:57','Rolen'),(208,'New Family','Insert','2016-12-09 09:53:02','Rolen'),(209,'New Family','Insert','2016-12-09 09:53:09','Rolen'),(210,'New Family','Insert','2016-12-09 09:53:38','Rolen'),(211,'New Family','Insert','2016-12-09 09:55:54','Rolen'),(212,'Delete Family','Delete','2016-12-09 09:56:38','Rolen'),(213,'Delete Family','Delete','2016-12-09 09:56:40','Rolen'),(214,'Delete Family','Delete','2016-12-09 09:56:42','Rolen'),(215,'Delete Family','Delete','2016-12-09 09:56:45','Rolen'),(216,'Delete Family','Delete','2016-12-09 09:56:48','Rolen'),(217,'New Family','Insert','2016-12-09 09:56:59','Rolen'),(218,'New Family','Insert','2016-12-09 10:00:32','Rolen'),(219,'Delete Family','Delete','2016-12-09 10:00:49','Rolen'),(220,'New Category','Insert','2016-12-09 10:06:21','Rolen'),(221,'New Category','Insert','2016-12-09 10:08:41','Rolen'),(222,'New Category','Insert','2016-12-09 10:10:50','Rolen'),(223,'New Category','Insert','2016-12-09 10:13:31','Rolen'),(224,'New Sub-Category','Insert','2016-12-09 10:17:58','Rolen'),(225,'New Sub-Category','Insert','2016-12-09 10:19:13','Rolen'),(226,'New Sub-Category','Insert','2016-12-09 10:19:20','Rolen'),(227,'New Sub-Category','Insert','2016-12-09 10:19:35','Rolen'),(228,'New Family','Insert','2016-12-09 10:21:31','Rolen'),(229,'New Category','Insert','2016-12-09 10:21:47','Rolen'),(230,'New Category','Insert','2016-12-09 10:22:02','Rolen'),(231,'New Sub-Category','Insert','2016-12-09 10:22:12','Rolen'),(232,'New Sub-Category','Insert','2016-12-09 10:22:23','Rolen'),(233,'New Sub-Category','Insert','2016-12-09 10:22:29','Rolen'),(234,'New Sub-Category','Insert','2016-12-09 10:22:36','Rolen'),(235,'New Sub-Category','Insert','2016-12-09 10:22:43','Rolen'),(236,'New Sub-Category','Insert','2016-12-09 10:22:50','Rolen'),(237,'New Sub-Category','Insert','2016-12-09 10:22:56','Rolen'),(238,'New Sub-Category','Insert','2016-12-09 10:23:02','Rolen'),(239,'New Family','Insert','2016-12-09 10:40:51','Rolen'),(240,'New Family','Insert','2016-12-09 10:41:00','Rolen'),(241,'New Family','Insert','2016-12-09 10:41:10','Rolen'),(242,'New Family','Insert','2016-12-09 10:41:19','Rolen'),(243,'New Category','Insert','2016-12-09 10:41:36','Rolen'),(244,'New Category','Insert','2016-12-09 10:41:45','Rolen'),(245,'New Sub-Category','Insert','2016-12-09 20:40:08','Rolen'),(246,'0','Insert','2016-12-09 20:40:48','VEEnt'),(247,'0','Insert','2016-12-09 20:40:48','VEEnt'),(248,'0','Insert','2016-12-09 21:45:47','VEEnt'),(249,'0','Insert','2016-12-09 21:45:47','VEEnt'),(250,'0','Insert','2016-12-09 21:45:47','VEEnt'),(251,'Purchase Order','Insert','2016-12-09 21:47:16','Rolen'),(252,'New PO Received','Insert','2016-12-09 21:48:20','Rolen'),(253,'Update Stock after PO Received','Update','2016-12-09 21:48:20','Rolen'),(254,'Update Physical Count for Item variant : 56','Update','2016-12-09 22:03:36','Rolen'),(255,'Update Physical Count for Item variant : 55','Update','2016-12-09 22:04:48','Rolen'),(256,'Purchase Order','Insert','2016-12-09 22:05:50','Rolen'),(257,'New PO Received','Insert','2016-12-09 22:08:58','Rolen'),(258,'Update Stock after PO Received','Update','2016-12-09 22:08:58','Rolen'),(259,'New Category','Insert','2016-12-12 22:57:38','Rolen'),(260,'New Category','Insert','2016-12-12 22:57:52','Rolen'),(261,'Delete Family','Delete','2016-12-12 22:58:02','Rolen'),(262,'New Category','Insert','2016-12-12 22:58:16','Rolen'),(263,'New Sub-Category','Insert','2016-12-12 22:58:25','Rolen'),(264,'New Sub-Category','Insert','2016-12-12 22:58:32','Rolen'),(265,'New Sub-Category','Insert','2016-12-12 22:58:37','Rolen'),(266,'New Category','Insert','2016-12-12 22:58:49','Rolen'),(267,'New Category','Insert','2016-12-12 22:59:03','Rolen'),(268,'New Sub-Category','Insert','2016-12-12 22:59:15','Rolen'),(269,'New Sub-Category','Insert','2016-12-12 22:59:22','Rolen'),(270,'New Sub-Category','Insert','2016-12-12 22:59:29','Rolen'),(271,'New Sub-Category','Insert','2016-12-12 22:59:35','Rolen'),(272,'New Family','Insert','2016-12-12 23:00:00','Rolen'),(273,'New Category','Insert','2016-12-12 23:00:11','Rolen'),(274,'New Category','Insert','2016-12-12 23:00:23','Rolen'),(275,'New Family','Insert','2016-12-12 23:00:34','Rolen'),(276,'New Sub-Category','Insert','2016-12-12 23:00:49','Rolen'),(277,'New Sub-Category','Insert','2016-12-12 23:00:55','Rolen'),(278,'New Sub-Category','Insert','2016-12-12 23:01:06','Rolen'),(279,'New Sub-Category','Insert','2016-12-12 23:01:11','Rolen'),(280,'New Sub-Category','Insert','2016-12-12 23:01:17','Rolen'),(281,'New Category','Insert','2016-12-12 23:01:32','Rolen'),(282,'New Category','Insert','2016-12-12 23:01:40','Rolen'),(283,'New Category','Insert','2016-12-12 23:01:49','Rolen'),(284,'New Family','Insert','2016-12-12 23:01:59','Rolen'),(285,'New Category','Insert','2016-12-12 23:02:09','Rolen'),(286,'New Category','Insert','2016-12-12 23:02:17','Rolen'),(287,'Delete Sub-Category','Delete','2016-12-12 23:03:18','Rolen'),(288,'0','Insert','2016-12-26 10:29:58','VEEnt'),(289,'0','Insert','2016-12-26 10:29:58','VEEnt'),(290,'0','Insert','2016-12-26 10:29:58','VEEnt'),(291,'Purchase Order','Insert','2016-12-26 10:30:45','Rolen'),(292,'New PO Received','Insert','2016-12-26 10:31:31','Rolen'),(293,'Update Stock after PO Received','Update','2016-12-26 10:31:31','Rolen'),(294,'New customer','Insert','2016-12-30 12:02:02',NULL),(295,'New Order','Insert','2016-12-30 12:02:02',NULL),(296,'','Insert','2016-12-30 12:02:02',NULL),(297,'New customer','Insert','2016-12-30 12:03:57',NULL),(298,'New Order','Insert','2016-12-30 12:03:57',NULL),(299,'','Insert','2016-12-30 12:03:58',NULL),(300,'New customer','Insert','2016-12-30 12:10:28',NULL),(301,'New Order','Insert','2016-12-30 12:10:28',NULL),(302,'','Insert','2016-12-30 12:10:28',NULL),(303,'','Insert','2016-12-30 12:10:28',NULL),(304,'','Insert','2016-12-30 12:10:28',NULL),(305,'New customer','Insert','2016-12-30 18:21:23',NULL),(306,'New Order','Insert','2016-12-30 18:21:23',NULL),(307,'','Insert','2016-12-30 18:21:23',NULL),(308,'','Insert','2016-12-30 18:21:23',NULL),(309,'New customer','Insert','2016-12-30 19:46:43',NULL),(310,'New Order','Insert','2016-12-30 19:46:43',NULL),(311,'','Insert','2016-12-30 19:46:43',NULL),(312,'','Insert','2016-12-30 19:46:43',NULL),(313,'New customer','Insert','2016-12-30 19:49:39',NULL),(314,'New Order','Insert','2016-12-30 19:49:40',NULL),(315,'','Insert','2016-12-30 19:49:40',NULL),(316,'New customer','Insert','2016-12-30 19:50:57',NULL),(317,'New Order','Insert','2016-12-30 19:50:57',NULL),(318,'','Insert','2016-12-30 19:50:57',NULL),(319,'New customer','Insert','2016-12-30 19:51:56',NULL),(320,'','Insert','2016-12-30 19:51:56',NULL),(321,'New Order','Insert','2016-12-30 19:51:56',NULL),(322,'','Insert','2016-12-30 19:51:56',NULL),(323,'New Order','Insert','2016-12-30 20:23:08','test@yahoo.com'),(324,'','Insert','2016-12-30 20:23:08','test@yahoo.com'),(325,'New Order','Insert','2017-01-02 10:38:32','test@yahoo.com'),(326,'','Insert','2017-01-02 10:38:32','test@yahoo.com'),(327,'New Order','Insert','2017-01-02 12:29:02','test@yahoo.com'),(328,'','Insert','2017-01-02 12:29:02','test@yahoo.com'),(329,'New Order','Insert','2017-01-02 12:31:00','test@yahoo.com'),(330,'','Insert','2017-01-02 12:31:00','test@yahoo.com'),(331,'','Insert','2017-01-02 12:31:00','test@yahoo.com'),(332,'New Order','Insert','2017-01-02 13:29:59','test@yahoo.com'),(333,'','Insert','2017-01-02 13:29:59','test@yahoo.com'),(334,'','Insert','2017-01-02 13:29:59','test@yahoo.com'),(335,'Order number: 00000001  set order status to Process','Update','2017-01-02 13:39:50','Rolen'),(336,'Order number: 00000001  set order status to Ship','Update','2017-01-02 17:35:49','Rolen'),(337,'Decrease Stock after Order to shipped','Update','2017-01-02 17:35:49','Rolen'),(338,'Order number: 00000003  set order status to Process','Update','2017-01-02 17:37:00','Rolen'),(339,'Order number: 00000003  set order status to Ship','Update','2017-01-02 17:37:03','Rolen'),(340,'Decrease Stock after Order to shipped','Update','2017-01-02 17:37:03','Rolen'),(341,'Order number: 00000004  set order status to Process','Update','2017-01-02 17:37:55','Rolen'),(342,'Order number: 00000004  set order status to Ship','Update','2017-01-02 17:37:59','Rolen'),(343,'Decrease Stock after Order to shipped','Update','2017-01-02 17:37:59','Rolen'),(344,'Order number: 00000005  set order status to Process','Update','2017-01-02 17:39:20','Rolen'),(345,'Order number: 00000006  set order status to Process','Update','2017-01-02 17:39:37','Rolen'),(346,'Order number: 00000005  set order status to Ship','Update','2017-01-02 17:40:46','Rolen'),(347,'Decrease Stock after Order to shipped','Update','2017-01-02 17:40:47','Rolen'),(348,'Order number: 00000006  set order status to Ship','Update','2017-01-02 17:41:20','Rolen'),(349,'Decrease Stock after Order to shipped','Update','2017-01-02 17:41:20','Rolen'),(350,'New Order','Insert','2017-01-03 11:35:53','test@yahoo.com'),(351,'','Insert','2017-01-03 11:35:53','test@yahoo.com'),(352,'','Insert','2017-01-03 11:35:54','test@yahoo.com'),(353,'','Insert','2017-01-03 11:35:54','test@yahoo.com'),(354,'Purchase Order','Insert','2017-01-11 15:22:36','Rolen'),(355,'New PO Received','Insert','2017-01-11 15:26:03','Rolen'),(356,'New PO Received','Insert','2017-01-11 15:28:23','Rolen'),(357,'New PO Received','Insert','2017-01-11 15:29:11','Rolen'),(358,'Update Stock after PO Received','Update','2017-01-11 15:29:11','Rolen'),(359,'Purchase Order','Insert','2017-01-11 15:53:21','Rolen'),(360,'New PO Received','Insert','2017-01-11 15:54:19','Rolen'),(361,'Update Stock after PO Received','Update','2017-01-11 15:54:19','Rolen'),(362,'Purchase Order','Insert','2017-01-11 15:55:19','Rolen'),(363,'New PO Received','Insert','2017-01-11 15:59:26','Rolen'),(364,'Update Stock after PO Received','Update','2017-01-11 15:59:27','Rolen'),(365,'Update Pending PO Received','Insert','2017-01-11 16:04:01','Rolen'),(366,'Update Stock after PO Received','Update','2017-01-11 16:04:01','Rolen'),(367,'Purchase Order','Insert','2017-01-11 16:05:42','Rolen'),(368,'Purchase Order','Insert','2017-01-11 16:43:40','Rolen'),(369,'Update Physical Count for Item variant : 55','Update','2017-01-11 17:12:32','Rolen'),(370,'Update Physical Count for Item variant : 58','Update','2017-01-11 17:12:50','Rolen'),(371,'Update Physical Count for Item variant : 59','Update','2017-01-11 17:12:59','Rolen'),(372,'Purchase Order','Insert','2017-01-11 17:13:27','Rolen'),(373,'New PO Received','Insert','2017-01-11 17:14:17','Rolen'),(374,'Update Stock after PO Received','Update','2017-01-11 17:14:17','Rolen'),(375,'Update Physical Count for Item variant : 58','Update','2017-01-11 17:16:58','Rolen'),(376,'Update Physical Count for Item variant : 59','Update','2017-01-11 17:17:03','Rolen'),(377,'Update Pending PO Received','Insert','2017-01-11 17:17:22','Rolen'),(378,'Update Stock after PO Received','Update','2017-01-11 17:17:22','Rolen'),(379,'Update Pending PO Received','Insert','2017-01-11 17:20:23','Rolen'),(380,'Update Stock after PO Received','Update','2017-01-11 17:20:24','Rolen'),(381,'Update Pending PO Received','Insert','2017-01-11 17:21:13','Rolen'),(382,'Update Stock after PO Received','Update','2017-01-11 17:21:13','Rolen'),(383,'Purchase Order','Insert','2017-01-11 18:06:20','Rolen'),(384,'New PO Received','Insert','2017-01-11 18:07:04','Rolen'),(385,'Update Stock after PO Received','Update','2017-01-11 18:07:04','Rolen'),(386,'Update Pending PO Received','Insert','2017-01-11 18:10:01','Rolen'),(387,'Update Stock after PO Received','Update','2017-01-11 18:10:01','Rolen'),(388,'New customer','Insert','2017-01-19 13:01:24',NULL),(389,'','Insert','2017-01-19 13:01:25',NULL),(390,'New Order','Insert','2017-01-19 13:01:25',NULL),(391,'','Insert','2017-01-19 13:01:25',NULL),(392,'New customer','Insert','2017-01-19 13:05:13',NULL),(393,'','Insert','2017-01-19 13:05:14',NULL),(394,'New Order','Insert','2017-01-19 13:05:14',NULL),(395,'','Insert','2017-01-19 13:05:15',NULL),(396,'New customer','Insert','2017-01-19 14:07:54',NULL),(397,'','Insert','2017-01-19 14:07:55',NULL),(398,'New Order','Insert','2017-01-19 14:07:55',NULL),(399,'','Insert','2017-01-19 14:07:56',NULL),(400,'New customer','Insert','2017-01-19 14:10:33',NULL),(401,'','Insert','2017-01-19 14:10:35',NULL),(402,'New Order','Insert','2017-01-19 14:10:35',NULL),(403,'','Insert','2017-01-19 14:10:35',NULL),(404,'','Insert','2017-01-19 14:10:35',NULL),(405,'','Insert','2017-01-19 14:10:35',NULL),(406,'New customer','Insert','2017-01-19 14:13:28',NULL),(407,'','Insert','2017-01-19 14:13:30',NULL),(408,'New Order','Insert','2017-01-19 14:13:30',NULL),(409,'','Insert','2017-01-19 14:13:30',NULL),(410,'New customer','Insert','2017-01-19 14:32:12',NULL),(411,'','Insert','2017-01-19 14:32:14',NULL),(412,'New Order','Insert','2017-01-19 14:32:14',NULL),(413,'','Insert','2017-01-19 14:32:14',NULL),(414,'Order number: 00000011  set order status to Process','Update','2017-01-19 15:28:51','Rolen'),(415,'Order number: 00000013  set order status to Process','Update','2017-01-19 15:30:53','Rolen'),(416,'Order number: 00000013  set order status to Process','Update','2017-01-19 15:31:15','Rolen'),(417,'Order number: 00000012  set order status to Process','Update','2017-01-19 15:32:08','Rolen'),(418,'Order number: 00000010  set order status to Process','Update','2017-01-19 15:33:12','Rolen'),(419,'Order number: 00000007  set order status to Process','Update','2017-01-19 15:34:07','Rolen'),(420,'Order number: 00000013  set order status to Ship','Update','2017-01-19 15:34:23','Rolen'),(421,'Decrease Stock after Order to shipped','Update','2017-01-19 15:34:23','Rolen'),(422,'New customer','Insert','2017-01-19 15:45:51',NULL),(423,'','Insert','2017-01-19 15:45:53',NULL),(424,'New Order','Insert','2017-01-19 15:45:53',NULL),(425,'','Insert','2017-01-19 15:45:53',NULL),(426,'','Insert','2017-01-19 15:45:53',NULL),(427,'','Insert','2017-01-19 15:45:53',NULL),(428,'Order number: 00000001  set order status to Process','Update','2017-01-19 15:46:44','Rolen'),(429,'Order number: 00000001  set order status to Ship','Update','2017-01-19 15:47:05','Rolen'),(430,'Decrease Stock after Order to shipped','Update','2017-01-19 15:47:06','Rolen'),(431,'New Sub-Category','Insert','2017-01-19 22:29:14','Rolen'),(432,'New Sub-Category','Insert','2017-01-19 22:33:15','Rolen'),(433,'New customer','Insert','2017-01-19 22:42:08',NULL),(434,'','Insert','2017-01-19 22:42:09',NULL),(435,'New Order','Insert','2017-01-19 22:42:09',NULL),(436,'','Insert','2017-01-19 22:42:09',NULL),(437,'New customer','Insert','2017-01-19 22:45:34',NULL),(438,'','Insert','2017-01-19 22:45:34',NULL),(439,'New Order','Insert','2017-01-19 22:45:34',NULL),(440,'','Insert','2017-01-19 22:45:35',NULL),(441,'Delete Family','Delete','2017-01-27 16:11:15','Rolen'),(442,'Delete Family','Delete','2017-01-27 16:11:18','Rolen'),(443,'Delete Family','Delete','2017-01-27 16:11:20','Rolen'),(444,'Delete Family','Delete','2017-01-27 16:11:22','Rolen'),(445,'Delete Family','Delete','2017-01-27 16:11:24','Rolen'),(446,'New Family','Insert','2017-01-27 16:11:29','Rolen'),(447,'New Family','Insert','2017-01-27 16:11:34','Rolen'),(448,'Delete Category','Delete','2017-01-27 16:11:41','Rolen'),(449,'New Category','Insert','2017-01-27 16:16:32','Rolen'),(450,'New Category','Insert','2017-01-27 16:16:42','Rolen'),(451,'0','Insert','2017-01-27 16:29:37','Rolen'),(452,'0','Insert','2017-01-27 16:29:37','Rolen'),(453,'0','Insert','2017-01-27 16:29:37','Rolen'),(454,'0','Insert','2017-01-27 16:29:37','Rolen'),(455,'0','Insert','2017-01-27 17:10:17','Rolen'),(456,'0','Insert','2017-01-27 17:10:17','Rolen'),(457,'0','Insert','2017-01-27 17:29:38','Rolen'),(458,'0','Insert','2017-01-27 17:29:38','Rolen'),(459,'New UOM','Insert','2017-01-28 08:44:01','Rolen'),(460,'New UOM','Insert','2017-01-28 08:45:24','Rolen'),(461,'New UOM','Insert','2017-01-28 08:46:21','Rolen'),(462,'New UOM','Insert','2017-01-28 08:47:23','Rolen'),(463,'Update Physical Count for Item variant : 1','Update','2017-01-28 08:49:00','Rolen'),(464,'Update Physical Count for Item variant : 2','Update','2017-01-28 08:49:06','Rolen'),(465,'Update Physical Count for Item variant : 3','Update','2017-01-28 08:49:12','Rolen'),(466,'Update Physical Count for Item variant : 4','Update','2017-01-28 08:49:17','Rolen'),(467,'Update Physical Count for Item variant : 5','Update','2017-01-28 08:49:22','Rolen'),(468,'Update Physical Count for Item variant : 1','Update','2017-01-28 08:49:28','Rolen'),(469,'Update Physical Count for Item variant : 2','Update','2017-01-28 08:49:33','Rolen'),(470,'New customer','Insert','2017-02-02 23:49:03',NULL),(471,'','Insert','2017-02-02 23:49:03',NULL),(472,'New customer','Insert','2017-02-02 23:50:41',NULL),(473,'','Insert','2017-02-02 23:50:41',NULL),(474,'New customer','Insert','2017-02-02 23:51:29',NULL),(475,'','Insert','2017-02-02 23:51:29',NULL),(476,'New customer','Insert','2017-02-02 23:53:03',NULL),(477,'','Insert','2017-02-02 23:53:03',NULL),(478,'New Order','Insert','2017-02-02 23:53:05',NULL),(479,'','Insert','2017-02-02 23:53:05',NULL),(480,'New customer','Insert','2017-02-03 00:13:02',NULL),(481,'','Insert','2017-02-03 00:13:02',NULL),(482,'New Order','Insert','2017-02-03 00:13:02',NULL),(483,'','Insert','2017-02-03 00:13:03',NULL),(484,'','Insert','2017-02-03 00:13:03',NULL),(485,'','Insert','2017-02-03 00:13:03',NULL),(486,'New customer','Insert','2017-02-03 01:01:11',NULL),(487,'','Insert','2017-02-03 01:01:11',NULL),(488,'New Order','Insert','2017-02-03 01:01:12',NULL),(489,'','Insert','2017-02-03 01:01:12',NULL),(490,'New customer','Insert','2017-02-03 01:04:26',NULL),(491,'','Insert','2017-02-03 01:04:26',NULL),(492,'New Order','Insert','2017-02-03 01:04:27',NULL),(493,'','Insert','2017-02-03 01:04:27',NULL),(494,'','Insert','2017-02-03 01:04:27',NULL),(495,'','Insert','2017-02-03 01:04:27',NULL),(496,'','Insert','2017-02-03 01:04:27',NULL),(497,'','Insert','2017-02-03 01:04:27',NULL);

/*Table structure for table `tblorder` */

DROP TABLE IF EXISTS `tblorder`;

CREATE TABLE `tblorder` (
  `CustomerNo` INT(11) DEFAULT NULL,
  `OrderNo` INT(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `ShipAddress` TEXT,
  `TotalAmount` DOUBLE(10,2) DEFAULT NULL,
  `Date` DATETIME DEFAULT NULL,
  `Ship` INT(11) DEFAULT NULL,
  `Status` VARCHAR(50) DEFAULT 'New',
  `SalesNo` INT(4) UNSIGNED ZEROFILL DEFAULT NULL,
  `TransactionDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`OrderNo`),
  KEY `FKSales_order` (`SalesNo`),
  KEY `CustomerNo` (`CustomerNo`),
  CONSTRAINT `tblorder_ibfk_1` FOREIGN KEY (`CustomerNo`) REFERENCES `customer` (`CustomerNo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tblorder` */

INSERT  INTO `tblorder`(`CustomerNo`,`OrderNo`,`ShipAddress`,`TotalAmount`,`Date`,`Ship`,`Status`,`SalesNo`,`TransactionDate`) VALUES (26,00000001,'test',112.22,'2017-02-02 23:53:03',NULL,'New',NULL,NULL),(26,00000002,'test',1012.22,'2017-02-03 00:13:02',NULL,'New',NULL,NULL),(26,00000003,'test',300.00,'2017-02-03 01:01:11',NULL,'New',NULL,NULL),(26,00000004,'test',4012.22,'2017-02-03 01:04:26',NULL,'New',NULL,NULL);

/*Table structure for table `tblorderdetails` */

DROP TABLE IF EXISTS `tblorderdetails`;

CREATE TABLE `tblorderdetails` (
  `OrderNo` INT(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `ItemVariantNo` VARCHAR(10) DEFAULT NULL,
  `Quantity` INT(11) DEFAULT NULL,
  `Price` DOUBLE(10,2) DEFAULT NULL,
  `SubTotal` DOUBLE(10,2) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `tblorderdetails` */

INSERT  INTO `tblorderdetails`(`OrderNo`,`ItemVariantNo`,`Quantity`,`Price`,`SubTotal`) VALUES (00000001,'0002-4',1,112.22,112.22),(00000002,'0001-1',1,600.00,600.00),(00000002,'0002-4',1,112.22,112.22),(00000002,'0003-5',1,300.00,300.00),(00000003,'0003-5',1,300.00,300.00),(00000004,'0001-1',1,600.00,600.00),(00000004,'0001-2',1,1200.00,1200.00),(00000004,'0001-3',1,1800.00,1800.00),(00000004,'0002-4',1,112.22,112.22),(00000004,'0003-5',1,300.00,300.00);

/*Table structure for table `tbluom` */

DROP TABLE IF EXISTS `tbluom`;

CREATE TABLE `tbluom` (
  `ID` INT(11) NOT NULL AUTO_INCREMENT,
  `UOMCode` VARCHAR(10) DEFAULT NULL,
  `Description` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `tbluom` */

INSERT  INTO `tbluom`(`ID`,`UOMCode`,`Description`) VALUES (1,'ea','each'),(2,'set','set'),(3,'g','grams'),(4,'kg','kilograms'),(5,'mm','Millimeter'),(6,'lbs','pounds'),(7,'L','Liters'),(8,'yd','yard'),(9,'pk','pack'),(10,'ft','feet'),(11,'ltr','liters'),(12,'te','test');

/*Table structure for table `walkin` */

DROP TABLE IF EXISTS `walkin`;

CREATE TABLE `walkin` (
  `WalkInNo` INT(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(30) DEFAULT NULL,
  `CustomerAddress` VARCHAR(50) DEFAULT NULL,
  `CustomerNo` INT(11) DEFAULT NULL,
  `OrderListNo` INT(11) DEFAULT NULL,
  PRIMARY KEY (`WalkInNo`),
  KEY `FKCustomer_walkin` (`CustomerNo`),
  KEY `FKOrderList_walkin` (`OrderListNo`),
  CONSTRAINT `FKCustomer_walkin` FOREIGN KEY (`CustomerNo`) REFERENCES `customer` (`CustomerNo`),
  CONSTRAINT `FKOrderList_walkin` FOREIGN KEY (`OrderListNo`) REFERENCES `orderlist` (`OrderListNo`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

/*Data for the table `walkin` */

/*Table structure for table `vw_allorders` */

DROP TABLE IF EXISTS `vw_allorders`;

/*!50001 DROP VIEW IF EXISTS `vw_allorders` */;
/*!50001 DROP TABLE IF EXISTS `vw_allorders` */;

/*!50001 CREATE TABLE  `vw_allorders`(
 `ViewItems` varchar(74) ,
 `CustomerNo` int(11) ,
 `OrderNo` int(8) unsigned zerofill ,
 `NoOfItems` bigint(21) ,
 `CustomerName` varchar(61) ,
 `Address` text ,
 `ShipAddress` text ,
 `OrderDate` datetime ,
 `TotalAmount` varchar(46) ,
 `Status` varchar(50) ,
 `Action` varchar(213) 
)*/;

/*Table structure for table `vw_getbackorders` */

DROP TABLE IF EXISTS `vw_getbackorders`;

/*!50001 DROP VIEW IF EXISTS `vw_getbackorders` */;
/*!50001 DROP TABLE IF EXISTS `vw_getbackorders` */;

/*!50001 CREATE TABLE  `vw_getbackorders`(
 `RequestListNo` int(11) ,
 `SupplierName` varchar(50) ,
 `SupplierNo` int(11) ,
 `ItemDescription` mediumtext ,
 `Received` int(11) ,
 `PendingQuantity` int(11) ,
 `DateReceive` datetime 
)*/;

/*Table structure for table `vw_getcategories` */

DROP TABLE IF EXISTS `vw_getcategories`;

/*!50001 DROP VIEW IF EXISTS `vw_getcategories` */;
/*!50001 DROP TABLE IF EXISTS `vw_getcategories` */;

/*!50001 CREATE TABLE  `vw_getcategories`(
 `Level1No` int(11) ,
 `Family` varchar(50) ,
 `ImageFile` text ,
 `Level2No` int(11) ,
 `Category` varchar(176) ,
 `Level3No` int(11) ,
 `SubCategory` varchar(176) 
)*/;

/*Table structure for table `vw_getlowstockbysupplier` */

DROP TABLE IF EXISTS `vw_getlowstockbysupplier`;

/*!50001 DROP VIEW IF EXISTS `vw_getlowstockbysupplier` */;
/*!50001 DROP TABLE IF EXISTS `vw_getlowstockbysupplier` */;

/*!50001 CREATE TABLE  `vw_getlowstockbysupplier`(
 `ItemNo` varchar(22) ,
 `ItemDescription` mediumtext ,
 `STOCKS` bigint(11) ,
 `LOWSTOCKS` bigint(11) ,
 `CRITICAL` bigint(11) ,
 `SupplierNo` int(11) 
)*/;

/*Table structure for table `vw_getmostcustomer` */

DROP TABLE IF EXISTS `vw_getmostcustomer`;

/*!50001 DROP VIEW IF EXISTS `vw_getmostcustomer` */;
/*!50001 DROP TABLE IF EXISTS `vw_getmostcustomer` */;

/*!50001 CREATE TABLE  `vw_getmostcustomer`(
 `CustomerName` varchar(61) ,
 `Total` bigint(21) ,
 `Percentage` int(1) 
)*/;

/*Table structure for table `vw_getmostordereditems` */

DROP TABLE IF EXISTS `vw_getmostordereditems`;

/*!50001 DROP VIEW IF EXISTS `vw_getmostordereditems` */;
/*!50001 DROP TABLE IF EXISTS `vw_getmostordereditems` */;

/*!50001 CREATE TABLE  `vw_getmostordereditems`(
 `Name` varchar(50) ,
 `Total` decimal(32,0) ,
 `Percentage` int(1) 
)*/;

/*Table structure for table `vw_getorderbysupplier` */

DROP TABLE IF EXISTS `vw_getorderbysupplier`;

/*!50001 DROP VIEW IF EXISTS `vw_getorderbysupplier` */;
/*!50001 DROP TABLE IF EXISTS `vw_getorderbysupplier` */;

/*!50001 CREATE TABLE  `vw_getorderbysupplier`(
 `Action` varchar(134) ,
 `ItemNo` varchar(22) ,
 `Description` mediumtext ,
 `DPOCost` double ,
 `SupplierNo` int(11) 
)*/;

/*Table structure for table `vw_getpendingitemsbysupplyrequestno` */

DROP TABLE IF EXISTS `vw_getpendingitemsbysupplyrequestno`;

/*!50001 DROP VIEW IF EXISTS `vw_getpendingitemsbysupplyrequestno` */;
/*!50001 DROP TABLE IF EXISTS `vw_getpendingitemsbysupplyrequestno` */;

/*!50001 CREATE TABLE  `vw_getpendingitemsbysupplyrequestno`(
 `ItemNo` varchar(22) ,
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `ItemDescription` mediumtext ,
 `ImageFile` text ,
 `DPOCost` varchar(62) ,
 `RequestsQty` int(11) ,
 `Received` int(11) ,
 `SubTotal` varchar(46) ,
 `SupplierName` varchar(50) 
)*/;

/*Table structure for table `vw_getposubmit` */

DROP TABLE IF EXISTS `vw_getposubmit`;

/*!50001 DROP VIEW IF EXISTS `vw_getposubmit` */;
/*!50001 DROP TABLE IF EXISTS `vw_getposubmit` */;

/*!50001 CREATE TABLE  `vw_getposubmit`(
 `Remove` varchar(95) ,
 `ItemQty` varchar(114) ,
 `Item` varchar(22) ,
 `ItemDescription` mediumtext ,
 `DPOCost` varchar(62) ,
 `Total` varchar(62) ,
 `createdby` varchar(50) ,
 `SupplierNo` int(11) ,
 `RequestListNo` int(11) 
)*/;

/*Table structure for table `vw_getpotoreceive` */

DROP TABLE IF EXISTS `vw_getpotoreceive`;

/*!50001 DROP VIEW IF EXISTS `vw_getpotoreceive` */;
/*!50001 DROP TABLE IF EXISTS `vw_getpotoreceive` */;

/*!50001 CREATE TABLE  `vw_getpotoreceive`(
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `NoOfItems` bigint(21) ,
 `SupplierName` varchar(50) ,
 `Date` datetime ,
 `DeliveredDate` datetime 
)*/;

/*Table structure for table `vw_getpurchaseorders` */

DROP TABLE IF EXISTS `vw_getpurchaseorders`;

/*!50001 DROP VIEW IF EXISTS `vw_getpurchaseorders` */;
/*!50001 DROP TABLE IF EXISTS `vw_getpurchaseorders` */;

/*!50001 CREATE TABLE  `vw_getpurchaseorders`(
 `ViewItems` varchar(74) ,
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `SupplierName` varchar(50) ,
 `NoOfItems` bigint(21) ,
 `TotalDPOCost` varchar(63) ,
 `Date` datetime ,
 `Status` varchar(9) ,
 `Action` varchar(39) 
)*/;

/*Table structure for table `vw_getrequestlistbysupplyrequestno` */

DROP TABLE IF EXISTS `vw_getrequestlistbysupplyrequestno`;

/*!50001 DROP VIEW IF EXISTS `vw_getrequestlistbysupplyrequestno` */;
/*!50001 DROP TABLE IF EXISTS `vw_getrequestlistbysupplyrequestno` */;

/*!50001 CREATE TABLE  `vw_getrequestlistbysupplyrequestno`(
 `ItemNo` varchar(22) ,
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `ItemDescription` mediumtext ,
 `ImageFile` text ,
 `DPOCost` varchar(62) ,
 `RequestsQty` int(11) ,
 `SubTotal` varchar(46) ,
 `SupplierName` varchar(50) 
)*/;

/*Table structure for table `vw_getrequeststatustotal` */

DROP TABLE IF EXISTS `vw_getrequeststatustotal`;

/*!50001 DROP VIEW IF EXISTS `vw_getrequeststatustotal` */;
/*!50001 DROP TABLE IF EXISTS `vw_getrequeststatustotal` */;

/*!50001 CREATE TABLE  `vw_getrequeststatustotal`(
 `All` bigint(21) ,
 `New` bigint(21) ,
 `Shipped` bigint(21) ,
 `Cancel` bigint(21) ,
 `Process` bigint(21) ,
 `Incomplete` bigint(21) 
)*/;

/*Table structure for table `vw_getselectedorderdetails` */

DROP TABLE IF EXISTS `vw_getselectedorderdetails`;

/*!50001 DROP VIEW IF EXISTS `vw_getselectedorderdetails` */;
/*!50001 DROP TABLE IF EXISTS `vw_getselectedorderdetails` */;

/*!50001 CREATE TABLE  `vw_getselectedorderdetails`(
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `RequestListNo` int(11) ,
 `VariantNo` int(11) ,
 `ItemNo` varchar(22) ,
 `ItemDescription` mediumtext ,
 `ImageFile` text ,
 `Received` varchar(120) ,
 `Requested` bigint(12) ,
 `DPOCost` double ,
 `RequestsQty` int(11) ,
 `SubTotal` double ,
 `QtyReceived` bigint(11) ,
 `isPending` int(11) ,
 `IsDeliverPending` int(11) 
)*/;

/*Table structure for table `vw_getsupplyitemsbysupplier` */

DROP TABLE IF EXISTS `vw_getsupplyitemsbysupplier`;

/*!50001 DROP VIEW IF EXISTS `vw_getsupplyitemsbysupplier` */;
/*!50001 DROP TABLE IF EXISTS `vw_getsupplyitemsbysupplier` */;

/*!50001 CREATE TABLE  `vw_getsupplyitemsbysupplier`(
 `ItemNo` varchar(22) ,
 `ItemDescription` mediumtext ,
 `Category` varchar(156) ,
 `DPOCost` varchar(62) ,
 `SRP` varchar(62) ,
 `SupplierNo` int(11) 
)*/;

/*Table structure for table `vw_inventory` */

DROP TABLE IF EXISTS `vw_inventory`;

/*!50001 DROP VIEW IF EXISTS `vw_inventory` */;
/*!50001 DROP TABLE IF EXISTS `vw_inventory` */;

/*!50001 CREATE TABLE  `vw_inventory`(
 `ItemNo` varchar(22) ,
 `VariantNo` int(11) ,
 `ItemDescription` mediumtext ,
 `Category` varchar(156) ,
 `STOCKCOMMIT` decimal(33,0) ,
 `STOCKS` bigint(11) ,
 `COMMIT` decimal(32,0) ,
 `Action` mediumtext 
)*/;

/*Table structure for table `vw_items` */

DROP TABLE IF EXISTS `vw_items`;

/*!50001 DROP VIEW IF EXISTS `vw_items` */;
/*!50001 DROP TABLE IF EXISTS `vw_items` */;

/*!50001 CREATE TABLE  `vw_items`(
 `ItemNo` int(4) unsigned zerofill ,
 `Name` varchar(50) ,
 `UOM` varchar(20) ,
 `NoOfItems` bigint(21) ,
 `Name1` varchar(50) ,
 `Name2` varchar(50) ,
 `Name3` varchar(50) ,
 `ViewItems` varchar(68) ,
 `Action` varchar(201) ,
 `Removed` tinyint(1) ,
 `SRemoved` tinyint(4) ,
 `Owned` tinyint(4) ,
 `Level1No` int(11) ,
 `Level2No` int(11) ,
 `Level3No` int(11) ,
 `ItemFor` varchar(8) 
)*/;

/*Table structure for table `vw_itemsforsale` */

DROP TABLE IF EXISTS `vw_itemsforsale`;

/*!50001 DROP VIEW IF EXISTS `vw_itemsforsale` */;
/*!50001 DROP TABLE IF EXISTS `vw_itemsforsale` */;

/*!50001 CREATE TABLE  `vw_itemsforsale`(
 `ItemNumber` varchar(22) ,
 `Name` varchar(50) ,
 `VariantName` text ,
 `Stocks` bigint(11) ,
 `Price` double ,
 `UOM` varchar(20) ,
 `ImageFile` text ,
 `Name1` varchar(50) ,
 `Name2` varchar(50) ,
 `Name3` varchar(50) ,
 `Category` varchar(156) ,
 `Level1No` int(11) ,
 `Level2No` int(11) ,
 `Level3No` int(11) ,
 `ItemNo` int(4) unsigned zerofill ,
 `ItemFor` int(11) ,
 `ItemNoV` int(4) unsigned zerofill ,
 `VariantNameJSON` text 
)*/;

/*Table structure for table `vw_itemvariant_limit1` */

DROP TABLE IF EXISTS `vw_itemvariant_limit1`;

/*!50001 DROP VIEW IF EXISTS `vw_itemvariant_limit1` */;
/*!50001 DROP TABLE IF EXISTS `vw_itemvariant_limit1` */;

/*!50001 CREATE TABLE  `vw_itemvariant_limit1`(
 `VariantNo` int(11) ,
 `ItemNo` int(4) unsigned zerofill ,
 `VariantName` text ,
 `VariantNameJSON` text ,
 `Size` varchar(75) ,
 `Color` varchar(50) ,
 `Description` varchar(75) ,
 `Stocks` int(11) ,
 `LowStock` int(11) ,
 `Critical` int(11) ,
 `DPOCost` double ,
 `SRP` double ,
 `Price` double ,
 `Removed` tinyint(4) ,
 `Owned` tinyint(4) ,
 `SupplierNo` int(11) ,
 `SRemoved` tinyint(4) ,
 `ImageFile` text 
)*/;

/*Table structure for table `vw_lowstocks` */

DROP TABLE IF EXISTS `vw_lowstocks`;

/*!50001 DROP VIEW IF EXISTS `vw_lowstocks` */;
/*!50001 DROP TABLE IF EXISTS `vw_lowstocks` */;

/*!50001 CREATE TABLE  `vw_lowstocks`(
 `ItemNo` varchar(22) ,
 `ItemDescription` mediumtext ,
 `SupplierName` varchar(50) ,
 `STOCKS` bigint(11) ,
 `LOWSTOCKS` bigint(11) ,
 `CRITICAL` bigint(11) 
)*/;

/*Table structure for table `vw_orderlistbyorderno` */

DROP TABLE IF EXISTS `vw_orderlistbyorderno`;

/*!50001 DROP VIEW IF EXISTS `vw_orderlistbyorderno` */;
/*!50001 DROP TABLE IF EXISTS `vw_orderlistbyorderno` */;

/*!50001 CREATE TABLE  `vw_orderlistbyorderno`(
 `OrderNo` int(8) unsigned zerofill ,
 `ItemNumber` varchar(22) ,
 `ItemDescription` mediumtext ,
 `ItemDescription2` mediumtext ,
 `Quantity` int(11) ,
 `Price` double ,
 `Total` double ,
 `ImageFile` text ,
 `Name` varchar(50) ,
 `VariantName` text ,
 `UOM` varchar(20) 
)*/;

/*Table structure for table `vw_pendingorders` */

DROP TABLE IF EXISTS `vw_pendingorders`;

/*!50001 DROP VIEW IF EXISTS `vw_pendingorders` */;
/*!50001 DROP TABLE IF EXISTS `vw_pendingorders` */;

/*!50001 CREATE TABLE  `vw_pendingorders`(
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `NoOfItems` bigint(21) ,
 `TotalDPOCost` varchar(63) ,
 `OrderDate` datetime ,
 `DPOCost` double ,
 `Quantity` int(11) ,
 `CustomerName` varchar(25) ,
 `DeliveredStatus` varchar(10) ,
 `DeliveredDate` datetime ,
 `ViewItems` varchar(74) ,
 `SupplierNo` int(11) ,
 `Action` varchar(80) 
)*/;

/*Table structure for table `vw_printsallitems` */

DROP TABLE IF EXISTS `vw_printsallitems`;

/*!50001 DROP VIEW IF EXISTS `vw_printsallitems` */;
/*!50001 DROP TABLE IF EXISTS `vw_printsallitems` */;

/*!50001 CREATE TABLE  `vw_printsallitems`(
 `ItemNo` varchar(22) ,
 `Name` varchar(50) ,
 `VariantName` text ,
 `UOM` varchar(20) ,
 `Stocks` bigint(11) ,
 `FamilyName` varchar(50) ,
 `Category` varchar(50) ,
 `SubCategory` varchar(50) 
)*/;

/*Table structure for table `vw_receivings` */

DROP TABLE IF EXISTS `vw_receivings`;

/*!50001 DROP VIEW IF EXISTS `vw_receivings` */;
/*!50001 DROP TABLE IF EXISTS `vw_receivings` */;

/*!50001 CREATE TABLE  `vw_receivings`(
 `SupplyNo` int(11) ,
 `DateReceive` datetime ,
 `SupplierName` varchar(50) ,
 `ItemDescription` mediumtext ,
 `QuantityReceived` int(11) ,
 `PendingQuantity` int(11) ,
 `Quantity` int(11) 
)*/;

/*Table structure for table `vw_requestlistfromadmin` */

DROP TABLE IF EXISTS `vw_requestlistfromadmin`;

/*!50001 DROP VIEW IF EXISTS `vw_requestlistfromadmin` */;
/*!50001 DROP TABLE IF EXISTS `vw_requestlistfromadmin` */;

/*!50001 CREATE TABLE  `vw_requestlistfromadmin`(
 `SupplyRequestNo` int(11) unsigned zerofill ,
 `NoOfItems` bigint(21) ,
 `TotalDPOCost` varchar(63) ,
 `OrderDate` datetime ,
 `DPOCost` double ,
 `Quantity` int(11) ,
 `CustomerName` varchar(25) ,
 `DeliveredStatus` varchar(10) ,
 `DeliveredDate` datetime ,
 `ViewItems` varchar(74) ,
 `SupplierNo` int(11) ,
 `Action` varchar(69) 
)*/;

/*Table structure for table `vw_sumquantityforinventory` */

DROP TABLE IF EXISTS `vw_sumquantityforinventory`;

/*!50001 DROP VIEW IF EXISTS `vw_sumquantityforinventory` */;
/*!50001 DROP TABLE IF EXISTS `vw_sumquantityforinventory` */;

/*!50001 CREATE TABLE  `vw_sumquantityforinventory`(
 `VariantNo` int(11) ,
 `COMMIT` decimal(32,0) 
)*/;

/*View structure for view vw_allorders */

/*!50001 DROP TABLE IF EXISTS `vw_allorders` */;
/*!50001 DROP VIEW IF EXISTS `vw_allorders` */;

/*!50001 CREATE  VIEW `vw_allorders` AS (select 'View items <span class="glyphicon glyphicon-menu-right pull-right"></span>' AS `ViewItems`,`o`.`CustomerNo` AS `CustomerNo`,`o`.`OrderNo` AS `OrderNo`,count(`od`.`OrderNo`) AS `NoOfItems`,concat(`c`.`Firstname`,' ',`c`.`Lastname`) AS `CustomerName`,`c`.`HomeAddress` AS `Address`,`c`.`ShipAddress` AS `ShipAddress`,`o`.`Date` AS `OrderDate`,format(`o`.`TotalAmount`,2) AS `TotalAmount`,`o`.`Status` AS `Status`,(case when (`o`.`Status` = 'New') then concat('<div class="btn-group" align="center"><button class="btn btn-default" onclick="cancelOrder(\'',`o`.`OrderNo`,'\');">Cancel</button><button class="btn btn-action" onclick="processOrder(\'',`o`.`OrderNo`,'\');">Process</button></div>') when (`o`.`Status` = 'Process') then concat('<button class="btn btn-action" onclick="shipOrder(\'',`o`.`OrderNo`,'\');">Ship</button>') else '' end) AS `Action` from ((`tblorder` `o` join `customer` `c` on((`o`.`CustomerNo` = `c`.`CustomerNo`))) join `tblorderdetails` `od` on((`o`.`OrderNo` = `od`.`OrderNo`))) group by `od`.`OrderNo`) */;

/*View structure for view vw_getbackorders */

/*!50001 DROP TABLE IF EXISTS `vw_getbackorders` */;
/*!50001 DROP VIEW IF EXISTS `vw_getbackorders` */;

/*!50001 CREATE  VIEW `vw_getbackorders` AS (select `rl`.`RequestListNo` AS `RequestListNo`,`s`.`SupplierName` AS `SupplierName`,`s`.`SupplierNo` AS `SupplierNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`rl`.`Received` AS `Received`,`sup`.`PendingQuantity` AS `PendingQuantity`,`sup`.`DateReceive` AS `DateReceive` from (((((`supplyrequest` `sr` join `supply` `sup` on((`sr`.`SupplyRequestNo` = `sup`.`SupplyRequestNo`))) join `requestlist` `rl` on(((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`) and (`sup`.`RequestListNo` = `rl`.`RequestListNo`)))) join `item` `i` on((`rl`.`ItemNo` = `i`.`ItemNo`))) join `itemvariant` `iv` on(((`rl`.`VariantNo` = `iv`.`VariantNo`) and (`i`.`ItemNo` = `iv`.`ItemNo`)))) join `supplier` `s` on((`sr`.`SupplierNo` = `s`.`SupplierNo`))) where (`sup`.`PendingQuantity` > 0)) */;

/*View structure for view vw_getcategories */

/*!50001 DROP TABLE IF EXISTS `vw_getcategories` */;
/*!50001 DROP VIEW IF EXISTS `vw_getcategories` */;

/*!50001 CREATE  VIEW `vw_getcategories` AS (select `l1`.`Level1No` AS `Level1No`,`l1`.`Name1` AS `Family`,`l1`.`ImageFile` AS `ImageFile`,`l2`.`Level2No` AS `Level2No`,(case when isnull(`l2`.`Name2`) then '<span class="tr-action pull-right"><a>Add</a></span>' else concat('<p class="td-name">',`l2`.`Name2`,'</p><span class="tr-action pull-right"><a class="td-edit">Edit</a> | <a class="td-delete">Delete</a></span>') end) AS `Category`,`l3`.`Level3No` AS `Level3No`,(case when isnull(`l3`.`Name3`) then '<span class="tr-action pull-right"><a>Add</a></span>' else concat('<p class="td-name">',`l3`.`Name3`,'</p><span class="tr-action pull-right"><a class="td-edit">Edit</a> | <a class="td-delete">Delete</a></span>') end) AS `SubCategory` from ((`level1` `l1` left join `level2` `l2` on((`l1`.`Level1No` = `l2`.`Level1No`))) left join `level3` `l3` on(((`l1`.`Level1No` = `l3`.`Level1No`) and (`l2`.`Level2No` = `l3`.`Level2No`)))) order by `l1`.`Name1`,`l2`.`Name2`,`l3`.`Name3`) */;

/*View structure for view vw_getlowstockbysupplier */

/*!50001 DROP TABLE IF EXISTS `vw_getlowstockbysupplier` */;
/*!50001 DROP VIEW IF EXISTS `vw_getlowstockbysupplier` */;

/*!50001 CREATE  VIEW `vw_getlowstockbysupplier` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,ifnull(`iv`.`Stocks`,0) AS `STOCKS`,ifnull(`iv`.`LowStock`,0) AS `LOWSTOCKS`,ifnull(`iv`.`Critical`,0) AS `CRITICAL`,`iv`.`SupplierNo` AS `SupplierNo` from (`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) where ((`iv`.`Stocks` <= `iv`.`LowStock`) and (`iv`.`Owned` = 1))) */;

/*View structure for view vw_getmostcustomer */

/*!50001 DROP TABLE IF EXISTS `vw_getmostcustomer` */;
/*!50001 DROP VIEW IF EXISTS `vw_getmostcustomer` */;

/*!50001 CREATE  VIEW `vw_getmostcustomer` AS (select concat(`c`.`Firstname`,' ',`c`.`Lastname`) AS `CustomerName`,count(`o`.`CustomerNo`) AS `Total`,0 AS `Percentage` from (`customer` `c` join `tblorder` `o` on((`c`.`CustomerNo` = `o`.`CustomerNo`))) group by `o`.`CustomerNo` limit 5) */;

/*View structure for view vw_getmostordereditems */

/*!50001 DROP TABLE IF EXISTS `vw_getmostordereditems` */;
/*!50001 DROP VIEW IF EXISTS `vw_getmostordereditems` */;

/*!50001 CREATE  VIEW `vw_getmostordereditems` AS (select `i`.`Name` AS `Name`,sum(`ol`.`Quantity`) AS `Total`,0 AS `Percentage` from ((`orderlist` `ol` join `tblorder` `o` on(((`ol`.`OrderNo` = `o`.`OrderNo`) and (`o`.`Status` = 'Ship')))) join `item` `i` on((`ol`.`ItemNo` = `i`.`ItemNo`))) group by `i`.`Name` order by sum(`ol`.`Quantity`) desc limit 5) */;

/*View structure for view vw_getorderbysupplier */

/*!50001 DROP TABLE IF EXISTS `vw_getorderbysupplier` */;
/*!50001 DROP VIEW IF EXISTS `vw_getorderbysupplier` */;

/*!50001 CREATE  VIEW `vw_getorderbysupplier` AS (select concat('<button class="btn btn-success" onclick=\'addtoPo("',`i`.`ItemNo`,'","',`iv`.`VariantNo`,'");\'><span class="glyphicon glyphicon-plus"></span></button>') AS `Action`,concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `Description`,`iv`.`DPOCost` AS `DPOCost`,`i`.`SupplierNo` AS `SupplierNo` from (`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`)))) */;

/*View structure for view vw_getpendingitemsbysupplyrequestno */

/*!50001 DROP TABLE IF EXISTS `vw_getpendingitemsbysupplyrequestno` */;
/*!50001 DROP VIEW IF EXISTS `vw_getpendingitemsbysupplyrequestno` */;

/*!50001 CREATE  VIEW `vw_getpendingitemsbysupplyrequestno` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,`rl`.`SupplyRequestNo` AS `SupplyRequestNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`iv`.`ImageFile` AS `ImageFile`,format(`iv`.`DPOCost`,2) AS `DPOCost`,`rl`.`Quantity` AS `RequestsQty`,`rl`.`Received` AS `Received`,format(cast((`iv`.`DPOCost` * `rl`.`Quantity`) as double(10,2)),2) AS `SubTotal`,`s`.`SupplierName` AS `SupplierName` from (((`requestlist` `rl` join `item` `i` on((`rl`.`ItemNo` = `i`.`ItemNo`))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) join `supplier` `s` on((`i`.`SupplierNo` = `s`.`SupplierNo`)))) */;

/*View structure for view vw_getposubmit */

/*!50001 DROP TABLE IF EXISTS `vw_getposubmit` */;
/*!50001 DROP VIEW IF EXISTS `vw_getposubmit` */;

/*!50001 CREATE  VIEW `vw_getposubmit` AS (select concat('<a onclick="removePO(\'',`rl`.`RequestListNo`,'\',this);"><span class="glyphicon glyphicon-remove"></span></a>') AS `Remove`,concat('<input type="text" value="',ifnull(`rl`.`Quantity`,1),'" class="form-control poquantity" onblur="updatePOQty(\'',`rl`.`RequestListNo`,'\',this);"/>') AS `ItemQty`,concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `Item`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,format(`iv`.`DPOCost`,2) AS `DPOCost`,format(ifnull(`rl`.`Total`,`iv`.`DPOCost`),2) AS `Total`,`rl`.`createdby` AS `createdby`,`i`.`SupplierNo` AS `SupplierNo`,`rl`.`RequestListNo` AS `RequestListNo` from ((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `requestlist` `rl` on(((`i`.`ItemNo` = `rl`.`ItemNo`) and (`iv`.`VariantNo` = `rl`.`VariantNo`)))) where (`rl`.`Temp` = 1)) */;

/*View structure for view vw_getpotoreceive */

/*!50001 DROP TABLE IF EXISTS `vw_getpotoreceive` */;
/*!50001 DROP VIEW IF EXISTS `vw_getpotoreceive` */;

/*!50001 CREATE  VIEW `vw_getpotoreceive` AS (select `sr`.`SupplyRequestNo` AS `SupplyRequestNo`,count(`rl`.`SupplyRequestNo`) AS `NoOfItems`,`s`.`SupplierName` AS `SupplierName`,`sr`.`Date` AS `Date`,`sr`.`DeliveredDate` AS `DeliveredDate` from ((`supplyrequest` `sr` join `supplier` `s` on((`sr`.`SupplierNo` = `s`.`SupplierNo`))) join `requestlist` `rl` on(((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`) and (`rl`.`Quantity` is not null)))) where (((`sr`.`isReceived` = 0) and (`sr`.`DeliveredStatus` = 1)) or (`sr`.`IsDeliverPending` <> 0)) group by `rl`.`SupplyRequestNo` order by `sr`.`Date` desc) */;

/*View structure for view vw_getpurchaseorders */

/*!50001 DROP TABLE IF EXISTS `vw_getpurchaseorders` */;
/*!50001 DROP VIEW IF EXISTS `vw_getpurchaseorders` */;

/*!50001 CREATE  VIEW `vw_getpurchaseorders` AS (select 'View items <span class="glyphicon glyphicon-menu-right pull-right"></span>' AS `ViewItems`,`sr`.`SupplyRequestNo` AS `SupplyRequestNo`,`s`.`SupplierName` AS `SupplierName`,count(`rl`.`SupplyRequestNo`) AS `NoOfItems`,format(sum((`rl`.`Quantity` * `iv`.`DPOCost`)),2) AS `TotalDPOCost`,`sr`.`Date` AS `Date`,(case when (`sr`.`isReceived` = 1) then 'Received' when (`sr`.`DeliveredStatus` = 1) then 'Delivered' else 'Pending' end) AS `Status`,concat('<span><a>View</a> | <a>Print</a></span>') AS `Action` from (((`supplyrequest` `sr` join `requestlist` `rl` on(((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`) and (`rl`.`Quantity` is not null)))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) join `supplier` `s` on((`sr`.`SupplierNo` = `s`.`SupplierNo`))) group by `rl`.`SupplyRequestNo` order by `sr`.`Date` desc) */;

/*View structure for view vw_getrequestlistbysupplyrequestno */

/*!50001 DROP TABLE IF EXISTS `vw_getrequestlistbysupplyrequestno` */;
/*!50001 DROP VIEW IF EXISTS `vw_getrequestlistbysupplyrequestno` */;

/*!50001 CREATE  VIEW `vw_getrequestlistbysupplyrequestno` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,`rl`.`SupplyRequestNo` AS `SupplyRequestNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`iv`.`ImageFile` AS `ImageFile`,format(`iv`.`DPOCost`,2) AS `DPOCost`,`rl`.`Quantity` AS `RequestsQty`,format(cast((`iv`.`DPOCost` * `rl`.`Quantity`) as double(10,2)),2) AS `SubTotal`,`s`.`SupplierName` AS `SupplierName` from (((`requestlist` `rl` join `item` `i` on((`rl`.`ItemNo` = `i`.`ItemNo`))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) join `supplier` `s` on((`i`.`SupplierNo` = `s`.`SupplierNo`)))) */;

/*View structure for view vw_getrequeststatustotal */

/*!50001 DROP TABLE IF EXISTS `vw_getrequeststatustotal` */;
/*!50001 DROP VIEW IF EXISTS `vw_getrequeststatustotal` */;

/*!50001 CREATE  VIEW `vw_getrequeststatustotal` AS (select count(`o`.`Status`) AS `All`,count(`n`.`Status`) AS `New`,count(`s`.`Status`) AS `Shipped`,count(`c`.`Status`) AS `Cancel`,count(`p`.`Status`) AS `Process`,count(`i`.`Status`) AS `Incomplete` from (((((`tblorder` `o` left join `tblorder` `n` on(((`o`.`OrderNo` = `n`.`OrderNo`) and (`n`.`Status` = 'New')))) left join `tblorder` `s` on(((`o`.`OrderNo` = `s`.`OrderNo`) and (`s`.`Status` = 'Ship')))) left join `tblorder` `c` on(((`o`.`OrderNo` = `c`.`OrderNo`) and (`c`.`Status` = 'Cancel')))) left join `tblorder` `p` on(((`o`.`OrderNo` = `p`.`OrderNo`) and (`p`.`Status` = 'Process')))) left join `tblorder` `i` on(((`o`.`OrderNo` = `i`.`OrderNo`) and (`i`.`Status` = 'Incomplete'))))) */;

/*View structure for view vw_getselectedorderdetails */

/*!50001 DROP TABLE IF EXISTS `vw_getselectedorderdetails` */;
/*!50001 DROP VIEW IF EXISTS `vw_getselectedorderdetails` */;

/*!50001 CREATE  VIEW `vw_getselectedorderdetails` AS (select `sr`.`SupplyRequestNo` AS `SupplyRequestNo`,`rl`.`RequestListNo` AS `RequestListNo`,`iv`.`VariantNo` AS `VariantNo`,concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`iv`.`ImageFile` AS `ImageFile`,concat('<input type="text" value="',(case when (`rl`.`isPending` = 1) then (`rl`.`Quantity` - `rl`.`Received`) else ifnull(`rl`.`Quantity`,0) end),'" class="form-control poreceived" onblur="updatePOReceived(\'',`rl`.`RequestListNo`,'\',this);"/>') AS `Received`,(case when (`rl`.`isPending` = 1) then (`rl`.`Quantity` - `rl`.`Received`) else ifnull(`rl`.`Quantity`,0) end) AS `Requested`,`iv`.`DPOCost` AS `DPOCost`,`rl`.`Quantity` AS `RequestsQty`,(`iv`.`DPOCost` * `rl`.`Quantity`) AS `SubTotal`,ifnull(`rl`.`Received`,0) AS `QtyReceived`,`rl`.`isPending` AS `isPending`,`sr`.`IsDeliverPending` AS `IsDeliverPending` from (((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `requestlist` `rl` on(((`i`.`ItemNo` = `rl`.`ItemNo`) and (`rl`.`VariantNo` = `iv`.`VariantNo`)))) join `supplyrequest` `sr` on((`rl`.`SupplyRequestNo` = `sr`.`SupplyRequestNo`)))) */;

/*View structure for view vw_getsupplyitemsbysupplier */

/*!50001 DROP TABLE IF EXISTS `vw_getsupplyitemsbysupplier` */;
/*!50001 DROP VIEW IF EXISTS `vw_getsupplyitemsbysupplier` */;

/*!50001 CREATE  VIEW `vw_getsupplyitemsbysupplier` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,concat(`l1`.`Name1`,' > ',`l2`.`Name2`,' > ',`l3`.`Name3`) AS `Category`,format(`iv`.`DPOCost`,2) AS `DPOCost`,format(`iv`.`SRP`,2) AS `SRP`,`i`.`SupplierNo` AS `SupplierNo` from ((((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `level1` `l1` on((`i`.`Level1No` = `l1`.`Level1No`))) join `level2` `l2` on((`i`.`Level2No` = `l2`.`Level2No`))) join `level3` `l3` on((`i`.`Level3No` = `l3`.`Level3No`)))) */;

/*View structure for view vw_inventory */

/*!50001 DROP TABLE IF EXISTS `vw_inventory` */;
/*!50001 DROP VIEW IF EXISTS `vw_inventory` */;

/*!50001 CREATE  VIEW `vw_inventory` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,`iv`.`VariantNo` AS `VariantNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,concat(`l1`.`Name1`,ifnull(concat(' > ',`l2`.`Name2`),''),ifnull(concat(' > ',`l3`.`Name3`),'')) AS `Category`,(ifnull(`iv`.`Stocks`,0) - ifnull(`siv`.`COMMIT`,0)) AS `STOCKCOMMIT`,ifnull(`iv`.`Stocks`,0) AS `STOCKS`,ifnull(`siv`.`COMMIT`,0) AS `COMMIT`,concat('<button class=\'btn btn-action\' onclick="physicalCount(\'',`iv`.`VariantNo`,'\', \'',concat(`i`.`Name`,'<br/>',`iv`.`VariantName`),'\');"><span class=\'glyphicon glyphicon-plus\'></span> Physical Count</button>') AS `Action` from (((((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `level1` `l1` on((`i`.`Level1No` = `l1`.`Level1No`))) left join `level2` `l2` on((`i`.`Level2No` = `l2`.`Level2No`))) left join `level3` `l3` on((`i`.`Level3No` = `l3`.`Level3No`))) left join `vw_sumquantityforinventory` `siv` on((`iv`.`VariantNo` = `siv`.`VariantNo`))) where (`iv`.`Owned` = 1)) */;

/*View structure for view vw_items */

/*!50001 DROP TABLE IF EXISTS `vw_items` */;
/*!50001 DROP VIEW IF EXISTS `vw_items` */;

/*!50001 CREATE  VIEW `vw_items` AS (select `i`.`ItemNo` AS `ItemNo`,`i`.`Name` AS `Name`,`i`.`UOM` AS `UOM`,count(`iv`.`ItemNo`) AS `NoOfItems`,`l1`.`Name1` AS `Name1`,`l2`.`Name2` AS `Name2`,`l3`.`Name3` AS `Name3`,'View <span class="glyphicon glyphicon-menu-right pull-right"></span>' AS `ViewItems`,(case when ((`i`.`Removed` = 1) or (`i`.`SRemoved` <> 0)) then concat('<button class="btn btn-action" onclick="removeOrRecoverItem(\'',`i`.`ItemNo`,'\',\'',`i`.`Name`,'\',this,0);"><span class="glyphicon glyphicon-export"></span> Recover</button>') else concat('<button class="btn btn-action" onclick="removeOrRecoverItem(\'',`i`.`ItemNo`,'\',\'',`i`.`Name`,'\',this,1);"><span class="glyphicon glyphicon-trash"></span> Delete</button>') end) AS `Action`,`i`.`Removed` AS `Removed`,`i`.`SRemoved` AS `SRemoved`,`iv`.`Owned` AS `Owned`,`l1`.`Level1No` AS `Level1No`,`l2`.`Level2No` AS `Level2No`,`l3`.`Level3No` AS `Level3No`,(case when (`i`.`ItemFor` = 0) then 'All' when (`i`.`ItemFor` = 1) then 'Customer' when (`i`.`ItemFor` = 2) then 'Supplier' end) AS `ItemFor` from ((((`item` `i` left join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `level1` `l1` on((`i`.`Level1No` = `l1`.`Level1No`))) left join `level2` `l2` on((`i`.`Level2No` = `l2`.`Level2No`))) left join `level3` `l3` on((`i`.`Level3No` = `l3`.`Level3No`))) group by `iv`.`ItemNo`) */;

/*View structure for view vw_itemsforsale */

/*!50001 DROP TABLE IF EXISTS `vw_itemsforsale` */;
/*!50001 DROP VIEW IF EXISTS `vw_itemsforsale` */;

/*!50001 CREATE  VIEW `vw_itemsforsale` AS (select concat(`iv`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNumber`,`i`.`Name` AS `Name`,`iv`.`VariantName` AS `VariantName`,ifnull(`iv`.`Stocks`,0) AS `Stocks`,`iv`.`Price` AS `Price`,`i`.`UOM` AS `UOM`,`iv`.`ImageFile` AS `ImageFile`,`l1`.`Name1` AS `Name1`,`l2`.`Name2` AS `Name2`,`l3`.`Name3` AS `Name3`,concat(`l1`.`Name1`,ifnull(concat(' / ',`l2`.`Name2`),''),ifnull(concat(' / ',`l3`.`Name3`),'')) AS `Category`,`l1`.`Level1No` AS `Level1No`,`l2`.`Level2No` AS `Level2No`,`l3`.`Level3No` AS `Level3No`,`i`.`ItemNo` AS `ItemNo`,`i`.`ItemFor` AS `ItemFor`,`iv`.`ItemNo` AS `ItemNoV`,`iv`.`VariantNameJSON` AS `VariantNameJSON` from ((((`itemvariant` `iv` join `item` `i` on((`iv`.`ItemNo` = `i`.`ItemNo`))) join `level1` `l1` on((`i`.`Level1No` = `l1`.`Level1No`))) left join `level2` `l2` on((`i`.`Level2No` = `l2`.`Level2No`))) left join `level3` `l3` on((`i`.`Level3No` = `l3`.`Level3No`))) where ((`iv`.`Owned` = 1) and (`i`.`Owned` = 1) and (`iv`.`Price` is not null) and ((`i`.`SRemoved` = 0) or isnull(`i`.`SRemoved`)) and ((`iv`.`Removed` = 0) or isnull(`iv`.`Removed`)))) */;

/*View structure for view vw_itemvariant_limit1 */

/*!50001 DROP TABLE IF EXISTS `vw_itemvariant_limit1` */;
/*!50001 DROP VIEW IF EXISTS `vw_itemvariant_limit1` */;

/*!50001 CREATE  VIEW `vw_itemvariant_limit1` AS (select `itemvariant`.`VariantNo` AS `VariantNo`,`itemvariant`.`ItemNo` AS `ItemNo`,`itemvariant`.`VariantName` AS `VariantName`,`itemvariant`.`VariantNameJSON` AS `VariantNameJSON`,`itemvariant`.`Size` AS `Size`,`itemvariant`.`Color` AS `Color`,`itemvariant`.`Description` AS `Description`,`itemvariant`.`Stocks` AS `Stocks`,`itemvariant`.`LowStock` AS `LowStock`,`itemvariant`.`Critical` AS `Critical`,`itemvariant`.`DPOCost` AS `DPOCost`,`itemvariant`.`SRP` AS `SRP`,`itemvariant`.`Price` AS `Price`,`itemvariant`.`Removed` AS `Removed`,`itemvariant`.`Owned` AS `Owned`,`itemvariant`.`SupplierNo` AS `SupplierNo`,`itemvariant`.`SRemoved` AS `SRemoved`,`itemvariant`.`ImageFile` AS `ImageFile` from `itemvariant` limit 1) */;

/*View structure for view vw_lowstocks */

/*!50001 DROP TABLE IF EXISTS `vw_lowstocks` */;
/*!50001 DROP VIEW IF EXISTS `vw_lowstocks` */;

/*!50001 CREATE  VIEW `vw_lowstocks` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`s`.`SupplierName` AS `SupplierName`,ifnull(`iv`.`Stocks`,0) AS `STOCKS`,ifnull(`iv`.`LowStock`,0) AS `LOWSTOCKS`,ifnull(`iv`.`Critical`,0) AS `CRITICAL` from (((((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `level1` `l1` on((`i`.`Level1No` = `l1`.`Level1No`))) join `level2` `l2` on((`i`.`Level2No` = `l2`.`Level2No`))) join `level3` `l3` on((`i`.`Level3No` = `l3`.`Level3No`))) join `supplier` `s` on((`i`.`SupplierNo` = `s`.`SupplierNo`))) where (((`iv`.`Owned` = 1) and (`iv`.`Stocks` is not null) and (`iv`.`Stocks` <= `iv`.`Critical`)) or ((`iv`.`Stocks` <= `iv`.`LowStock`) and (`iv`.`Stocks` > `iv`.`Critical`)))) */;

/*View structure for view vw_orderlistbyorderno */

/*!50001 DROP TABLE IF EXISTS `vw_orderlistbyorderno` */;
/*!50001 DROP VIEW IF EXISTS `vw_orderlistbyorderno` */;

/*!50001 CREATE  VIEW `vw_orderlistbyorderno` AS (select `o`.`OrderNo` AS `OrderNo`,concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNumber`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,concat(`i`.`Name`,'\n',replace(`iv`.`VariantName`,'<br/>','\n')) AS `ItemDescription2`,`o`.`Quantity` AS `Quantity`,`iv`.`Price` AS `Price`,(`o`.`Quantity` * `iv`.`Price`) AS `Total`,`iv`.`ImageFile` AS `ImageFile`,`i`.`Name` AS `Name`,`iv`.`VariantName` AS `VariantName`,`i`.`UOM` AS `UOM` from ((`tblorderdetails` `o` join `itemvariant` `iv` on((`o`.`ItemVariantNo` = convert(concat(`iv`.`ItemNo`,'-',`iv`.`VariantNo`) using latin1)))) join `item` `i` on((`iv`.`ItemNo` = `i`.`ItemNo`)))) */;

/*View structure for view vw_pendingorders */

/*!50001 DROP TABLE IF EXISTS `vw_pendingorders` */;
/*!50001 DROP VIEW IF EXISTS `vw_pendingorders` */;

/*!50001 CREATE  VIEW `vw_pendingorders` AS (select `sr`.`SupplyRequestNo` AS `SupplyRequestNo`,count(`rl`.`SupplyRequestNo`) AS `NoOfItems`,format(sum((`rl`.`Quantity` * `iv`.`DPOCost`)),2) AS `TotalDPOCost`,`sr`.`Date` AS `OrderDate`,`iv`.`DPOCost` AS `DPOCost`,`rl`.`Quantity` AS `Quantity`,'Lampano Hardware Tradings' AS `CustomerName`,`sr`.`DeliveredStatus` AS `DeliveredStatus`,`sr`.`DeliveredDate` AS `DeliveredDate`,'View items <span class="glyphicon glyphicon-menu-right pull-right"></span>' AS `ViewItems`,`sr`.`SupplierNo` AS `SupplierNo`,(case when (`sr`.`IsDeliverPending` = 1) then 'Delivered' else '<button class="btn btn-action btn-deliverpending">Deliver Pending order</button>' end) AS `Action` from ((`supplyrequest` `sr` join `requestlist` `rl` on((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) where (`sr`.`isPendingItems` = 1) group by `rl`.`SupplyRequestNo`) */;

/*View structure for view vw_printsallitems */

/*!50001 DROP TABLE IF EXISTS `vw_printsallitems` */;
/*!50001 DROP VIEW IF EXISTS `vw_printsallitems` */;

/*!50001 CREATE  VIEW `vw_printsallitems` AS (select concat(`i`.`ItemNo`,'-',`iv`.`VariantNo`) AS `ItemNo`,`i`.`Name` AS `Name`,`iv`.`VariantName` AS `VariantName`,`i`.`UOM` AS `UOM`,ifnull(`iv`.`Stocks`,0) AS `Stocks`,`l1`.`Name1` AS `FamilyName`,ifnull(`l2`.`Name2`,'-') AS `Category`,ifnull(`l3`.`Name3`,'-') AS `SubCategory` from ((((`itemvariant` `iv` join `item` `i` on((`iv`.`ItemNo` = `i`.`ItemNo`))) join `level1` `l1` on((`l1`.`Level1No` = `i`.`Level1No`))) left join `level2` `l2` on((`l2`.`Level2No` = `i`.`Level2No`))) left join `level3` `l3` on((`l3`.`Level3No` = `i`.`Level3No`))) where ((`iv`.`Owned` = 1) and ((`iv`.`Removed` = 0) or isnull(`iv`.`Removed`)) and ((`i`.`Removed` = 0) or isnull(`i`.`Removed`)))) */;

/*View structure for view vw_receivings */

/*!50001 DROP TABLE IF EXISTS `vw_receivings` */;
/*!50001 DROP VIEW IF EXISTS `vw_receivings` */;

/*!50001 CREATE  VIEW `vw_receivings` AS (select `sup`.`SupplyNo` AS `SupplyNo`,`sup`.`DateReceive` AS `DateReceive`,`s`.`SupplierName` AS `SupplierName`,concat(`i`.`Name`,'<br/>',`iv`.`VariantName`) AS `ItemDescription`,`sup`.`QuantityReceived` AS `QuantityReceived`,`sup`.`PendingQuantity` AS `PendingQuantity`,`rl`.`Quantity` AS `Quantity` from (((((`supplyrequest` `sr` join `supply` `sup` on((`sr`.`SupplyRequestNo` = `sup`.`SupplyRequestNo`))) join `requestlist` `rl` on(((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`) and (`sup`.`RequestListNo` = `rl`.`RequestListNo`)))) join `item` `i` on((`rl`.`ItemNo` = `i`.`ItemNo`))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) join `supplier` `s` on((`sr`.`SupplierNo` = `s`.`SupplierNo`))) where (`sr`.`isReceived` = 1) order by `sup`.`DateReceive` desc) */;

/*View structure for view vw_requestlistfromadmin */

/*!50001 DROP TABLE IF EXISTS `vw_requestlistfromadmin` */;
/*!50001 DROP VIEW IF EXISTS `vw_requestlistfromadmin` */;

/*!50001 CREATE  VIEW `vw_requestlistfromadmin` AS (select `sr`.`SupplyRequestNo` AS `SupplyRequestNo`,count(`rl`.`SupplyRequestNo`) AS `NoOfItems`,format(sum((`rl`.`Quantity` * `iv`.`DPOCost`)),2) AS `TotalDPOCost`,`sr`.`Date` AS `OrderDate`,`iv`.`DPOCost` AS `DPOCost`,`rl`.`Quantity` AS `Quantity`,'Lampano Hardware Tradings' AS `CustomerName`,`sr`.`DeliveredStatus` AS `DeliveredStatus`,`sr`.`DeliveredDate` AS `DeliveredDate`,'View items <span class="glyphicon glyphicon-menu-right pull-right"></span>' AS `ViewItems`,`sr`.`SupplierNo` AS `SupplierNo`,(case when (`sr`.`DeliveredStatus` = 1) then 'Delivered' else '<button class="btn btn-action btn-deliver">Approve & Deliver</button>' end) AS `Action` from ((`supplyrequest` `sr` join `requestlist` `rl` on((`sr`.`SupplyRequestNo` = `rl`.`SupplyRequestNo`))) join `itemvariant` `iv` on((`rl`.`VariantNo` = `iv`.`VariantNo`))) where (`sr`.`isReceived` = 0) group by `rl`.`SupplyRequestNo`) */;

/*View structure for view vw_sumquantityforinventory */

/*!50001 DROP TABLE IF EXISTS `vw_sumquantityforinventory` */;
/*!50001 DROP VIEW IF EXISTS `vw_sumquantityforinventory` */;

/*!50001 CREATE  VIEW `vw_sumquantityforinventory` AS (select `iv`.`VariantNo` AS `VariantNo`,sum(`ol`.`Quantity`) AS `COMMIT` from (((`item` `i` join `itemvariant` `iv` on((`i`.`ItemNo` = `iv`.`ItemNo`))) join `tblorderdetails` `ol` on((convert(concat(`iv`.`ItemNo`,'-',`iv`.`VariantNo`) using latin1) = `ol`.`ItemVariantNo`))) join `tblorder` `o` on((`o`.`OrderNo` = `ol`.`OrderNo`))) where (((`iv`.`Removed` = 0) or isnull(`iv`.`Removed`)) and (`iv`.`Owned` = 1) and ((`o`.`Status` = 'Process') or (`o`.`Status` = 'Ship'))) group by `iv`.`VariantNo`) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
