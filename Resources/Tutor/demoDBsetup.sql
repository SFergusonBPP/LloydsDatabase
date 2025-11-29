-- ============================================
-- Reset Demo Database
-- ============================================
DROP DATABASE IF EXISTS DemoDB;
CREATE DATABASE DemoDB;
USE DemoDB;

-- ============================================
-- Table: Customers
-- ============================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    TotalPurchases DECIMAL(10, 2)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, City, TotalPurchases) VALUES
(1, 'John', 'Johnington', 'New York', 1000.50),
(2, 'Jane', 'Janeington', 'Los Angeles', 850.00),
(3, 'Mike', 'Mikeington', 'New York', 1200.00),
(4, 'Alice', 'Aliceington', 'Chicago', 500.00),
(5, 'Emily', 'Emilyington', 'New York', 300.00);

-- ============================================
-- Table: Orders
-- ============================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(1, 1, '2024-01-01', 250.00),
(2, 2, '2024-02-15', 600.00),
(3, 1, '2024-03-12', 125.00),
(4, 3, '2024-04-05', 800.00),
(5, 4, '2024-05-20', 150.00);

-- ============================================
-- Table: Sales
-- ============================================
CREATE TABLE Sales (
    Product VARCHAR(100),
    Region VARCHAR(50),
    Sales_Amount DECIMAL(10, 2)
);

INSERT INTO Sales (Product, Region, Sales_Amount) VALUES
('Laptop', 'North', 15000.00),
('Smartphone', 'South', 8000.00),
('Tablet', 'East', 5000.00),
('Smartwatch', 'West', 3000.00),
('Headphones', 'North', 7000.00);

-- ============================================
-- Table: Employees
-- ============================================
CREATE TABLE Employees (
    Name VARCHAR(100),
    Salary DECIMAL(10, 2),
    Department VARCHAR(50)
);

INSERT INTO Employees (Name, Salary, Department) VALUES
('John Johnington', 45000.00, 'Sales'),
('Tim Timmington', 60000.00, 'Marketing'),
('Paul Paulington', 25000.00, 'Support'),
('Jack Jackington', 50000.00, 'Finance'),
('Jill Jillington', 75000.00, 'Development');