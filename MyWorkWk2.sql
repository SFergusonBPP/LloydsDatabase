-- ==========================================
-- SQL File - Week 2
-- ==========================================
-- Statements
-- Once you have written each SQL statement run that statement only,
-- or comment out each query as you write and test it.


/* ===========================
   Activity 1 – Sales DB
   Stored Procedures with Customers
   =========================== */
-- USE Sales;

-- Task 1: Write a stored procedure that accepts a city parameter to retrieve customers.
-- Task 2: Extend the procedure with a minimum purchase parameter.
-- Extension Task 1: Add sorting options to the procedure.
-- Extension Task 2: Classify customers by grade using CASE.


/* ===========================
   Activity 2 – Stock DB
   Comparing Procedures, Functions, and Views
   =========================== */
-- USE stock;

-- Scenario 1: Create a View joining Orders, Order_Details, and Products.
-- Scenario 2: Create a Function to calculate line totals (quantity * price).
-- Scenario 3: Create a Stored Procedure to return orders between two dates.
-- Extension Task 1: Function to calculate line totals handling NULL values.
-- Extension Task 2: View to classify products into price ranges using CASE.
-- Extension Task 3: Procedure to filter orders placed after a given date.


/* ===========================
   Activity 3 – Stock DB
   Implementing Indexes for Query Performance
   =========================== */
-- USE stock;

-- Task 1: Run a baseline query to retrieve products by category (no index).
-- Task 2: Create an index on the category column in Products.
-- Task 3: Rerun the query and compare performance.
-- Task 4: Evaluate downsides of indexing.
-- Extension Task 1: Create an index on Orders(order_date).
-- Extension Task 2: Create a composite index on Order_Details(order_number, product_number).
-- Extension Task 3: Create a covering index on Products(category, price).


/* ===========================
   Activity 4 – Sales DB
   Advanced SQL Practice with Performance Tuning
   =========================== */
-- USE Sales;

-- Task 1: Create a stored procedure to retrieve orders by customer_id with optional order_amount filter.
-- Task 2: Create an index on Orders(customer_id).
-- Task 3: Extend the procedure to filter orders placed after a given order_date.
-- Task 4: Compare performance before and after indexing.


/* ===========================
   Activity 5 – HR DB
   Hands-on Exercise with Views and Functions
   =========================== */
-- USE hr;

-- Task 1: Create a view concatenating employee first_name and last_name as full_name.
-- Task 2: Write a function to return total payroll payments for an employee.
-- Task 3: Create a view listing employees earning more than 50,000.
-- Task 4: Write a function to return total salary per department.
-- Task 5: Demonstrate how views and functions simplify reporting queries.


/* ===========================
   General Practice Tasks
   =========================== */

-- Task 1 – HR DB: Create a simple view showing employee_id, first_name, last_name, department_id.
-- Task 2 – Stock DB: Write a function returning total order value for a given order_number.
-- Task 3 – Sales DB: Create a stored procedure to retrieve orders by customer_id with optional date filter.
-- Task 4 – Stock DB: Create an index on Products(category) and compare performance.
-- Task 5 – HR DB: Combine a view and a function in a single query.
-- Task 6 – Sales DB: Create a composite index on Orders(customer_id, order_date).
-- Task 7 – HR DB: Diagnose and fix the following problem queries:

-- Problem Query 1:
-- use stock;
-- CALL get_orders();

-- Problem Query 2:
-- use hr;
-- CREATE FUNCTION total_salary(emp_id INT) RETURNS VARCHAR(50)
-- BEGIN
--    DECLARE result DECIMAL(10,2);
--    SELECT SUM(salary) INTO result FROM Employees WHERE employee_id = emp_id;
--    RETURN result;
-- END;

-- Problem Query 3:
-- use hr;
-- CREATE VIEW top_earners AS
-- SELECT employee_id, full_name, salary
-- FROM Staff;

-- Problem Query 4:
-- use hr;
-- CREATE INDEX idx_salary
-- ON Employees(salary);

-- Problem Query 5:
-- use stock;
-- CREATE INDEX idx_customer_id ON Orders(customer_id);
-- CREATE INDEX idx_order_date ON Orders(order_date);
-- CREATE INDEX idx_amount ON Orders(order_amount);

-- Task 8 – Sales DB: Capstone Challenge – Design a reporting query that uses:
--   - A view for customer full names
--   - A function for total purchases
--   - A stored procedure for date filtering
--   - Appropriate indexes for optimisation