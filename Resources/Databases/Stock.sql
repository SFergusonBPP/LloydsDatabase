DROP DATABASE IF EXISTS stock;
CREATE DATABASE stock;
USE stock;

-- Customers
CREATE TABLE customers (
    customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(10),
    surname VARCHAR(50),
    forename VARCHAR(50),
    initials VARCHAR(5),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    address3 VARCHAR(50),
    postcode VARCHAR(10),
    tel VARCHAR(15),
    email VARCHAR(90),
    credit_limit DECIMAL(10,2)
) AUTO_INCREMENT = 101;

-- Suppliers
CREATE TABLE suppliers (
    supplier_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_tel_no VARCHAR(50),
    supplier_email VARCHAR(90)
) AUTO_INCREMENT = 1;

-- Products
CREATE TABLE products (
    product_number CHAR(8) PRIMARY KEY,
    product_description VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    number_in_stock INT NOT NULL,
    reorder_level INT NOT NULL,
    reorder_quantity INT NOT NULL,
    supplier_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_products_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Orders
CREATE TABLE orders (
    order_number INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    customer_id INT UNSIGNED,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
) AUTO_INCREMENT = 376797;

-- Order Details
CREATE TABLE order_details (
    order_number INT UNSIGNED,
    product_number CHAR(8),
    quantity INT,
    PRIMARY KEY (order_number, product_number),
    CONSTRAINT fk_orderdetails_order FOREIGN KEY (order_number) REFERENCES orders(order_number),
    CONSTRAINT fk_orderdetails_product FOREIGN KEY (product_number) REFERENCES products(product_number)
);

-- Customers
INSERT INTO customers 
(title, surname, forename, initials, address1, address2, address3, postcode, tel, email, credit_limit) VALUES
('Mr', 'Raybould', 'James', 'J', 'Flat 1', '34 Jersey Close', 'Oldham', 'OL9 8YU', '635463212', 'james@hotnet.co.uk', 900.00),
('Mr', 'Allen', 'Tom', 'T', '8 Glebe Drive', '', 'Warwick', 'CV69 7FG', '407619993', 'tom@email.com', 3000.00),
('Mr', 'Tomlinson', 'Jack', 'J', '9 Ironbridge Road', 'Redditch', 'Worcestershire', 'B97 2DE', '447278456', 'jack@jack.co.uk', 7000.00),
('Mr', 'Barnaby', 'Ian', 'I', '75 Cathedral Close', 'Wolverhampton', 'West Midlands', 'WV4 6FQ', '291649554', 'ian@thismail.com', 5000.00),
('Dr', 'Washbourne', 'George', 'G', '75 Caravan Road', 'Camberley', 'Surrey', 'GU2 6FR', '164066866', 'george@spamnet.com', 1000.00),
('Mr', 'Prabhu', 'Suresh', 'S', '8 Pelham Street', 'Colchester', 'Essex', 'CO8 7KL', '933043899', 'prabhu@pradmail.com', 8000.00),
('Mr', 'Hill', 'Henry', 'H', '47 Pinewoods Avenue', 'Harborne', 'Birmingham', 'B77 8RE', '936907567', 'henry675@freenet.com', 2000.00),
('Mrs', 'Barlow', 'Leah', 'L', '46 Solent Road', 'Gornal Wood', 'West Midlands', 'B98 7FD', '340095746', 'leah978@ninnynet.com', 6000.00),
('Miss', 'Keir', 'Trudy', 'T', '10 Brimstone Close', 'Bewdley', 'Worcestershire', 'DY79 8UB', '580546274', 'trude@horridmail.com', 3000.00),
('Rev', 'Girling', 'Rob', 'R', '27 Murcroft Road', 'Selly Oak', 'Birmingham', 'B99 9YU', '151420676', 'rob@robnet.com', 4000.00),
('Mr', 'Vooght', 'Heinrich', 'H', '56 Dark Lane', 'Guildford', 'Surrey', 'GU7 3SW', '122172156', 'hv@junkmail.com', 1000.00),
('Mr', 'Woodrow', 'John', 'J', '67 New Road', 'Dudley', 'West Midlands', 'DY6 8MN', '501598238', 'john@delivery.co.uk', 6000.00),
('Mr', 'Ollerton', 'Chris', 'C', '61 Meadow Road', 'Worcester', 'Worcestershire', 'WR99 8YY', '199357764', 'chris@thingynet.co.uk', 8500.00),
('Mr', 'Eland', 'Steve', 'S', '69a Teme Close', '', 'Lincoln', 'LN88 7RR', '879945025', 'stevee@erinsnet.au', 100.00),
('Mr', 'Roberts', 'Jesse', 'J', '45 School Drive', 'Tonbridge', 'Kent', 'TN8 7SE', '268395361', 'jess@nicemail.com', 8000.00),
('Ms', 'Cook', 'Jeannie', 'J', '25 Farm Road', 'Coundon', 'Coventry', 'CV7 8JN', '579558878', 'jeannie@universal.com', 5000.00),
('Dr', 'Moloney', 'Dilys', 'D', '75 Southcrest Road', 'Cheltenham', 'Gloucestershire', 'GL86 4ES', '756280893', 'dil@spamnet.co.uk', 2000.00),
('Ms', 'Orange', 'Stella', 'S', '4 Mayflower Road', 'Barnt Green', 'Worcestershire', 'B75 6TT', '3924817', 'stella142@hotmail.org', 700.00),
('Ms', 'Hake', 'Julia', 'J', '25 Barnt Green Lane', 'Halesowen', 'West Midlands', 'B88 8UU', '756950724', 'jules@thisisp.com', 6000.00),
('Mrs', 'Drysdale', 'Helen', 'H', '75 Watkins Way', 'Swinton', 'Manchester', 'M66 6NU', '224383323', 'helen@helnnet.org.uk', 9000.00),
('Mr', 'Welch', 'Gary', 'G', '664 Greatfiled Road', 'Reading', 'Berkshire', 'RG6 7HU', '412021597', 'gary@evilmail.com', 2000.00),
('Prof', 'Griggs', 'Stuart', 'S', '20 Southall Avenue', 'Ealing', 'London', 'W5 6FF', '313789388', 'stu@hurrynet.com', 7000.00),
('Ms', 'Radley', 'Bertha', 'B', 'Flat 2 Magnolia Court', 'Poole', 'Dorset', 'BH8 8DE', '645974922', 'bertha@worrynet.com', 5500.00),
('Mrs', 'Harrell', 'Stephanie', 'S', '36 Rockford Drive', 'Old Hill', 'West Midlands', 'B98 7DF', '59070234', 'steph@badmail.com', 1000.00);

-- Suppliers
INSERT INTO suppliers (supplier_name, supplier_tel_no, supplier_email) VALUES
('NetSolutions PLC', '1293789342', 'deanf@netsolutions.bt.co.uk'),
('Supanet Communications', '1812431231', 'sales@supanet.co.uk'),
('Diablo Ltd', '2077436150', 'fiona.george@diablo.co.uk'),
('Communications R Us', '1132876734', 'sales@commsrus.co.uk');

-- Products
INSERT INTO products 
(product_number, product_description, category, price, number_in_stock, reorder_level, reorder_quantity, supplier_id) VALUES
('AE424657', 'Netsolutions OfficeConnect wireless 54 Mbps travel router', 'Connections', 39.99, 26, 22, 30, 1),
('AE424658', 'Netsolutions OfficeConnect wireless 54 Mbps print server', 'Connections', 49.99, 90, 87, 100, 1),
('AE424665', 'Netsolutions OfficeConnect wireless 54 Mbps gateway', 'Connections', 49.99, 15, 14, 20, 1),
('AE424673', 'Netsolutions OfficeConnect wireless 54 Mbps firewall', 'Connections', 59.99, 0, 5, 10, 1),
('AE424681', 'Netsolutions OfficeConnect wireless 54 Mbps secure router', 'Connections', 66.99, 85, 82, 100, 1),
('AE424683', 'Netsolutions OfficeConnect VPN firewall', 'Connections', 171.00, 50, 40, 70, 1),
('AE424691', 'Netsolutions OfficeConnect superstack firewall', 'Connections', 1609.00, 67, 57, 100, 1),
('AE424698', 'Supanet 10/100 cardbus adapter', 'Cards', 16.99, 5, 5, 10, 2),
('AE424707', 'Supanet 10/100 PCI adapter', 'Cards', 3.99, 76, 70, 100, 2),
('AE424711', 'Supanet 10/100/1000 PCI adapter', 'Cards', 8.99, 49, 39, 70, 2),
('AE424713', 'Supanet Bluetooth USB adapter range up to 10m', 'Cards', 11.99, 95, 90, 100, 2),
('AE424722', 'Supanet Bluetooth USB adapter range up to 100m', 'Cards', 19.99, 62, 52, 90, 2),
('AE424730', 'Supanet 54Mbps wireless PC card', 'Cards', 18.99, 17, 7, 20, 2),
('AE424733', 'Supanet 54Mbps wireless PCI card', 'Cards', 18.99, 91, 86, 100, 2),
('AE424740', 'Supanet PCMCIA ISDN TA', 'Cards', 74.99, 73, 67, 100, 2),
('AE424747', 'Netsolutions Switch 3812', 'Switches', 629.00, 78, 70, 100, 1),
('AE424755', 'Netsolutions Switch 3824', 'Switches', 1019.00, 49, 46, 70, 1),
('AE424756', 'Netsolutions Super Switch 3870 24 port', 'Switches', 1339.00, 70, 68, 100, 1),
('AE424761', 'Netsolutions Super Switch 48 port', 'Switches', 2348.00, 53, 52, 70, 1),
('AF424765', 'Switch 3870 Stacking Cable', 'Switches', 89.99, 91, 84, 100, 4),
('AF424766', 'Switch 3870 Resilient Stacking Cable', 'Switches', 157.00, 7, 10, 10, 4),
('AF424769', 'Supanet 56k USB Modem', 'Modems', 20.99, 84, 83, 100, 2),
('AF524774', 'Supanet 56k USB Modem PC Card', 'Modems', 28.99, 97, 96, 100, 2),
('AF524775', 'Supanet 56k External Modem', 'Modems', 21.99, 55, 50, 80, 2),
('AF524781', 'Supanet 56k External Modem (Intel)', 'Modems', 23.99, 52, 48, 70, 2),
('AF524788', 'Supanet 56k External Modem (Conexant)', 'Modems', 13.99, 57, 54, 80, 2),
('AF524789', 'Supanet 56k External Software Modem (Conexant)', 'Modems', 6.99, 5, 4, 10, 2),
('AF524790', 'Supanet 56k External PCI Modem (Conexant)', 'Modems', 8.99, 92, 84, 100, 2),
('AF524792', 'Supanet 56k External Low Profile PCI Modem', 'Modems', 14.99, 26, 16, 30, 2),
('AF524801', 'Supanet 56k External Fast PCI Modem', 'Modems', 5.99, 69, 66, 100, 2),
('AF524809', 'Diablo 206W Wireless Network Camera', 'Cameras', 189.00, 2, 30, 10, 3),
('AF524812', 'Diablo 206M Megapixel Wireless Network Camera', 'Cameras', 219.00, 58, 55, 80, 3),
('AF524818', 'Diablo 206M NEW Network Camera', 'Cameras', 169.00, 4, 45, 10, 3),
('AF524824', 'Diablo 207 Network Camera', 'Cameras', 514.00, 34, 28, 50, 3),
('AF524829', 'Diablo 208 Network Camera', 'Cameras', 79.99, 90, 87, 100, 3),
('AF524830', 'Diablo 208 Surveillance Kit', 'Cameras', 1600.00, 64, 58, 90, 3),
('AF524837', 'Diablo 208 Outdoor Verso Bundle', 'Cameras', 509.00, 5, 2, 10, 3),
('AF524841', 'Diablo 209 Audio Module', 'Cameras', 189.00, 89, 80, 100, 3),
('AF524845', 'Diablo 209A Outdoor Housing', 'Cameras', 189.00, 72, 65, 100, 3);

-- Orders
INSERT INTO orders (order_date, customer_id) VALUES
(DATE_ADD(CURDATE(), INTERVAL -110 DAY), 122),
(DATE_ADD(CURDATE(), INTERVAL -105 DAY), 109),
(DATE_ADD(CURDATE(), INTERVAL -102 DAY), 118),
(DATE_ADD(CURDATE(), INTERVAL -99 DAY), 115),
(DATE_ADD(CURDATE(), INTERVAL -90 DAY), 119),
(DATE_ADD(CURDATE(), INTERVAL -73 DAY), 118),
(DATE_ADD(CURDATE(), INTERVAL -69 DAY), 123),
(DATE_ADD(CURDATE(), INTERVAL -66 DAY), 119),
(DATE_ADD(CURDATE(), INTERVAL -60 DAY), 109),
(DATE_ADD(CURDATE(), INTERVAL -52 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -47 DAY), 116),
(DATE_ADD(CURDATE(), INTERVAL -42 DAY), 106),
(DATE_ADD(CURDATE(), INTERVAL -32 DAY), 111),
(DATE_ADD(CURDATE(), INTERVAL -22 DAY), 118),
(DATE_ADD(CURDATE(), INTERVAL -19 DAY), 102),
(DATE_ADD(CURDATE(), INTERVAL -17 DAY), 107),
(DATE_ADD(CURDATE(), INTERVAL -12 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -12 DAY), 106),
(DATE_ADD(CURDATE(), INTERVAL -11 DAY), 107),
(DATE_ADD(CURDATE(), INTERVAL -10 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -10 DAY), 113),
(DATE_ADD(CURDATE(), INTERVAL -9 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -8 DAY), 103),
(DATE_ADD(CURDATE(), INTERVAL -8 DAY), 112),
(DATE_ADD(CURDATE(), INTERVAL -7 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -6 DAY), 118),
(DATE_ADD(CURDATE(), INTERVAL -6 DAY), 124),
(DATE_ADD(CURDATE(), INTERVAL -3 DAY), 104),
(DATE_ADD(CURDATE(), INTERVAL -3 DAY), 114),
(DATE_ADD(CURDATE(), INTERVAL -3 DAY), 119),
(DATE_ADD(CURDATE(), INTERVAL -3 DAY), 119),
(DATE_ADD(CURDATE(), INTERVAL -3 DAY), 122),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 102),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 107),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 108),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 108),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 109),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 111),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 116),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 117),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 121),
(DATE_ADD(CURDATE(), INTERVAL -2 DAY), 123),
(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 101),
(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 103),
(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 105),
(DATE_ADD(CURDATE(), INTERVAL -1 DAY), 118),
(DATE_ADD(CURDATE(), INTERVAL 0 DAY), 119);

