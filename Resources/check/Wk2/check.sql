-- ==========================================
-- SQL File - Week 2 Answers
-- ==========================================
-- These are baseline solutions for each activity.
-- Trainers can run, demo, and adapt them as needed.


/* ===========================
   Activity 1 – Sales DB
   Stored Procedures with Customers
   =========================== */
USE Sales;

DELIMITER //
CREATE PROCEDURE get_customers_by_city (
    IN city_name VARCHAR(50),
    IN min_amount DECIMAL(10,2)
)
BEGIN
    SELECT c.customer_name, c.city, c.grade
    FROM Customer c
    JOIN Orders o ON c.customer_id = o.customer_id
    WHERE c.city = city_name
      AND (min_amount IS NULL OR o.quantity >= min_amount);
END //
DELIMITER ;

-- CALL get_customers_by_city('London', 200);


/* ===========================
   Activity 2 – Stock DB
   Procedures, Functions, Views
   =========================== */
USE Stock;

-- View: Sales Summary
CREATE VIEW sales_summary AS
SELECT o.order_number, o.order_date, o.customer_id,
       p.product_description, od.quantity, p.price
FROM Orders o
JOIN Order_Details od ON o.order_number = od.order_number
JOIN Products p ON od.product_number = p.product_number;

-- Function: Line Total
DELIMITER //
CREATE FUNCTION line_total (
    prod_num INT,
    qty INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT COALESCE(price,0) * qty INTO total
    FROM Products WHERE product_number = prod_num;
    RETURN total;
END //
DELIMITER ;

-- Procedure: Orders by Date
DELIMITER //
CREATE PROCEDURE get_orders_by_date (
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT o.order_number, o.order_date, o.customer_id,
           p.product_description, od.quantity, p.price
    FROM Orders o
    JOIN Order_Details od ON o.order_number = od.order_number
    JOIN Products p ON od.product_number = p.product_number
    WHERE o.order_date BETWEEN start_date AND end_date;
END //
DELIMITER ;


/* ===========================
   Activity 3 – Stock DB
   Indexes
   =========================== */
USE Stock;

-- Baseline query
SELECT product_number, product_description, category, price
FROM Products
WHERE category = 'Electronics';

-- Indexes
CREATE INDEX index_category ON Products(category);
CREATE INDEX index_order_product ON Order_Details(order_number, product_number);
CREATE INDEX index_category_price ON Products(category, price);


/* ===========================
   Activity 4 – Sales DB
   Performance Tuning
   =========================== */
USE Sales;

DELIMITER //
CREATE PROCEDURE get_customer_orders (
    IN cust_id INT,
    IN min_amount DECIMAL(10,2),
    IN after_date DATE
)
BEGIN
    SELECT order_number, order_date, customer_id, order_amount
    FROM Orders
    WHERE customer_id = cust_id
      AND (min_amount IS NULL OR order_amount >= min_amount)
      AND (after_date IS NULL OR order_date > after_date)
    ORDER BY order_date;
END //
DELIMITER ;

-- Index
CREATE INDEX index_customer_id ON Orders(customer_id);


/* ===========================
   Activity 5 – HR DB
   Views & Functions
   =========================== */
USE HR;

-- View: Employee Names
CREATE VIEW employee_names AS
SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       salary
FROM Employees;

-- Function: Total Payroll
DELIMITER //
CREATE FUNCTION total_payroll(emp_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(amount) INTO total
    FROM Payroll WHERE employee_id = emp_id;
    RETURN total;
END //
DELIMITER ;

-- View: High Earners
CREATE VIEW high_earners AS
SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       salary, department_id
FROM Employees
WHERE salary > 50000;

-- Function: Department Salary Totals
DELIMITER //
CREATE FUNCTION dept_salary_total(dept_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(salary) INTO total
    FROM Employees WHERE department_id = dept_id;
    RETURN total;
END //
DELIMITER ;


/* ===========================
   General Practice Tasks
   =========================== */

-- Task 1 – HR DB
CREATE VIEW simple_emp AS
SELECT employee_id, first_name, last_name, department_id
FROM Employees;

-- Task 2 – Stock DB
DELIMITER //
CREATE FUNCTION order_total(ord_num INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(quantity * price) INTO total
    FROM Order_Details od
    JOIN Products p ON od.product_number = p.product_number
    WHERE od.order_number = ord_num;
    RETURN total;
END //
DELIMITER ;

-- Task 3 – Sales DB
DELIMITER //
CREATE PROCEDURE orders_by_customer (
    IN cust_id INT,
    IN after_date DATE
)
BEGIN
    SELECT order_number, order_date, customer_id
    FROM Orders
    WHERE customer_id = cust_id
      AND (after_date IS NULL OR order_date > after_date);
END //
DELIMITER ;

-- Task 4 – Stock DB
CREATE INDEX idx_category ON Products(category);

-- Task 5 – HR DB
SELECT e.full_name, dept_salary_total(e.department_id)
FROM employee_names e;

-- Task 6 – Sales DB
CREATE INDEX idx_cust_date ON Orders(customer_id, order_date);

-- Task 7 – HR DB (Problem Queries to Fix)

CALL get_orders();
CREATE FUNCTION total_salary(emp_id INT) RETURNS VARCHAR(50) BEGIN ... END;
CREATE VIEW high_earners AS SELECT employee_id, full_name, salary FROM Staff;
CREATE INDEX idx_salary ON Employees(salary);
CREATE INDEX idx_customer_id ON Orders(customer_id);
CREATE INDEX idx_order_date ON Orders(order_date);
CREATE INDEX idx_amount ON Orders(order_amount);

-- Task 8 – Sales DB (Capstone Challenge)
-- Combine view, function, procedure, and index in one reporting query.
SELECT c.customer_id, c.customer_name,
       total_payroll(c.customer_id) AS total_purchases
FROM Customer c
JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_date > '2024-01-01';