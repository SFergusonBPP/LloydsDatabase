/* ===========================
   Activity 1 – Sales DB
   Identify Joins
   =========================== */
USE Sales;

-- Task 1: Retrieve all customers together with the orders they have placed.
-- Reason: INNER JOIN only returns rows where a customer has matching orders.
SELECT c.customer_id, c.customer_name, o.order_no, o.ord_date, o.quantity
FROM Customer c
INNER JOIN Orders o
  ON c.customer_id = o.customer_id;

-- Task 2: Retrieve all customers and their orders, including those customers who have not placed any orders.
-- Reason: LEFT JOIN keeps all customers, even if they have no orders (order fields will be NULL).
SELECT c.customer_id, c.customer_name, o.order_no, o.ord_date, o.quantity
FROM Customer c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id;

-- Task 3: Retrieve all customers who have never placed an order.
-- Reason: LEFT JOIN + WHERE o.order_no IS NULL isolates customers without orders.
SELECT c.customer_id, c.customer_name
FROM Customer c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id
WHERE o.order_no IS NULL;

-- Task 4: Retrieve all orders that do not have a matching customer record.
-- Reason: LEFT JOIN + WHERE c.customer_id IS NULL finds orphaned orders.
-- Note: Cascade delete normally prevents this, but query demonstrates the logic.
SELECT o.order_no, o.ord_date, o.quantity
FROM Orders o
LEFT JOIN Customer c
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


/* ===========================
   Activity 2 – Sales DB
   Create Join Query
   =========================== */
USE Sales;

-- Base Query: Customers with their orders (include customers with no orders).
-- Reason: LEFT JOIN ensures customers with no orders still appear.
SELECT c.customer_name, o.order_no, o.ord_date, o.quantity
FROM Customer c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id;

-- Extension Scenario 1: Add Salesman Information.
-- Reason: Chain another LEFT JOIN to include salesman details, preserving customers with no orders.
SELECT c.customer_name, o.order_no, o.ord_date, o.quantity,
       s.name AS salesman_name, s.commission
FROM Customer c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id
LEFT JOIN Salesman s
  ON o.salesman_id = s.salesman_id;

-- Extension Scenario 2: Aggregate Orders per Customer.
-- Reason: GROUP BY aggregates per customer; COALESCE ensures customers with no orders show 0.
SELECT c.customer_name,
       COALESCE(SUM(o.quantity), 0) AS total_quantity
FROM Customer c
LEFT JOIN Orders o
  ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


/* ===========================
   Activity 3 – Stock DB
   GROUP BY Exploration
   =========================== */
USE Stock;

-- Task: Total and average quantity ordered per product.
-- Reason: LEFT JOIN keeps products with no orders; COALESCE replaces NULL with 0.
SELECT p.product_description,
       COALESCE(SUM(od.quantity), 0) AS total_quantity,
       COALESCE(AVG(od.quantity), 0) AS avg_quantity
FROM Products p
LEFT JOIN Order_Details od
  ON p.product_number = od.product_number
GROUP BY p.product_description;

-- Extension Scenario 1: Sales Value per Product.
-- Reason: Multiplying quantity × price adds financial insight.
SELECT p.product_description,
       COALESCE(SUM(od.quantity), 0) AS total_quantity,
       COALESCE(SUM(od.quantity * p.price), 0) AS total_sales_value
FROM Products p
LEFT JOIN Order_Details od
  ON p.product_number = od.product_number
GROUP BY p.product_description;

-- Extension Scenario 2: Group by Product Category.
-- Reason: Grouping by category changes granularity from product to category.
SELECT p.category,
       COALESCE(SUM(od.quantity), 0) AS total_quantity,
       COALESCE(AVG(od.quantity), 0) AS avg_quantity_per_product
FROM Products p
LEFT JOIN Order_Details od
  ON p.product_number = od.product_number
GROUP BY p.category;


/* ===========================
   Activity 4 – HR DB
   CASE Statement Challenge
   =========================== */
USE HR;

-- Task: Classify employees into salary bands.
-- Reason: CASE ordered from highest to lowest ensures correct classification.
SELECT e.first_name, e.last_name, d.department_name, e.salary,
       CASE
         WHEN e.salary > 50000 THEN 'High'
         WHEN e.salary BETWEEN 30000 AND 50000 THEN 'Medium'
         ELSE 'Low'
       END AS SalaryBand
FROM Employees e
LEFT JOIN Departments d
  ON e.department_id = d.department_id;

-- Extension Task 1: Classify Employees by Hire Date.
-- Reason: DATE_SUB with CURDATE categorises tenure into ranges.
SELECT e.first_name, e.last_name, e.hire_date,
       CASE
         WHEN e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) THEN 'Recent Hire'
         WHEN e.hire_date >= DATE_SUB(CURDATE(), INTERVAL 10 YEAR) THEN 'MidTenure'
         ELSE 'Veteran'
       END AS TenureCategory
FROM Employees e;

-- Extension Task 2: Categorise Project Roles.
-- Reason: CASE maps roles into categories; LEFT JOIN ensures employees with no projects still appear.
SELECT e.first_name, e.last_name, ep.role,
       CASE
         WHEN ep.role IN ('HR Manager','Lead','Senior Architect') THEN 'Leadership'
         WHEN ep.role IN ('Finance Analyst','Database Administrator','Specialist','Coordinator') THEN 'Specialist'
         WHEN ep.role IN ('Recruiter','Software Engineer','Sales Executive','Assistant') THEN 'Contributor'
         ELSE 'Unclassified'
       END AS RoleCategory
FROM Employees e
LEFT JOIN Employee_Projects ep
  ON e.employee_id = ep.employee_id;


/* ===========================
   Activity 5 – HR DB
   Error Detection & Corrections
   =========================== */
USE HR;

-- Query 1
-- Original: SELECT * FROM departments, employees;
-- Error: Cartesian product (no join condition).
-- Correction: Add explicit JOIN on department_id.
SELECT * 
FROM Departments d
JOIN Employees e
  ON d.department_id = e.department_id;

-- Query 2
-- Original: SELECT job_title, SUM(salary) FROM jobs;
-- Error: Jobs table does not contain salary.
-- Correction: Join Jobs to Employees and aggregate salary by job_title.
SELECT j.job_title, SUM(e.salary) AS total_salary
FROM Jobs j
JOIN Employees e
  ON j.job_id = e.job_id
GROUP BY j.job_title;

-- Query 3
-- Original: SELECT department_name, COUNT(*) FROM departments WHERE location = 'London';
-- Error: Missing GROUP BY with COUNT and department_name.
-- Correction: Add GROUP BY department_name.
SELECT department_name, COUNT(*) AS dept_count
FROM Departments
WHERE location = 'London'
GROUP BY department_name;

-- Query 4
-- Original: CASE missing ELSE branch for Medium salaries.
-- Correction: Add ELSE 'Medium' to cover salaries between 30,000 and 50,000.
SELECT first_name,
       CASE
         WHEN salary > 50000 THEN 'High'
         WHEN salary < 30000 THEN 'Low'
         ELSE 'Medium'
       END AS SalaryLevel
FROM Employees;

-- Query 5
-- Original: RIGHT JOIN excludes projects with no employees.
-- Correction: Use LEFT JOIN so all projects appear, even if no employees are assigned.
SELECT p.project_name, ep.role
FROM Projects p
LEFT JOIN Employee_Projects ep
  ON p.project_id = ep.project_id;