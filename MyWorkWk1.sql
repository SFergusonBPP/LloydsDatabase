-- ==========================================
-- SQL File - Week 1
-- ==========================================
-- Statements
-- Once you have written each SQL statement run that statement only,
-- or comment out each query as you write and test it.


/* ===========================
   Activity 1 – Sales DB
   Identify Joins
   =========================== */
-- USE Sales;

-- Task 1: Retrieve all customers together with the orders they have placed.

-- Task 2: Retrieve all customers and their orders, including those customers who have not placed any orders.

-- Task 3: Retrieve all customers who have never placed an order.

-- Task 4: Retrieve all orders that do not have a matching customer record.


/* ===========================
   Activity 2 – Sales DB
   Create Join Query
   =========================== */
-- USE Sales;

-- Base Query: Customers with their orders (include customers with no orders).

-- Extension Scenario 1: Add Salesman Information.

-- Extension Scenario 2: Aggregate Orders per Customer.


/* ===========================
   Activity 3 – Stock DB
   GROUP BY Exploration
   =========================== */
-- USE stock;

-- Task: Total and average quantity ordered per product.

-- Extension Scenario 1: Sales Value per Product.

-- Extension Scenario 2: Group by Product Category.


/* ===========================
   Activity 4 – HR DB
   CASE Statement Challenge
   =========================== */
-- USE hr;

-- Task: Classify employees into salary bands.

-- Extension Task 1: Classify Employees by Hire Date.

-- Extension Task 2: Categorise Project Roles.


/* ===========================
   Activity 5 – HR DB
   Error Detection
   =========================== */
-- USE hr;

-- Query 1 (Broken):
-- SELECT * FROM departments, employees;

-- Query 2 (Broken):
-- SELECT job_title, SUM(salary) FROM jobs;

-- Query 3 (Broken):
-- SELECT department_name, COUNT(*) FROM departments WHERE location = 'London';

-- Query 4 (Broken):
-- SELECT first_name,
-- CASE
--   WHEN salary > 50000 THEN 'High'
--   WHEN salary < 30000 THEN 'Low'
-- END AS SalaryLevel
-- FROM employees;

-- Query 5 (Broken):
-- SELECT project_name, role
-- FROM projects RIGHT JOIN employee_projects
-- ON projects.project_id = employee_projects.project_id;