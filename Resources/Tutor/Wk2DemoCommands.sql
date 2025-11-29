-- Ensure we are using the correct database
USE DemoDB;

-- ============================================
-- DEMO COMMAND 1: Stored Procedure
-- ============================================
-- Procedure to get employee details by ID
DELIMITER //
CREATE PROCEDURE GetEmployeeDetails (IN empID INT)
BEGIN
    SELECT *
    FROM Employees
    WHERE EmployeeID = empID;
END //
DELIMITER ;

-- Call the procedure with EmployeeID = 1
CALL GetEmployeeDetails(1);

-- ============================================
-- DEMO COMMAND 2: Function
-- ============================================
-- Function to return full name of an employee
DELIMITER //
CREATE FUNCTION GetFullName(empID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(100);

    SELECT CONCAT(FirstName, ' ', LastName)
    INTO full_name
    FROM Employees
    WHERE EmployeeID = empID;

    RETURN full_name;
END //
DELIMITER ;

-- Call the function with EmployeeID = 1
SELECT GetFullName(1) AS FullName;

-- ============================================
-- DEMO COMMAND 3: View
-- ============================================
-- View of active employees
CREATE VIEW ActiveEmployees AS
SELECT 
    EmployeeID,
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Department
FROM Employees
WHERE Status = 'Active';

-- Query the view
SELECT * FROM ActiveEmployees;

-- ============================================
-- DEMO COMMAND 4: Indexing
-- ============================================
-- Single-column index
CREATE INDEX idx_city
ON Customers (City);

-- Multi-column (composite) index
CREATE INDEX idx_name
ON Customers (LastName, FirstName);

-- Unique index
-- Adjust column name if schema uses Email instead of ContactNumber
CREATE UNIQUE INDEX idx_unique_contact
ON Customers (ContactNumber);

-- Full-text index
CREATE FULLTEXT INDEX idx_fulltext_product
ON Sales (Product);

-- Demo queries using indexes
SELECT * FROM Customers WHERE City = 'New York';
SELECT * FROM Customers WHERE LastName = 'Johnington' AND FirstName = 'John';

-- This will fail if a duplicate ContactNumber is inserted
INSERT INTO Customers (CustomerID, FirstName, LastName, City, TotalPurchases, ContactNumber)
VALUES (7, 'Test', 'Duplicate', 'London', 100.00, '01234 112233');

-- Full-text search
SELECT * FROM Sales
WHERE MATCH(Product) AGAINST('Laptop');