-- Order Details
INSERT INTO order_details (order_number, product_number, quantity) VALUES
(376848, 'AE424657', 1),
(376824, 'AE424747', 1),
(376809, 'AF524781', 1),
(376820, 'AF524781', 2),
(376820, 'AF524830', 1),
(376833, 'AE424747', 3),
(376846, 'AE424747', 2),
(376846, 'AF524789', 1),
(376846, 'AF524792', 2),
(376816, 'AF524801', 4),
(376806, 'AF524801', 3),
(376813, 'AF524830', 2),
(376814, 'AE424747', 1),
(376815, 'AE424747', 1),
(376817, 'AE424657', 1),
(376821, 'AE424747', 1),
(376843, 'AF524781', 1),
(376844, 'AE424657', 2),
(376829, 'AF524781', 3),
(376830, 'AF524801', 1),
(376840, 'AE424747', 2),
(376840, 'AF524781', 1),
(376840, 'AF524801', 1),
(376831, 'AE424657', 2),
(376825, 'AE424657', 3),
(376799, 'AE424657', 1),
(376798, 'AE424711', 1),
(376800, 'AE424722', 3),
(376802, 'AE424722', 2),
(376812, 'AE424747', 1),
(376847, 'AE424747', 5),
(376823, 'AE424747', 7),
(376804, 'AF524789', 5),
(376803, 'AF524830', 3),
(376837, 'AE424707', 2),
(376811, 'AE424747', 1),
(376835, 'AE424747', 1),
(376808, 'AF524781', 6),
(376807, 'AF524781', 1),
(376801, 'AF524781', 1),
(376797, 'AF524801', 7),
(376826, 'AF524830', 1),
(376845, 'AE424747', 1),
(376845, 'AF524801', 2),
(376827, 'AE424747', 6),
(376827, 'AF524781', 4),
(376827, 'AF524829', 5),
(376827, 'AF524830', 2),
(376819, 'AF524781', 1),
(376818, 'AF524781', 1),
(376822, 'AF524830', 4),
(376828, 'AE424698', 1),
(376810, 'AE424713', 1),
(376805, 'AF524829', 8),
(376841, 'AE424657', 1),
(376838, 'AE424698', 2),
(376838, 'AE424722', 1),
(376842, 'AE424722', 3),
(376832, 'AE424747', 2),
(376836, 'AE424747', 1),
(376839, 'AE424747', 2),
(376834, 'AE424747', 1);

