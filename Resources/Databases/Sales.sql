-- Create database and select it
CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;

-- Salesman table
CREATE TABLE IF NOT EXISTS Salesman (
    salesman_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    commission DECIMAL(8,2)
) AUTO_INCREMENT = 21;

-- Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(40) NOT NULL,
    city VARCHAR(30),
    grade INT
) AUTO_INCREMENT = 101;

-- Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantity INT,
    ord_date DATE NOT NULL,
    customer_id INT,
    salesman_id INT,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_salesman FOREIGN KEY (salesman_id)
        REFERENCES Salesman(salesman_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Insert Salesmen (IDs will be 21–26)
INSERT INTO Salesman (name, city, commission) VALUES
('James Hook', 'Paris', 0.13),   -- ID 21
('Pit Alex', 'Rome', 0.12),      -- ID 22
('Paul Adam', 'London', 0.15),   -- ID 23
('Gerrard Lyon', 'Paris', 0.15), -- ID 24
('Ian Knight', 'London', 0.14),  -- ID 25
('Jake Rike', 'London', 0.13);   -- ID 26

-- Insert Customers (IDs will be 101–108)
INSERT INTO Customer (customer_name, city, grade) VALUES
('Graham Scott', 'London', 100),   -- ID 101
('Brad Davis', 'Rome', 300),       -- ID 102
('Jack Green', 'London', 200),     -- ID 103
('Nick Guzan', 'Paris', 200),      -- ID 104
('John Rimando', 'Paris', 100),    -- ID 105
('Jake Smith', 'London', 200),     -- ID 106
('Jane Davis', 'London', 300),     -- ID 107
('Claire Johns', 'Rome', 300);     -- ID 108

-- Insert Orders (all IDs now valid)
INSERT INTO Orders (quantity, ord_date, customer_id, salesman_id) VALUES
(3, '2015-10-16', 104, 22),  -- Nick Guzan with Pit Alex
(3, '2015-05-13', 101, 21),  -- Graham Scott with James Hook
(3, '2015-11-15', 102, 26),  -- Brad Davis with Jake Rike
(3, '2015-05-17', 102, 26),  -- Brad Davis with Jake Rike
(3, '2015-10-06', 105, 22),  -- John Rimando with Pit Alex
(3, '2015-01-22', 108, 24),  -- Claire Johns with Gerrard Lyon
(3, '2015-11-25', 105, 24),  -- John Rimando with Gerrard Lyon
(3, '2015-08-15', 102, 22),  -- Brad Davis with Pit Alex
(3, '2015-08-18', 101, 24),  -- Graham Scott with Gerrard Lyon
(3, '2015-04-16', 104, 22);  -- Nick Guzan with Pit Alex