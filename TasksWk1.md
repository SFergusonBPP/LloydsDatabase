[Intro](./README.md) | [Getting Started](./Getting%20Started.md) | [Tasks Wk1](./TasksWk1.md) | [Tasks Wk2](./TasksWk2.md) | [SQL Basics](./sqlbasics.md)

# Database, Development & Security 1 – Joins

## Setup

Before starting the activities, you need to make sure the correct databases are available.  
The SQL scripts for each database are located in **Resources > Databases**.

- **Sales.sql** → Run this script to create and populate the **Sales** database.  
  - Required for **Activity 1** (Identify Joins) and **Activity 2** (Create Join Query).

- **Stock.sql** → Run this script to create and populate the **Stock** database.  
  - Required for **Activity 3** (GROUP BY Exploration).

- **HR.sql** → Run this script to create and populate the **HR** database.  
  - Required for **Activity 4** (CASE Statement Challenge) and **Activity 5** (Error Detection).

⚠️ **Important:**  
- Run each script only once to set up the databases.  
- Switch to the correct database before starting each activity using `USE Sales;`, `USE Stock;`, or `USE HR;`.  
- All tasks in this module assume these databases are already created and populated.

<br/>

---

## Activity 1: Identify Joins (Sales Dataset)

### Dataset
- **Customer**: `customer_id`, `customer_name`, `city`, `grade`
- **Orders**: `order_no`, `quantity`, `ord_date`, `customer_id`, `salesman_id`
- **Salesman**: `salesman_id`, `name`, `city`, `commission`

### Tasks
1. Retrieve all customers together with the orders they have placed.  
2. Retrieve all customers and their orders, including those customers who have not placed any orders.  
3. Retrieve all customers who have never placed an order.  
4. Retrieve all orders that do not have a matching customer record.  

### Instructions
- **Write:** a query for each task using the appropriate join type.  
- **Validate:** that your query produces the expected results against the dataset.  
- **Reason:** explain why you chose that join type for the scenario.  
- **Share:** be prepared to discuss your answers with the class.  

<br/>

---

## Activity 2: Create a join query

### Dataset
- **Customer**: `customer_id`, `customer_name`, `city`, `grade`
- **Orders**: `order_no`, `quantity`, `ord_date`, `customer_id`, `salesman_id`
- **Salesman**: `salesman_id`, `name`, `city`, `commission`

### Scenario
You want to produce a report showing each customer’s name alongside the orders they have placed.

- **Include:** order number, order date, and quantity.
- **Requirement:** customers with no orders must still be listed (with `NULL` values for order details).
- **Collaboration:** compare your query with a partner’s to see whether you used `INNER JOIN` or `LEFT JOIN`.
- **Discussion:** explain why you chose your join type and what differences you notice compared to your partner’s query.

### Starter query structure (fill in the blanks)
```sql
SELECT <table1>.<column>, <table2>.<column>, ...
FROM <table1> AS <alias1>
<JOIN_TYPE> JOIN <table2> AS <alias2>
    ON <alias1>.<key_column> = <alias2>.<key_column>;
```

### Instructions
- **Write:** your query and ensure it runs against the provided dataset.  
- **Validate:** that customers without orders still appear with `NULL` order fields.  
- **Reason:** note down why your chosen join type fits the scenario.  
- **Share:** be prepared to discuss your approach and differences in results with the class.  

### Extension Scenario 1: Add Salesman Information

#### Scenario
You want to produce a report showing each customer’s name, their orders, and the salesman’s name and commission who handled the order.

- **Include:** customer name, order number, order date, quantity, salesman name, commission.  
- **Requirement:** customers with no orders must still be listed (with `NULL` values for order and salesman details).  
- **Collaboration:** compare your query with a partner’s to see how you both chained multiple joins.  
- **Discussion:** explain your usage of multiple `JOIN`s and why you chose `LEFT JOIN` to preserve customers without orders.

### Extension Scenario 2: Aggregate Orders per Customer

#### Scenario
You want to generate a summary report showing each customer’s name and the total quantity of orders placed.

