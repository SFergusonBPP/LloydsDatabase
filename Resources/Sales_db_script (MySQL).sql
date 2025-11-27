CREATE DATABASE IF NOT EXISTS `Sales` ;

Use `Sales` ;


CREATE TABLE IF NOT EXISTS `Sales`.`Salesman`
(`Salesman_ID` Int Not Null auto_increment Primary Key,
`Name` varchar(25),
`City` varchar(25),
`Commision` decimal(8,2));
alter table `Sales`.`Salesman` auto_increment=21;


CREATE TABLE IF NOT EXISTS  `Sales`.`Customer`
(`Customer_ID` int Not Null auto_increment Primary Key,
`Customer_Name` varchar(40) Not Null,
`City` varchar(30),
`Grade` int);
alter table `Sales`.`Customer` auto_increment=101;

CREATE TABLE IF NOT EXISTS `Sales`.`Orders`
(`Order_No` int Not Null auto_increment Primary Key,
`Quantity` int,
`Ord_Date` date Not Null,
`customer_ID` int,
`salesman_ID` int,
foreign key (`customer_ID`) REFERENCES `Sales`.`Customer`(`Customer_ID`),
foreign key (`salesman_ID`) REFERENCES `Sales`.`Salesman`(`Salesman_ID`));


Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('James Hook', 'Paris', 0.13);
Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('Pit Alex', 'Rome', 0.12);
Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('Paul Adam', 'London', 0.15);
Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('Gerrard Lyon', 'Paris', 0.15);
Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('Ian Knight', 'London', 0.14);
Insert INTO `Sales`.`Salesman` (`Name`, `City`, `Commision`) Values ('Jake Rike', 'London', 0.13);

Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Graham Scott', 'London', 100);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Brad Davis', 'Rome', 300);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Jack Green', 'London', 200);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Nick Guzan', 'Paris', 200);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('John Rimando', 'Paris', 100);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Jake Smith', 'London', 200);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Jane Davis', 'London', 300);
Insert Into `Sales`.`Customer` (`Customer_Name`, `City`, `Grade`) Values ('Claire Johns', 'Rome', 300);

Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-10-16', 104, 22);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-05-13', 101, 21);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-11-15', 102, 26);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-05-17', 102, 26);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-10-06', 105, 22);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-01-22', 108, 24);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-11-25', 105, 24);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-08-15', 102, 22);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-08-18', 101, 24);
Insert Into `Sales`.`Orders` (`Quantity`, `Ord_Date`, `Customer_ID`, `Salesman_ID`) Values (3, '2015-04-16', 104, 22);