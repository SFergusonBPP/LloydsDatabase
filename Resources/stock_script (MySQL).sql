drop schema if exists `stock`;

CREATE DATABASE `stock`;

USE `stock`;


/****** Object:  Table `stock`.`Customers`    Script Date: 04/26/2021 14:40:00 ******/
CREATE TABLE `stock`.`Customers`(
	`CustomerID` int NOT NULL,
	`Title` varchar(10) NULL,
	`Surname` varchar(50) NULL,
	`Forename` varchar(50) NULL,
	`Initials` varchar(5) NULL,
	`Address1` varchar(50) NULL,
	`Address2` varchar(50) NULL,
	`Address3` varchar(50) NULL,
	`PostCode` varchar(10) NULL,
	`Tel` varchar(15) NULL,
	`Email` varchar(90) NULL,
	`CreditLimit` decimal(10,2) NULL,
	CONSTRAINT `CUSTOMERS_PK` PRIMARY KEY (`CUSTOMERID`)
);


/****** Object:  Table `stock`.`Suppliers`    Script Date: 04/26/2021 14:40:00 ******/
CREATE TABLE `stock`.`Suppliers`(
	`SupplierID` int NOT NULL,
	`SupplierName` varchar(50) NULL,
	`SupplierTelNo` varchar(50) NULL,
	`SupplierEmail` text NULL,
     CONSTRAINT `Suppliers_PK` PRIMARY KEY (`SupplierID`)
);

/****** Object:  Table `stock`.`Products`    Script Date: 04/26/2021 14:40:00 ******/
CREATE TABLE `stock`.`Products`(
	`ProductNumber` char(8) NOT NULL,
	`ProductDescription` varchar(100) NOT NULL,
	`Category` varchar(50) NOT NULL,
	`Price` decimal(10,2) NOT NULL,
	`NumberInStock` int NOT NULL,
	`Re-OrderLevel` int NOT NULL,
	`Re-OrderQuantity` int NOT NULL,
	`SupplierNumber` int NOT NULL,
    CONSTRAINT `Products_PK` PRIMARY KEY (`ProductNumber`),
    CONSTRAINT `Products_FK1` FOREIGN KEY (`SupplierNumber`) REFERENCES `stock`.`Suppliers`(`SupplierID`)
);


/****** Object:  Table `stock`.`Orders`    Script Date: 04/26/2021 14:40:00 ******/
CREATE TABLE `stock`.`Orders`(
	`OrderNumber` int NOT NULL,
	`OrderDate` date NULL,
	`CustomerID` int NULL,
	CONSTRAINT `Orders_PK` PRIMARY KEY (`OrderNumber`),
    CONSTRAINT `Orders_FK1` FOREIGN KEY (`CustomerID`) REFERENCES `stock`.`Customers` (`CustomerID`) 
);

/****** Object:  Table `stock`.`OrderDetails`    Script Date: 04/26/2021 14:40:00 ******/
CREATE TABLE `stock`.`OrderDetails`(
	`OrderNumber` int NOT NULL,
	`ProductNumber` char(8) NOT NULL,
	`Quantity` int NULL,
    constraint `OrderDetails_PK` primary key (`OrderNumber`,`ProductNumber`),
	CONSTRAINT `OrderDetails_FK1` FOREIGN KEY (`OrderNumber`) REFERENCES `stock`.`Orders` (`OrderNumber`), 
	CONSTRAINT `OrderDetails_FK2` FOREIGN KEY (`ProductNumber`) REFERENCES `stock`.`Products` (`ProductNumber`)
) ;



INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (101, 'Mr', 'Raybould', 'James', 'J', 'Flat 1', '34 Jersey Close', 'Oldham', 'OL9 8YU', '635463212', 'james@hotnet.co.uk', 900.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (132, 'Mr', 'Allen', 'Tom', 'T', '8 Glebe Drive', '', 'Warwick', 'CV69 7FG', '407619993', 'tom@email.com', 3000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (176, 'Mr', 'Tomlinson', 'Jack', 'J', '9 Ironbridge Road', 'Redditch', 'Worcestershire', 'B97 2DE', '447278456', 'jack@jack.co.uk', 7000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (254, 'Mr', 'Barnaby', 'Ian', 'I', '75 Cathedral Close', 'Wolverhampton', 'West Midlands', 'WV4 6FQ', '291649554', 'ian@thismail.com', 5000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (266, 'Dr', 'Washbourne', 'George', 'G', '75 Caravan Road', 'Camberley', 'Surrey', 'GU2 6FR', '164066866', 'george@spamnet.com', 1000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (296, 'Mr', 'Prabhu', 'Suresh', 'S', '8 Pelham Street', 'Colchester', 'Essex', 'CO8 7KL', '933043899', 'prabhu@pradmail.com', 8000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (324, 'Mr', 'Hill', 'Henry', 'H', '47 Pinewoods Avenue', 'Harborne', 'Birmingham', 'B77 8RE', '936907567', 'henry675@freenet.com', 2000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (333, 'Mrs', 'Barlow', 'Leah', 'L', '46 Solent Road', 'Gornal Wood', 'West Midlands', 'B98 7FD', '340095746', 'leah978@ninnynet.com', 6000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (336, 'Miss', 'Keir', 'Trudy', 'T', '10 Brimstone Close', 'Bewdley', 'Worcestershire', 'DY 79 8UB', '580546274', 'trude@horridmail.com', 3000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (345, 'Rev', 'Girling', 'Rob', 'R', '27 Murcroft Road', 'Selly Oak', 'Birmingham', 'B99 9YU', '151420676', 'rob@robnet.com', 4000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (354, 'Mr', 'Vooght', 'Heinrich', 'H', '56 Dark Lane', 'Guildford', 'Surrey', 'GU7 3SW', '122172156', 'hv@junkmail.com', 1000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (357, 'Mr', 'Woodrow', 'John', 'J', '67 New Road', 'Dudley', 'West Midlands', 'DY6 8MN', '501598238', 'john@delivery.co.uk', 6000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (455, 'Mr', 'Ollerton', 'Chris', 'C', '61 Meadow Road', 'Worcester', 'Worcestershire', 'WR99 8YY', '199357764', 'chris@thingynet.co.uk', 8500.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (456, 'Mr', 'Eland', 'Steve', 'S', '69a Teme Close', '', 'Lincoln', 'LN88 7RR', '879945025', 'stevee@erinsnet.au', 100.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (476, 'Mr', 'Roberts', 'Jesse', 'J', '45 School Drive', 'Tonbridge', 'Kent', 'TN8 7SE', '268395361', 'jess@nicemail.com', 8000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (477, 'Ms', 'Cook', 'Jeannie', 'J', '25 Farm Road', 'Coundon', 'Coventry', 'CV7 8JN', '579558878', 'jeannie@universal.com', 5000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (487, 'Dr', 'Moloney', 'Dilys', 'D', '75 Southcrest Road', 'Cheltenham', 'Gloucestershire', 'GL86 4ES', '756280893', 'dil@spamnet.co.uk', 2000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (566, 'Ms', 'Orange', 'Stella', 'S', '4 Mayflower Road', 'Barnt Green', 'Worcestershire', 'B75 6TT', '3924817', 'stella142@hotmail.org', 700.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (576, 'Ms', 'Hake', 'Julia', 'J', '25 Barnt Green Lane', 'Halesowen', 'West Midlands', 'B88 8UU', '756950724', 'jules@thisisp.com', 6000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (587, 'Mrs', 'Drysdale', 'Helen', 'H', '75 Watkins Way', 'Swinton', 'Manchester', 'M66 6NU', '224383323', 'helen@helnnet.org.uk', 9000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (678, 'Mr', 'Welch', 'Gary', 'G', '664 Greatfiled Road', 'Reading', 'Berkshire', 'RG6 7HU', '412021597', 'gary@evilmail.com', 2000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (789, 'Prof', 'Griggs', 'Stuart', 'S', '20 Southall Avenue', 'Ealing', 'London', 'W5 6FF', '313789388', 'stu@hurrynet.com', 7000.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (966, 'Ms', 'Radley', 'Bertha', 'B', 'Flat 2 Magnolia Court', 'Poole', 'Dorset', 'BH8 8DE', '645974922', 'bertha@worrynet.com', 5500.0000);
INSERT INTO `stock`.`Customers` (`CustomerID`, `Title`, `Surname`, `Forename`, `Initials`, `Address1`, `Address2`, `Address3`, `PostCode`, `Tel`, `Email`, `CreditLimit`) VALUES (986, 'Mrs', 'Harrell', 'Stephanie', 'S', '36 Rockford Drive', 'Old Hill', 'West Midlands', 'B98 7DF', '59070234', 'steph@badmail.com', 1000.0000);

INSERT INTO `stock`.`Suppliers` (`SupplierID`, `SupplierName`, `SupplierTelNo`, `SupplierEmail`) VALUES (1, 'NetSolutions PLC', '1293789342', 'deanf@netsolutions.bt.co.uk');
INSERT INTO `stock`.`Suppliers` (`SupplierID`, `SupplierName`, `SupplierTelNo`, `SupplierEmail`) VALUES (2, 'Supanet Communications', '1812431231', 'sales@supanet.co.uk');
INSERT INTO `stock`.`Suppliers` (`SupplierID`, `SupplierName`, `SupplierTelNo`, `SupplierEmail`) VALUES (3, 'Diablo Ltd', '2077436150', 'fiona.george@diablo.co.uk');
INSERT INTO `stock`.`Suppliers` (`SupplierID`, `SupplierName`, `SupplierTelNo`, `SupplierEmail`) VALUES (4, 'Communications R Us', '1132876734', 'sales@commsrus.co.uk');

INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424657', 'Netsolutions OfficeConnect wireless 54 Mbps travel router', 'Connections', 39.9900, 26, 22, 30, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424658', 'Netsolutions OfficeConnect wireless 54 Mbps print server', 'Connections', 49.9900, 90, 87, 100, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424665', 'Netsolutions OfficeConnect wireless 54 Mbps gateway', 'Connections', 49.9900, 15, 14, 20, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424673', 'Netsolutions OfficeConnect wireless 54 Mbps firewall', 'Connections', 59.9900, 0, 5, 10, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424681', 'Netsolutions OfficeConnect wireless 54 Mbps secure router', 'Connections', 66.9900, 85, 82, 100, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424683', 'Netsolutions OfficeConnect VPN firewall', 'Connections', 171.0000, 50, 40, 70, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424691', 'Netsolutions OfficeConnect superstack firewall', 'Connections', 1609.0000, 67, 57, 100, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424698', 'Supanet 10/100 cardbus adapter', 'Cards', 16.9900, 5, 5, 10, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424707', 'Supanet 10/100 PCI adapter', 'Cards', 3.9900, 76, 70, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424711', 'Supanet 10/100/1000 PCI adapter', 'Cards', 8.9900, 49, 39, 70, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424713', 'Supanet Bluetooth USB adapter range up to 10m', 'Cards', 11.9900, 95, 90, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424722', 'Supanet Bluetooth USB adapter range up to 100m', 'Cards', 19.9900, 62, 52, 90, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424730', 'Supanet 54Mbps wireless PC card', 'Cards', 18.9900, 17, 7, 20, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424733', 'Supanet 54Mbps wireless PCI card', 'Cards', 18.9900, 91, 86, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424740', 'Supanet PCMCIA ISDN TA', 'Cards', 74.9900, 73, 67, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424747', 'Netsolutions Switch 3812', 'Switches', 629.0000, 78, 70, 100, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424755', 'Netsolutions Switch 3824', 'Switches', 1019.0000, 49, 46, 70, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424756', 'Netsolutions Super Switch 3870 24 port', 'Switches', 1339.0000, 70, 68, 100, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AE424761', 'Netsolutions Super Switch 48 port', 'Switches', 2348.0000, 53, 52, 70, 1);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF424765', 'Switch 3870 Stacking Cable', 'Switches', 89.9900, 91, 84, 100, 4);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF424766', 'Switch 3870 Resilient Stacking Cable', 'Switches', 157.0000, 7, 10, 10, 4);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF424769', 'Supanet 56k USB Modem', 'Modems', 20.9900, 84, 83, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524774', 'Supanet 56k USB Modem PC Card', 'Modems', 28.9900, 97, 96, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524775', 'Supanet 56k External Modem', 'Modems', 21.9900, 55, 50, 80, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524781', 'Supanet 56k External Modem (Intel)', 'Modems', 23.9900, 52, 48, 70, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524788', 'Supanet 56k External Modem (Conexant)', 'Modems', 13.9900, 57, 54, 80, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524789', 'Supanet 56k External Software Modem (Conexant)', 'Modems', 6.9900, 5, 4, 10, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524790', 'Supanet 56k External PCI Modem (Conexant)', 'Modems', 8.9900, 92, 84, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524792', 'Supanet 56k External Low Profile PCI Modem', 'Modems', 14.9900, 26, 16, 30, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524801', 'Supanet 56k External Fast PCI Modem', 'Modems', 5.9900, 69, 66, 100, 2);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524809', 'Diablo 206W Wireless Network Camera', 'Cameras', 189.0000, 2, 30, 10, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524812', 'Diablo 206M Megapixel Wireless Network Camera', 'Cameras', 219.0000, 58, 55, 80, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524818', 'Diablo 206M NEW Network Camera', 'Cameras', 169.0000, 4, 45, 10, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524824', 'Diablo 207 Network Camera', 'Cameras', 514.0000, 34, 28, 50, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524829', 'Diablo 208 Network Camera', 'Cameras', 79.9900, 90, 87, 100, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524830', 'Diablo 208 Surveillance Kit', 'Cameras', 1600.0000, 64, 58, 90, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524837', 'Diablo 208 Outdoor Verso Bundle', 'Cameras', 509.0000, 5, 2, 10, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524841', 'Diablo 209 Audio Module', 'Cameras', 189.0000, 89, 80, 100, 3);
INSERT INTO `stock`.`Products` (`ProductNumber`, `ProductDescription`, `Category`, `Price`, `NumberInStock`, `Re-OrderLevel`, `Re-OrderQuantity`, `SupplierNumber`) VALUES ('AF524845', 'Diablo 209A Outdoor Housing', 'Cameras', 189.0000, 72, 65, 100, 3);

INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376797, DATE_ADD(CURDATE(), INTERVAL -0 DAY), 576);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376798, DATE_ADD(CURDATE(), INTERVAL -3 DAY), 254);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376799, DATE_ADD(CURDATE(), INTERVAL -32 DAY), 354);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376800, DATE_ADD(CURDATE(), INTERVAL -8 DAY), 678);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376801, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376802, DATE_ADD(CURDATE(), INTERVAL -1 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376803, DATE_ADD(CURDATE(), INTERVAL -10 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376804, DATE_ADD(CURDATE(), INTERVAL -52 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376805, DATE_ADD(CURDATE(), INTERVAL -12 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376806, DATE_ADD(CURDATE(), INTERVAL -12 DAY), 296);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376807, DATE_ADD(CURDATE(), INTERVAL -11 DAY), 357);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376808, DATE_ADD(CURDATE(), INTERVAL -10 DAY), 587);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376809, DATE_ADD(CURDATE(), INTERVAL -7 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376810, DATE_ADD(CURDATE(), INTERVAL -1 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376811, DATE_ADD(CURDATE(), INTERVAL -1 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376812, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376813, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376814, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 566);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376815, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376816, DATE_ADD(CURDATE(), INTERVAL -3 DAY), 456);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376817, DATE_ADD(CURDATE(), INTERVAL -102 DAY), 566);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376818, DATE_ADD(CURDATE(), INTERVAL -105 DAY), 336);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376819, DATE_ADD(CURDATE(), INTERVAL -99 DAY), 476);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376820, DATE_ADD(CURDATE(), INTERVAL -73 DAY), 566);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376821, DATE_ADD(CURDATE(), INTERVAL -17 DAY), 357);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376822, DATE_ADD(CURDATE(), INTERVAL -1 DAY), 566);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376823, DATE_ADD(CURDATE(), INTERVAL -6 DAY), 986);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376824, DATE_ADD(CURDATE(), INTERVAL -66 DAY), 455);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376825, DATE_ADD(CURDATE(), INTERVAL -69 DAY), 966);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376826, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 324);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376827, DATE_ADD(CURDATE(), INTERVAL -19 DAY), 132);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376828, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 333);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376829, DATE_ADD(CURDATE(), INTERVAL -42 DAY), 296);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376830, DATE_ADD(CURDATE(), INTERVAL -47 DAY), 477);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376831, DATE_ADD(CURDATE(), INTERVAL -90 DAY), 576);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376832, DATE_ADD(CURDATE(), INTERVAL -110 DAY), 789);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376833, DATE_ADD(CURDATE(), INTERVAL -3 DAY), 576);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376834, DATE_ADD(CURDATE(), INTERVAL -1 DAY), 176);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376835, DATE_ADD(CURDATE(), INTERVAL -3 DAY), 576);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376836, DATE_ADD(CURDATE(), INTERVAL -8 DAY), 176);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376837, DATE_ADD(CURDATE(), INTERVAL -9 DAY), 266);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376838, DATE_ADD(CURDATE(), INTERVAL -6 DAY), 487);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376839, DATE_ADD(CURDATE(), INTERVAL -3 DAY), 789);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376840, DATE_ADD(CURDATE(), INTERVAL -22 DAY), 487);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376841, DATE_ADD(CURDATE(), INTERVAL -60 DAY), 324);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376842, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 345);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376843, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 354);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376844, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 966);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376845, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 132);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376846, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 333);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376847, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 477);
INSERT INTO `stock`.`Orders` (`OrderNumber`, `OrderDate`, `CustomerID`) VALUES (376848, DATE_ADD(CURDATE(), INTERVAL -2 DAY), 678);


INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376797, 'AE424657', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376798, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376799, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376800, 'AF524781', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376800, 'AF524830', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376801, 'AE424747', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376802, 'AE424747', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376802, 'AF524789', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376802, 'AF524792', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376803, 'AF524801', 4);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376804, 'AF524801', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376805, 'AF524830', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376806, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376807, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376808, 'AE424657', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376809, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376810, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376811, 'AE424657', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376812, 'AF524781', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376813, 'AF524801', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376814, 'AE424747', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376814, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376814, 'AF524801', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376815, 'AE424657', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376816, 'AE424657', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376817, 'AE424657', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376818, 'AE424711', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376819, 'AE424722', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376820, 'AE424722', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376821, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376822, 'AE424747', 5);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376823, 'AE424747', 7);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376824, 'AF524789', 5);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376825, 'AF524830', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376826, 'AE424707', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376827, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376828, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376829, 'AF524781', 6);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376830, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376831, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376832, 'AF524801', 7);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376833, 'AF524830', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376834, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376834, 'AF524801', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376835, 'AE424747', 6);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376835, 'AF524781', 4);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376835, 'AF524829', 5);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376835, 'AF524830', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376836, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376837, 'AF524781', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376838, 'AF524830', 4);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376839, 'AE424698', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376840, 'AE424713', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376841, 'AF524829', 8);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376842, 'AE424657', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376843, 'AE424698', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376843, 'AE424722', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376844, 'AE424722', 3);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376845, 'AE424747', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376846, 'AE424747', 1);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376847, 'AE424747', 2);
INSERT INTO `stock`.`OrderDetails` (`OrderNumber`, `ProductNumber`, `Quantity`) VALUES (376848, 'AE424747', 1);

/*
ALTER TABLE `stock`.`customers` change column `CustomerID` `CustomerID` int unsigned not null auto_increment;
ALTER TABLE `stock`.`suppliers` change column `SupplierID` `SupplierID` int unsigned not null auto_increment;
ALTER TABLE `stock`.`orders` change column `OrderNumber` `OrderNumber` int unsigned not null auto_increment;


ALTER TABLE `stock`.`Products` ADD FOREIGN KEY(`SupplierNumber`) REFERENCES `stock`.`Suppliers` (`SupplierID`);


ALTER TABLE `stock`.`Orders` ADD  FOREIGN KEY(`CustomerID`) REFERENCES `stock`.`Customers` (`CustomerID`);


ALTER TABLE `stock`.`OrderDetails` ADD FOREIGN KEY(`OrderNumber`) REFERENCES `stock`.`Orders` (`OrderNumber`);


ALTER TABLE `stock`.`OrderDetails` ADD FOREIGN KEY(`ProductNumber`) REFERENCES `stock`.`Products` (`ProductNumber`);
*/