- **Include:** customer name, total quantity ordered.  
- **Requirement:** customers with no orders should still appear with `0` as their total.  
  - **Tip:** use `COALESCE` to convert `NULL` values into `0` when calculating totals.  
- **Collaboration:** compare your query with a partner’s to see how you both handled aggregation.  
- **Discussion:** explain your usage of `GROUP BY` and how aggregation changes your dataset compared to listing individual orders.

<br/>

---

## Activity 3: GROUP BY Exploration  

### Dataset  
- **Products**: `product_number`, `product_description`, `category`, `price`  
- **Order_Details**: `order_number`, `product_number`, `quantity`  
- **Orders**: `order_number`, `order_date`, `customer_id`  

### Scenario  
You want to produce a summary report showing the total and average quantity ordered for each product.  

- **Include:** product description, total quantity ordered, and average quantity ordered.  
- **Requirement:** products with no orders must still appear (with `NULL` or `0` values for totals).  
- **Collaboration:** compare your query with a partner’s to see how your approaches differ.  
- **Discussion:** explain why you structured your query the way you did and what differences you notice compared to your partner’s results.  

### Starter query structure (fill in the blanks)  
```sql
SELECT <table1>.<column>, SUM(<table2>.<column>), AVG(<table2>.<column>)
FROM <table1> AS <alias1>
JOIN <table2> AS <alias2>
    ON <alias1>.<key_column> = <alias2>.<key_column>
GROUP BY <table1>.<column>;
```

### Instructions
- **Write:** your query and ensure it runs against the provided dataset.  
- **Validate:** that products without orders still appear with `NULL` or `0` values.  
- **Reason:** note down why your chosen query structure fits the scenario.  
- **Share:** be prepared to discuss your approach and differences in results with the class.  


### Extension Scenario 1: Calculate Sales Value per Product  

#### Scenario  
You want to produce a report showing each product’s description, the total quantity ordered, and the total sales value (quantity × price).  

- **Include:** product description, total quantity ordered, total sales value.  
- **Requirement:** products with no orders must still be listed (with `NULL` or `0` values for totals).  
- **Collaboration:** compare your query with a partner’s to see how you both calculated the sales value.  
- **Discussion:** explain how multiplying `order_details.quantity` by `products.price` changes the insight compared to just counting quantities.  

### Extension Scenario 2: Group by Product Category  

#### Scenario  
You want to generate a summary report showing each product category, the total quantity ordered, and the average quantity per product in that category.  

- **Include:** product category, total quantity ordered, average quantity ordered.  
- **Requirement:** categories with no orders should still appear (with `NULL` or `0` values).  
- **Collaboration:** compare your query with a partner’s to see how you both handled grouping by multiple columns.  
- **Discussion:** explain how adding `products.category` to the `GROUP BY` clause changes the granularity of your summary.  

<br/>

---

## Activity 4: CASE Statement Challenge  

### Dataset  
- **Departments**: `department_id`, `department_name`, `location`  
- **Jobs**: `job_id`, `job_title`, `min_salary`, `max_salary`  
- **Employees**: `employee_id`, `first_name`, `last_name`, `salary`, `department_id`, `job_id`, `hire_date`  
- **Projects**: `project_id`, `project_name`, `department_id`  
- **Employee_Projects**: `employee_id`, `project_id`, `role`  

### Scenario  
You want to produce a report that classifies employees into salary bands using a `CASE` statement.  

- **Classification Rules:**  
  - **High**: Salary > £50,000  
  - **Medium**: £30,000 – £50,000  
  - **Low**: Salary < £30,000  

- **Include:** employee name, department name, salary, and classification.  
- **Requirement:** ensure all employees are included, regardless of department or job role.  
- **Collaboration:** compare your query with a partner’s—did you both structure the `CASE` logic the same way?  
- **Discussion:** explain why you placed conditions in a particular order and how SQL evaluates them.  

