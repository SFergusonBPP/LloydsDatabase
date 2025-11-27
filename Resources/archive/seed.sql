USE FabDB;

-- Insert dummy employees
INSERT INTO Employees (FirstName, LastName, Email, Phone, HireDate, JobTitle) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2020-01-15', 'Manager'),
('Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '2019-03-22', 'Sales Associate'),
('Jim', 'Brown', 'jim.brown@example.com', '123-456-7892', '2018-07-01', 'Technician'),
('Jake', 'White', 'jake.white@example.com', '123-456-7893', '2021-11-23', 'Sales Associate'),
('Jill', 'Black', 'jill.black@example.com', '123-456-7894', '2022-05-15', 'HR Specialist');

-- Insert dummy employee details
INSERT INTO EmployeeDetails (EmployeeID, Address, City, State, PostalCode, Country) VALUES
(1, '123 Main St', 'Townsville', 'TS', '12345', 'Countryland'),
(2, '456 Oak St', 'Villagetown', 'VT', '23456', 'Countryland'),
(3, '789 Pine St', 'Cityplace', 'CP', '34567', 'Countryland'),
(4, '101 Maple St', 'Hamlet', 'HT', '45678', 'Countryland'),
(5, '202 Birch St', 'Metropolis', 'MT', '56789', 'Countryland');

-- Insert dummy stock
INSERT INTO Stock (ProductName, Description, Quantity, Price) VALUES
('Product A', 'Description for Product A', 100, 10.00),
('Product B', 'Description for Product B', 150, 15.00),
('Product C', 'Description for Product C', 200, 20.00),
('Product D', 'Description for Product D', 250, 25.00),
('Product E', 'Description for Product E', 300, 30.00);

-- Insert dummy suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Address, City, State, PostalCode, Country, Phone) VALUES
('Supplier 1', 'Contact 1', '11 Supplier St', 'Supplierville', 'SV', '11111', 'Countryland', '123-555-1111'),
('Supplier 2', 'Contact 2', '22 Supplier St', 'Supplierville', 'SV', '22222', 'Countryland', '123-555-2222'),
('Supplier 3', 'Contact 3', '33 Supplier St', 'Supplierville', 'SV', '33333', 'Countryland', '123-555-3333'),
('Supplier 4', 'Contact 4', '44 Supplier St', 'Supplierville', 'SV', '44444', 'Countryland', '123-555-4444'),
('Supplier 5', 'Contact 5', '55 Supplier St', 'Supplierville', 'SV', '55555', 'Countryland', '123-555-5555');

-- Insert dummy clients
INSERT INTO Clients (ClientName, ContactName, Address, City, State, PostalCode, Country, Phone) VALUES
('Client 1', 'Contact A', '1 Client St', 'Clientville', 'CV', '11111', 'Countryland', '321-555-1111'),
('Client 2', 'Contact B', '2 Client St', 'Clientville', 'CV', '22222', 'Countryland', '321-555-2222'),
('Client 3', 'Contact C', '3 Client St', 'Clientville', 'CV', '33333', 'Countryland', '321-555-3333'),
('Client 4', 'Contact D', '4 Client St', 'Clientville', 'CV', '44444', 'Countryland', '321-555-4444'),
('Client 5', 'Contact E', '5 Client St', 'Clientville', 'CV', '55555', 'Countryland', '321-555-5555');

-- Insert dummy sales
INSERT INTO Sales (ClientID, EmployeeID, SaleDate, TotalAmount) VALUES
(1, 1, '2023-01-01', 150.00),
(2, 2, '2023-01-02', 200.00),
(3, 3, '2023-01-03', 250.00),
(4, 4, '2023-01-04', 300.00),
(5, 5, '2023-01-05', 350.00);

-- Insert dummy sale details
INSERT INTO SaleDetails (SaleID, StockID, Quantity, Price) VALUES
(1, 1, 5, 10.00),
(1, 2, 5, 15.00),
(2, 2, 10, 15.00),
(2, 3, 5, 20.00),
(3, 3, 10, 20.00),
(3, 4, 5, 25.00),
(4, 4, 10, 25.00),
(4, 5, 5, 30.00),
(5, 1, 10, 10.00),
(5, 5, 10, 30.00);

-- Insert dummy stock suppliers
INSERT INTO StockSuppliers (StockID, SupplierID) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 3),
(3, 4),
(4, 4),
(4, 5),
(5, 5),
(5, 1);
