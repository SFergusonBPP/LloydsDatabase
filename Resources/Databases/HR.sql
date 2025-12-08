-- Drop and recreate database
DROP DATABASE IF EXISTS hr;
CREATE DATABASE hr;
USE hr;

-- Departments
CREATE TABLE departments (
    department_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
) AUTO_INCREMENT = 10;

-- Jobs
CREATE TABLE jobs (
    job_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(50) NOT NULL,
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2)
) AUTO_INCREMENT = 100;

-- Employees
CREATE TABLE employees (
    employee_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    salary DECIMAL(10,2),
    department_id INT UNSIGNED,
    job_id INT UNSIGNED,
    hire_date DATE,
    CONSTRAINT fk_emp_dept FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES jobs(job_id)
) AUTO_INCREMENT = 1000;

-- Projects
CREATE TABLE projects (
    project_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    department_id INT UNSIGNED,
    CONSTRAINT fk_proj_dept FOREIGN KEY (department_id) REFERENCES departments(department_id)
) AUTO_INCREMENT = 200;

-- Employee_Projects (junction table)
CREATE TABLE employee_projects (
    employee_id INT UNSIGNED,
    project_id INT UNSIGNED,
    role VARCHAR(50),
    PRIMARY KEY (employee_id, project_id),
    CONSTRAINT fk_ep_emp FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    CONSTRAINT fk_ep_proj FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert Departments
INSERT INTO departments (department_name, location) VALUES
('HR', 'London'),
('Finance', 'Manchester'),
('IT', 'Birmingham'),
('Sales', 'Leeds');

-- Insert Jobs
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES
('HR Manager', 40000, 60000),
('Recruiter', 25000, 40000),
('Software Engineer', 30000, 70000),
('Database Administrator', 35000, 65000),
('Sales Executive', 20000, 50000),
('Finance Analyst', 28000, 55000),
('Senior Finance Analyst', 40000, 60000),
('Lead Software Engineer', 60000, 80000),
('Sales Assistant', 25000, 35000),
('Database Specialist', 30000, 50000),
('HR Coordinator', 25000, 40000);

-- Insert Employees
INSERT INTO employees (first_name, last_name, salary, department_id, job_id, hire_date) VALUES
('Alice', 'Smith', 55000, 10, 100, DATE_SUB(CURDATE(), INTERVAL '15-5' YEAR_MONTH)),
('George', 'White', 72000, 12, 102, DATE_SUB(CURDATE(), INTERVAL 14 YEAR)),
('Jack', 'Wilson', 52000, 11, 107, DATE_SUB(CURDATE(), INTERVAL '12-6' YEAR_MONTH)),
('Diana', 'Prince', 62000, 12, 102, DATE_SUB(CURDATE(), INTERVAL 10 YEAR)),
('Charlie', 'Brown', 48000, 11, 105, DATE_SUB(CURDATE(), INTERVAL '8-3' YEAR_MONTH)),
('Hannah', 'Black', 41000, 11, 105, DATE_SUB(CURDATE(), INTERVAL '6-9' YEAR_MONTH)),
('Karen', 'Davies', 45000, 12, 108, DATE_SUB(CURDATE(), INTERVAL 5 YEAR)),
('Ethan', 'Hunt', 35000, 12, 103, DATE_SUB(CURDATE(), INTERVAL '3-6' YEAR_MONTH)),
('Bob', 'Jones', 27000, 10, 101, DATE_SUB(CURDATE(), INTERVAL '2-9' YEAR_MONTH)),
('Fiona', 'Green', 29000, 13, 104, DATE_SUB(CURDATE(), INTERVAL 2 YEAR)),
('Liam', 'Evans', 28000, 10, 109, DATE_SUB(CURDATE(), INTERVAL '1-3' YEAR_MONTH)),
('Isla', 'Taylor', 31000, 13, 106, DATE_SUB(CURDATE(), INTERVAL 9 MONTH)),
('Maya', 'Patel', 64000, 12, 110, DATE_SUB(CURDATE(), INTERVAL 4 MONTH));


-- Insert Projects
INSERT INTO projects (project_name, department_id) VALUES
('Recruitment Drive', 10),
('Annual Budget Review', 11),
('System Upgrade', 12),
('Client Outreach', 13),
('Database Migration Project', 12);

-- Corrected Employee_Projects inserts
INSERT INTO employee_projects (employee_id, project_id, role) VALUES
-- HR Department: Recruitment Drive
(1000, 200, 'HR Manager'),
(1008, 200, 'Recruiter'),
(1012, 200, 'Coordinator'),
-- Finance Department: Annual Budget Review
(1004, 201, 'Finance Analyst'),
(1005, 201, 'Finance Analyst'),
(1011, 201, 'Lead'),
-- IT Department: System Upgrade
(1003, 202, 'Software Engineer'),
(1007, 202, 'Database Administrator'),
(1001, 202, 'Software Engineer'),
-- Sales Department: Client Outreach
(1009, 203, 'Sales Executive'),
(1006, 203, 'Assistant'),
-- IT Department: Database Migration
(1010, 204, 'Specialist'),
(1002, 204, 'Senior Architect');

-- Payroll Table
CREATE TABLE payroll (
    payroll_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNSIGNED NOT NULL,
    pay_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    pay_type VARCHAR(20), -- e.g. 'Salary', 'Bonus', 'Overtime'
    CONSTRAINT fk_payroll_employee FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
) AUTO_INCREMENT = 5000;

DELIMITER //

DELIMITER //

CREATE FUNCTION last_working_day(year INT, month INT)
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE d DATE;

    -- Get the last day of the given month
    SET d = LAST_DAY(MAKEDATE(year, 1) + INTERVAL (month-1) MONTH);

    -- Adjust if weekend
    IF DAYOFWEEK(d) = 7 THEN
        SET d = d - INTERVAL 1 DAY;   -- Saturday → Friday
    ELSEIF DAYOFWEEK(d) = 1 THEN
        SET d = d - INTERVAL 2 DAY;   -- Sunday → Friday
    END IF;

    RETURN d;
END //

DELIMITER ;

INSERT INTO payroll (employee_id, pay_date, amount, pay_type)
SELECT e.employee_id,
       last_working_day(YEAR(CURDATE() - INTERVAL n MONTH), MONTH(CURDATE() - INTERVAL n MONTH)) AS pay_date,
       e.salary / 12 AS amount,
       'Salary'
FROM employees e
JOIN (SELECT 0 AS n UNION SELECT 1 UNION SELECT 2) months;
INSERT INTO payroll (employee_id, pay_date, amount, pay_type)
SELECT e.employee_id,
       last_working_day(YEAR(CURDATE() - INTERVAL 0 MONTH), MONTH(CURDATE() - INTERVAL 0 MONTH)) AS pay_date,
       (e.salary / 12) / 2 AS amount,
       'Bonus'
FROM employees e
WHERE e.first_name IN ('Hannah','Diana','Fiona','Isla');