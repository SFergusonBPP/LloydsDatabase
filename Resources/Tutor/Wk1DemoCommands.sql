-- Ensure we are using the correct database
USE DemoDB;

-- SELECT: Retrieve all customers
SELECT FirstName, LastName, City FROM Customers;

-- INSERT: Add a new customer
INSERT INTO Customers (CustomerID, FirstName, LastName, City, TotalPurchases)
VALUES (6, 'Sarah', 'Sarrington', 'Boston', 400.00);

-- UPDATE: Update a customer's city
UPDATE Customers
SET City = 'San Francisco'
WHERE CustomerID = 2;

-- DELETE: Remove a customer
DELETE FROM Customers
WHERE CustomerID = 5;

-- INNER JOIN: Customers with orders
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- LEFT JOIN: All customers, with orders if they exist
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN: All orders, with customers if they exist
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- FULL JOIN: All customers and all orders
-- (Note: Some SQL engines require UNION of LEFT + RIGHT instead of FULL JOIN)
SELECT c.FirstName, c.LastName, o.OrderID
FROM Customers c
CROSS JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- CASE: Categorise orders by amount
SELECT 
    o.OrderID,
    o.OrderAmount,
    CASE 
        WHEN o.OrderAmount < 200 THEN 'Low'
        WHEN o.OrderAmount BETWEEN 200 AND 500 THEN 'Medium'
        ELSE 'High'
    END AS OrderCategory
FROM Orders o;

-- GROUP BY: Summarise customers by city
SELECT 
    City,
    COUNT(*) AS NumberOfCustomers,
    SUM(TotalPurchases) AS TotalCityPurchases
FROM Customers
GROUP BY City;