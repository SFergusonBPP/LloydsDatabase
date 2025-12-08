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

CALL get_customers_by_city('London', 2);


/* ===========================
   Activity 2 – Stock DB
   Procedures, Functions, Views
   =========================== */
USE stock;

-- View: Sales Summary
CREATE VIEW sales_summary AS
SELECT o.order_number, o.order_date, o.customer_id,
       p.product_description, od.quantity, p.price
FROM orders o
JOIN order_details od ON o.order_number = od.order_number
JOIN products p ON od.product_number = p.product_number;

SELECT * from sales_summary;

-- Function: Line Total
DELIMITER //
CREATE FUNCTION line_total (
    prod_num CHAR(8),
    qty INT
) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT COALESCE(price,0) * qty INTO total
    FROM products WHERE product_number = prod_num;
    RETURN total;
END //
DELIMITER ;

SELECT 
    od.order_number,
    od.product_number,
    od.quantity,
    line_total(od.product_number, od.quantity) AS total_value
FROM order_details od;

-- Procedure: Orders by Date
DELIMITER //
CREATE PROCEDURE get_orders_by_date (
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT o.order_number, o.order_date, o.customer_id,
           p.product_description, od.quantity, p.price
    FROM orders o
    JOIN order_details od ON o.order_number = od.order_number
    JOIN products p ON od.product_number = p.product_number
    WHERE o.order_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

call get_orders_by_date(CURDATE() - INTERVAL 2 DAY, CURDATE())

/* ===========================
   Activity 3 – Stock DB
   Indexes
   =========================== */
USE stock;

-- Baseline query
SELECT product_number, product_description, category, price
FROM products
WHERE category = 'Cards';

-- Indexes
CREATE INDEX index_category ON products(category);
CREATE INDEX index_order_product ON order_details(order_number, product_number);
CREATE INDEX index_category_price ON products(category, price);


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
    SELECT order_no, ord_date, customer_id, quantity
    FROM Orders
    WHERE customer_id = cust_id
      AND (min_amount IS NULL OR quantity >= min_amount)
      AND (after_date IS NULL OR ord_date > after_date)
    ORDER BY ord_date;
END //
DELIMITER ;

call get_customer_orders(104, 2, '2015-09-15');

-- Index
CREATE INDEX index_customer_id ON Orders(customer_id);


/* ===========================
   Activity 5 – HR DB
   Views & Functions
   =========================== */
USE hr;

-- View: Employee Names
CREATE VIEW employee_names AS
SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       salary
FROM employees;

SELECT * FROM employee_names;

-- Function: Total Payroll
DELIMITER //
CREATE FUNCTION total_payroll(emp_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(amount) INTO total
    FROM payroll WHERE employee_id = emp_id;
    RETURN total;
END //
DELIMITER ;

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    total_payroll(e.employee_id) AS total_paid
FROM employees e;



-- View: High Earners
CREATE VIEW high_earners AS
SELECT employee_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       salary, department_id
FROM employees
WHERE salary > 50000;

SELECT * from high_earners;

-- Function: Department Salary Totals
DELIMITER //
CREATE FUNCTION dept_salary_total(dept_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(salary) INTO total
    FROM employees WHERE department_id = dept_id;
    RETURN total;
END //
DELIMITER ;

SELECT 
    d.department_id,
    d.department_name,
    dept_salary_total(d.department_id) AS total_salary
FROM departments d;

/* ===========================
   General Practice Tasks
   =========================== */

-- Task 1 – HR DB
use hr;
CREATE VIEW simple_emp AS
SELECT employee_id, first_name, last_name, department_id
FROM employees;

select * from simple_emp;

-- Task 2 – Stock DB
USE stock;

DELIMITER //
CREATE FUNCTION order_total(ord_num INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(od.quantity * p.price)
    INTO total
    FROM order_details od
    JOIN products p ON od.product_number = p.product_number
    WHERE od.order_number = ord_num;

    RETURN IFNULL(total, 0);
END //
DELIMITER ;

SELECT 
    c.customer_id,
    c.surname,
    c.forename,
    SUM(order_total(o.order_number)) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.surname, c.forename;


-- Task 3 – Sales DB
use Sales;

DELIMITER //
CREATE PROCEDURE orders_by_customer (
    IN cust_id INT,
    IN after_date DATE
)
BEGIN
    SELECT order_no, ord_date, customer_id
    FROM Orders
    WHERE customer_id = cust_id
      AND (after_date IS NULL OR ord_date > after_date);
END //
DELIMITER ;

call orders_by_customer(102, '2015-09-15');

-- Task 4 – Stock DB

use stock;
CREATE INDEX idx_category ON products(category);

-- Task 5 – HR DB
use hr;
SELECT en.first_name, en.last_name, dept_salary_total(en.department_id)
FROM simple_emp en

-- Task 6 – Sales DB
use Sales;

CREATE INDEX idx_cust_date ON Orders(customer_id, ord_date);

-- Task 7 – Problem Queries to Fix

-- 1
use stock;
CALL get_orders_by_date('2025-08-15','2025-09-15');

-- 2
use hr;
CREATE FUNCTION total_salary(emp_id INT) RETURNS VARCHAR(50)
BEGIN
   DECLARE result DECIMAL(10,2);
   SELECT SUM(amount) INTO result FROM payroll WHERE employee_id = emp_id;
   RETURN result;
END;
select *, total_salary(e.employee_id) as total_paid
from employees e;

-- 3
use hr;
CREATE VIEW top_earners AS
   SELECT employee_id, first_name, last_name, salary
   FROM employees;

-- 4
use hr;
CREATE INDEX idx_salary ON employees(salary);
-- 5
use stock;
CREATE INDEX idx_customer_id ON orders(customer_id);
CREATE INDEX idx_order_date ON orders(order_date);
CREATE INDEX idx_amount ON orders(order_number);

-- Task 8 – Sales DB (Capstone Challenge)
-- Combine view, function, procedure, and index in one reporting query.
use Sales;
-- Fullnames view
CREATE OR REPLACE VIEW customer_fullname AS
SELECT 
    customer_id,
    customer_name AS full_name
FROM Customer;

--Total Purchases Function
DELIMITER //
CREATE FUNCTION total_purchases(cust_id INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT SUM(quantity) INTO total
    FROM Orders
    WHERE customer_id = cust_id;
    RETURN IFNULL(total, 0);
END //
DELIMITER ;

-- Procedure Orders filtered by date
DELIMITER //
CREATE PROCEDURE orders_by_date (
    IN start_date DATE,
    IN end_date DATE
)
BEGIN
    SELECT o.order_no, o.ord_date, o.customer_id, c.customer_name
    FROM Orders o
    JOIN Customer c ON o.customer_id = c.customer_id
    WHERE o.ord_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

-- indexes
CREATE INDEX idx_orders_customer ON Orders(customer_id);
CREATE INDEX idx_orders_date ON Orders(ord_date);

-- integration
-- Call the procedure to filter orders in November 2015
CALL orders_by_date('2015-11-01', '2015-11-30');

-- Reporting query combining view + function
SELECT 
    v.full_name,
    total_purchases(v.customer_id) AS total_orders
FROM customer_fullname v;