### Starter query structure (fill in the blanks)  
```sql
SELECT <alias1>.<column1>,
       <alias2>.<column2>,
       <alias1>.<column3>,
       CASE
           WHEN <alias1>.<column3> <comparison_operator> <value> THEN <classification1>
           ELSE <classification2>
       END AS <classification_column>
FROM <table1> AS <alias1>
<join_type> <table2> AS <alias2>
    ON <alias1>.<key_column> = <alias2>.<key_column>
ORDER BY <alias1>.<columnX> <sort_direction>;
```

### Instructions  
- **Write:** your query using the dataset provided, ensuring it includes employee name, department name, salary, and a `CASE` statement for classification.  
- **Validate:** check that all employees appear in the results, even if they are not linked to a department or job role.  
- **Reason:** note down why you structured your `CASE` conditions in the order you did, and how SQL evaluates them.  
- **Share:** be prepared to compare your query with a partner’s, discussing differences in condition order, join choices, and the resulting classifications.  

### Extension Task 1: Classify Employees by Hire Date  

#### Scenario  
You want to produce a report that categorises employees based on when they joined the company. Use a `CASE` statement to group them into tenure categories.  

- **Classification Rules:**  
  - **Recent Hire**: Hire date within the last 2 years  
  - **Mid‑Tenure**: Hire date between 2 and 10 years ago  
  - **Veteran**: Hire date more than 10 years ago  

- **Include:** employee name, hire date, and classification.  
- **Requirement:** all employees must appear, even if their hire date is missing.  
- **Collaboration:** compare your query with a partner’s to see how you both structured the `CASE` logic.  
- **Discussion:** explain why you ordered your conditions in a particular way and how SQL evaluates them.  

### Extension Task 2: Categorise Project Roles with CASE  

#### Scenario  
You want to produce a report that classifies employees based on their project role. Use a `CASE` statement to group roles into categories.  

- **Classification Rules:**  
  - **Leadership**: HR Manager, Lead, Senior Architect  
  - **Specialist**: Finance Analyst, Database Administrator, Specialist, Coordinator  
  - **Contributor**: Recruiter, Software Engineer, Sales Executive, Assistant  

- **Include:** employee name, project role, and classification.  
- **Requirement:** employees with no projects must still be listed, with appropriate classification logic applied.  
- **Collaboration:** compare your query with a partner’s to see how you both defined role categories.  
- **Discussion:** explain how combining role data with `CASE` changes the complexity of the query and why condition order matters.  

<br/>

---

## Activity 5: Error Detection (Company Dataset)

### Dataset  
- **Departments**: `department_id`, `department_name`, `location`  
- **Jobs**: `job_id`, `job_title`, `min_salary`, `max_salary`  
- **Employees**: `employee_id`, `first_name`, `last_name`, `salary`, `department_id`, `job_id`, `hire_date`  
- **Projects**: `project_id`, `project_name`, `department_id`  
- **Employee_Projects**: `employee_id`, `project_id`, `role`  

### Tasks
 - **Examine** each of the following SQL queries carefully. 
 - **Identify** any mistakes and suggest corrections.

1. ```sql 
   SELECT * FROM departments, employees; 
   ```
2. ```sql 
   SELECT job_title, SUM(salary) FROM jobs; 
   ```
3. ```sql 
   SELECT department_name, COUNT(*) FROM departments WHERE location = 'London';
   ```
4. ```sql
   SELECT first_name, 
   CASE 
      WHEN salary > 50000 THEN 'High'
      WHEN salary < 30000 THEN 'Low'
   END AS SalaryLevel
   FROM employees;
   ```
5. ```sql
   SELECT project_name, role 
   FROM projects RIGHT JOIN employee_projects 
   ON projects.project_id = employee_projects.project_id; 
   ```

### Instructions 
- **Write:** note down the errors you find in each query.
- **Correct:** suggest how the query should be amended to work properly.
- **Validate:** test your corrected queries against the dataset.
- **Reason:** explain why the original query failed and how your correction fixes it.
- **Share:** compare your findings with a partner and discuss differences in your approaches.