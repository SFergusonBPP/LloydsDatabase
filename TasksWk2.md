[Intro](./README.md) | [Getting Started](./Getting%20Started.md) | [Tasks Wk1](./TasksWk1.md) | [Tasks Wk2](./TasksWk2.md) | [SQL Basics](./sqlbasics.md)

# Database, Development & Security 2 – Stored Procedures

## Setup

Before starting the activities, you need to make sure the correct databases are available.  
The SQL scripts for each database are located in **Resources > Databases**.

- **Sales.sql** → Run this script to create and populate the **Sales** database.  
  - Required for **Activity 1** (Stored Procedures with Customers) and **Activity 4** (Stored Procedures with Orders).

- **Stock.sql** → Run this script to create and populate the **Stock** database.  
  - Required for **Activity 2** (Views, Functions, and Procedures with Products/Suppliers) and **Activity 3** (Indexes with Customers/Products).

- **HR.sql** → Run this script to create and populate the **HR** database.  
  - Required for **Activity 5** (Views and Functions with Employees).

⚠️ **Important:**  
- Run each script only once to set up the databases.  
- Switch to the correct database before starting each activity using `USE Sales;`, `USE Stock;`, or `USE HR;`.  
- All tasks in this module assume these databases are already created and populated.

<br/>

---

---

## Activity 1: Creating and Using Stored Procedures

### Objective
Understand how to create stored procedures and apply them to automate common tasks.

### Dataset
- **Customer:** `customer_id`, `customer_name`, `city`, `grade`
- **Orders:** `order_no`, `quantity`, `ord_date`, `customer_id`, `salesman_id`
- **Salesman:** `salesman_id`, `name`, `city`, `commission`

### Scenario
You are working with the **Sales dataset**.  
You want to automate retrieving customers from a given city, then extend the logic to support an additional filter for purchase amount. The goal is to design a reusable stored procedure that accepts parameters and can be adapted as requirements evolve.

- **Include:** customer details relevant to filtering (e.g., `customer_name`, `city`, `grade`)  
- **Requirement:** the city name must be passed dynamically as a parameter  
- **Extension:** add a second parameter to filter customers who have made purchases over a specified amount  
- **Collaboration:** compare procedure designs with a partner and discuss parameter handling  
- **Discussion:** explain how stored procedures improve consistency, reusability, and performance management  

### Starter query structure (fill in the blanks)  
```sql
DELIMITER //
CREATE PROCEDURE <procedure_name>(
    IN <parameter_name> <datatype>

)
BEGIN
    SELECT <alias1>.<column1>,
           <alias1>.<column2>,
           <alias1>.<column3>
    FROM <table1> AS <alias1>
    WHERE <alias1>.<columnX> = <parameter_value>
    ORDER BY <alias1>.<columnY> <sort_direction>;
END //
DELIMITER ;

-- Example call (adjust parameter as needed)
-- CALL <procedure_name>('<parameter_value>');
```

### Instructions
- **Write:** a stored procedure that accepts a city parameter, then extend it with a minimum purchase parameter  
- **Validate:** call the procedure with different cities and amounts to confirm expected results  
- **Reason:** note why parameters make the procedure reusable and how they affect query safety and clarity.  
  Reflect on how stored procedures improve consistency, reusability, and performance management compared to writing queries repeatedly.  
- **Share:** be ready to demo your procedure and explain how you handled parameters.  
  Discuss with your partner the differences in your approaches and the impact of design choices (e.g., naming, defaults, result shape).  

### Extension Task 1: Add Sorting Options to the Procedure

#### Scenario
You want to extend your stored procedure so that users can decide how the results are ordered. This introduces flexibility in presentation and requires handling an extra input for sorting.

- **Include:** customer name, city, and total purchase amount.  
- **Requirement:** allow a parameter that specifies which column to sort by (e.g., name, city, amount).  
- **Collaboration:** compare your procedure with a partner’s to see how you both handled dynamic sorting.  
- **Discussion:** explain the challenges of allowing flexible ordering and how SQL evaluates `ORDER BY` with parameters.  

---

### Extension Task 2: Classify Customers by Grade

#### Scenario
You want to produce a report that categorises customers based on their grade value. Use a `CASE` statement to group them into grade categories.

- **Classification Rules:**  
  - **Premium**: grade ≥ 300  
  - **Standard**: grade between 200 and 299  
  - **Basic**: grade ≤ 199  

- **Include:** customer name, city, grade, and classification.  
- **Requirement:** all customers must appear, even if their grade is missing (handle `NULL` values appropriately).  
- **Collaboration:** compare your query with a partner’s to see how you both structured the `CASE` logic.  
- **Discussion:** explain why you ordered your conditions in a particular way and how SQL evaluates them.  

<br/>

---

## Activity 2: Comparing Stored Procedures, Functions and Views

### Objective
- Understand the differences between **Stored Procedures**, **Functions**, and **Views** in SQL.  
- Practice creating, executing, and comparing them in terms of **use cases, return types, and flexibility**.  
- Evaluate when each should be used in real-world database design.

### Dataset  
- **Products**: `product_number`, `product_description`, `category`, `price`  
- **Order_Details**: `order_number`, `product_number`, `quantity`  
- **Orders**: `order_number`, `order_date`, `customer_id`

### Scenario
You are working as a **database developer** for a retail company.  
Management wants reusable queries to simplify reporting on product sales, while analysts need quick ways to calculate totals and trends.  

- The **Products** table provides details about each item, including category and price.  
- The **Order_Details** table links products to orders with quantities purchased.  
- The **Orders** table tracks when each order was placed and by which customer.  

Your task is to decide whether to use a **Stored Procedure**, a **Function**, or a **View** to meet different reporting and automation needs.  

You will then compare their outputs and limitations to determine which is most effective for:  
- Generating product sales summaries  
- Calculating totals or discounts  
- Automating order-based reporting

### Instructions

#### Scenario 1: Sales Summary View
**Context:**  
Analysts want a quick way to see what customers ordered, without writing long queries each time.  

**Include:**  
- Join `Orders`, `Order_Details`, and `Products`.  
- Show: `order_number`, `order_date`, `customer_id`, `product_description`, `quantity`, `price`.  

**Requirements:**  
- Create a **View** that combines these tables.  
- Make sure it can be queried like a table for reporting.

#### Scenario 2: Line Total Function
**Context:**  
Developers often need to calculate the cost of each product line in an order.  

**Include:**  
- Inputs: `product_number`, `quantity`.  
- Logic: Multiply `quantity * price`.  

**Requirements:**  
- Create a **Function** that returns the line total.  
- Ensure it can be reused inside other queries.

#### Scenario 3: Orders by Date Procedure
**Context:**  
Managers want to see all orders placed between two dates, without writing queries themselves.  

**Include:**  
- Inputs: `@StartDate`, `@EndDate`.  
- Output: List of orders with details.  

**Requirements:**  
- Create a **Stored Procedure** that accepts date parameters.  
- Return all matching orders with their products and totals.

#### Deliberation, Collaboration, and Discussion
- **Deliberation:** Compare what each object returns (table, single value, dataset).  
- **Collaboration:** Work in pairs to test each object and share how easy it was to use.  
- **Discussion:**  
  - When is a View better than a Function?  
  - Why is a Stored Procedure useful for automation?  
  - Can you think of a time to use them together (e.g., a procedure that calls a view)?

### Starter query structures (fill in the blanks)

#### Creating and using a view
```sql
CREATE VIEW <view_name> AS
[select statement goes here];

-- Example use
SELECT * FROM <view_name>;
```

#### Creating and using a function
```sql

DELIMITER //
CREATE FUNCTION <function_name> (
    <parameter_name> <datatype>
)
RETURNS <datatype>
DETERMINISTIC
BEGIN
    DECLARE <result> <datatype>;

    [select statement goes here]

    RETURN <result>;
END //
DELIMITER ;

-- Example use
SELECT <function_name>(<parameter_value>) AS <calculated_value>;
```
#### Creating and using a Procedure
```sql
DELIMITER //
CREATE PROCEDURE <procedure_name> (
    IN <parameter_name> <datatype>
)
BEGIN
    [select statement goes here]
END //
DELIMITER ;

-- Example call (adjust parameter as needed)
CALL <procedure_name>(<parameter_value>);
```

### Extension Task 1: Calculate Line Totals in Orders (Function)

#### Scenario
You need to produce a **Function** that calculates the total cost for each product line in an order.  
The calculation should multiply `quantity * price`.

- **Include:** order number, product description, quantity, price, and line total.  
- **Requirement:** ensure the calculation works even if some products have a `NULL` price (handle missing values gracefully).  
- **Collaboration:** compare your function with a partner’s to see how you handled `NULL` values.  
- **Discussion:** explain why you chose to use `COALESCE` or another method to deal with missing prices.  

### Extension Task 2: Classify Products by Price Range (View)

#### Scenario
You need to produce a **View** that categorises products into price bands for reporting.  
Use a `CASE` statement to group them into categories.

- **Classification Rules:**  
  - **High Value**: price ≥ 100  
  - **Mid Range**: price between 50 and 99  
  - **Low Value**: price ≤ 49  

- **Include:** product number, product description, price, and classification.  
- **Requirement:** all products must appear, even if their price is missing (handle `NULL` values appropriately).  
- **Collaboration:** compare your view with a partner’s to see how you structured the `CASE` logic.  
- **Discussion:** explain how SQL evaluates `CASE` conditions and why the order of conditions matters.  

### Extension Task 3: Filter Orders by Date (Procedure)

#### Scenario
You need to produce a **Stored Procedure** that accepts a date parameter and returns all orders placed after that date.

- **Include:** order number, order date, customer ID.  
- **Requirement:** results must be sorted by `order_date` in ascending order.  
- **Collaboration:** run your procedure with different dates and compare outputs with a partner.  
- **Discussion:** explain why procedures are useful for non‑technical users compared to writing queries directly.  

<br/>

---

## Activity 3: Implementing Indexes for Query Performance

### Objective
Practice creating indexes in the Stock database and understand how they improve query performance.

### Dataset
- **Products**: `product_number`, `product_description`, `category`, `price`  
- **Order_Details**: `order_number`, `product_number`, `quantity`  
- **Orders**: `order_number`, `order_date`, `customer_id`  

### Scenario
The warehouse team frequently runs queries to find products by category.  
Currently, the `Products` table has no index on the `category` column, which makes queries slower as the table grows.  
You have been asked to improve query performance by implementing an index.

### Instructions
1. **Baseline Query (No Index)**  
   - Run a query to retrieve all products in a specific category (e.g., `'Electronics'`).  
   - Observe how long the query takes or check the execution plan.  

2. **Create an Index**  
   - Add an index on the `category` column in the `Products` table.  

3. **Rerun the Query**  
   - Run the same query again.  
   - Compare the performance with and without the index.  

4. **Evaluate Downsides**  
   - Discuss potential drawbacks of indexing, such as:  
     - Slower `INSERT` or `UPDATE` operations.  
     - Extra storage space required.  

#### Collaboration
- Work with a partner to compare query execution times before and after indexing.  
- Share how you measured performance (e.g., query time, execution plan).  

#### Discussion
- Why did the index improve performance for the `WHERE category = 'Electronics'` query?  
- What trade‑offs exist when adding too many indexes?  
- How would you decide which columns deserve an index in a real database?

### Starter query structures (fill in the blanks)

```sql
CREATE INDEX index_category
ON table1(category);
```

### Extension Task 1: Speed Up Order Lookups (Index on Orders)

#### Scenario
The sales team frequently runs queries to find all orders placed on a specific date.  
Currently, the `Orders` table has no index on the `order_date` column, which makes queries slower as the table grows.  
You need to improve performance by indexing this column.

- **Include:** order_number, order_date, customer_id  
- **Requirement:** compare query performance before and after adding the index.  
- **Collaboration:** share with a partner how you measured performance (execution plan vs. query time).  
- **Discussion:** explain why indexing `order_date` is useful for reporting and what trade‑offs it introduces.  

### Extension Task 2: Optimise Product Sales Queries (Composite Index)

#### Scenario
Managers often run queries to see how many units of each product were sold.  
These queries join `Order_Details` with `Products` using `product_number`.  
Currently, there is no composite index to support this join efficiently.

- **Include:** product_number, product_description, quantity  
- **Requirement:** create a composite index on `Order_Details(order_number, product_number)` and compare performance.  
- **Collaboration:** compare your query plan with a partner’s and discuss how the composite index changes execution.  
- **Discussion:** explain why composite indexes can be more efficient than single‑column indexes in join queries.  

### Extension Task 3: Index for Category and Price Filtering (Covering Index)

#### Scenario
The warehouse team often filters products by both `category` and `price`.  
Currently, queries scan the entire `Products` table.  
You need to create a covering index to improve performance.

- **Include:** product_number, product_description, category, price  
- **Requirement:** create an index on `(category, price)` and rerun the query to compare performance.  
- **Collaboration:** test queries with different categories and price ranges, then compare results with a partner.  
- **Discussion:** explain how covering indexes reduce table lookups and when they are most beneficial.  

<br/>

---

## Activity 4: Advanced SQL Practice with Performance Tuning

### Objective
Solidify advanced SQL concepts by focusing on optimizing query performance through indexing and stored procedures in the Sales database.

### Dataset
- **Customers**: `customer_id`, `customer_name`, `city`  
- **Orders**: `order_number`, `order_date`, `customer_id`, `order_amount`  
- **Order_Details**: `order_number`, `product_number`, `quantity`, `price`  

### Tasks
1. **Stored Procedure for Customer Orders**  
   - Create a stored procedure to retrieve all orders for a given `customer_id`.  
   - Add an optional filter for `order_amount` (e.g., greater than a specified value).  

2. **Index on CustomerID**  
   - Create an index on the `customer_id` column in the `Orders` table.  
   - Compare query performance before and after the index is applied.  

3. **Stored Procedure with Date Filtering**  
   - Extend the stored procedure to also filter orders placed after a given `order_date`.  
   - Test how the index interacts with multiple filter conditions.  

4. **Performance Comparison and Reflection**  
   - Run the stored procedure with and without the index.  
   - Record execution times or query plans.  
   - Reflect on trade‑offs: faster reads vs. slower writes, storage overhead.  

### Instructions

#### Write
- Write the SQL code for your stored procedure(s) and index creation.  
- Use placeholders like `<procedure_name>`, `<parameter_name>`, and `<datatype>` to keep your code generic and reusable.  

#### Validate
- Run your stored procedure before and after creating the index.  
- Check that results are correct and consistent.  
- Use `EXPLAIN` or query plans to validate that the index is being used.  

#### Reason
- Reflect on why the index improved performance.  
- Consider what happens when multiple filters (`customer_id`, `order_amount`, `order_date`) are applied.  
- Discuss trade‑offs of indexing: improved reads vs. slower inserts/updates.  

#### Share
- Compare your stored procedure and indexing approach with a partner.  
- Share how you validated performance improvements.  
- Discuss alternative indexing strategies (e.g., composite indexes) and when they might be useful.  

<br/>

---

## Activity 5: Hands-on Exercise with Views and Functions

### Objective
Practice creating and utilizing views and functions in the HR database to support data abstraction, reusable logic, and more readable queries.

---

### Dataset
- **Employees**: `employee_id`, `first_name`, `last_name`, `department_id`, `salary`  
- **Departments**: `department_id`, `department_name`  
- **Payroll**: `employee_id`, `payment_date`, `amount`  

---

### Tasks
1. **Concatenate Employee Names (View)**  
   - Create a view that displays `employee_id`, `full_name` (concatenation of `first_name` and `last_name`), and `salary`.  

2. **Function for Total Payroll Payments**  
   - Write a function that, given an `employee_id`, returns the total payroll payments for that employee.  

3. **View for High Earners**  
   - Create a view that lists employees who earn more than 50,000.  
   - Include `employee_id`, `full_name`, `salary`, and `department_id`.  

4. **Function for Department Salary Totals**  
   - Write a function that, given a `department_id`, returns the total salary of all employees in that department.  

5. **Simplify Queries Using Views and Functions**  
   - Demonstrate how the views and functions created in Tasks 1–4 can be used together to simplify reporting queries.  
   - For example, show how a query can retrieve all high earners and their department totals in a single, readable statement.  

---

### Instructions

#### Write
- Write the SQL code for each view and function using placeholders like `<view_name>`, `<function_name>`, `<parameter_name>`.  
- Ensure concatenation, aggregation, and filtering logic is clear and reusable.  

#### Validate
- Run each view and function to confirm they return the expected results.  
- Test with different `employee_id` and `department_id` values.  
- Check that high earners are correctly filtered in the view.  

#### Reason
- Reflect on why views and functions improve readability and abstraction.  
- Consider how reusable logic reduces repetition in queries.  
- Discuss trade‑offs: when to use a view vs. when to use a function.  

#### Share
- Compare your views and functions with a partner.  
- Share how you structured concatenation, filtering, and aggregation.  
- Discuss alternative approaches (e.g., CASE logic for salary bands, composite views).  

<br/>

---

## General Practice Tasks

### Task 1: Create a Simple View  
- **Use HR database**  
- Create a view that displays `employee_id`, `first_name`, `last_name`, and `department_id` from the Employees table.  
- Purpose: practice abstraction and simplify access to commonly used fields.  

---

### Task 2: Write a Basic Function  
- **Use Stock database**  
- Write a function that, given an `order_number`, returns the total value of that order (`quantity * price`) from the Order_Details table.  
- Purpose: practice reusable logic and returning single values.  

---

### Task 3: Implement a Stored Procedure  
- **Use Sales database**  
- Create a stored procedure that retrieves all orders for a given `customer_id`.  
- Add an optional parameter to filter by `order_date`.  
- Purpose: practice parameterised procedures and centralising business logic.  

---

### Task 4: Apply Indexing  
- **Use Stock database**  
- Create an index on the `category` column in the Products table.  
- Compare query performance before and after indexing using `EXPLAIN` or query plans.  
- Purpose: understand how indexes improve query speed and when they are most useful.  

---

### Task 5: Combine Views and Functions  
- **Use HR database**  
- Use the view from Task 1 and a function that calculates total salary per department together in a query.  
- Show how combining abstractions makes queries shorter and easier to read.  
- Purpose: demonstrate integration of multiple SQL objects.  

---

### Task 6: Optimise with Composite Index  
- **Use Sales database**  
- Create a composite index on `Orders(customer_id, order_date)`.  
- Test queries that filter by both customer and date.  
- Purpose: explore advanced indexing strategies and performance trade‑offs.  

---

### Task 7: Diagnose Common Issues  
- **Use any database**  
- Identify potential problems with your stored procedure, function, view, and indexes.  
- Purpose: practice critical evaluation and troubleshooting.  

#### Problem Queries to Fix
1. ```sql
   CALL get_orders();
   ```
2. ```sql
   CREATE FUNCTION total_salary(emp_id INT) RETURNS VARCHAR(50)
   BEGIN
      DECLARE result DECIMAL(10,2);
      SELECT SUM(salary) INTO result FROM Employees WHERE employee_id = emp_id;
      RETURN result;
   END;
   ```
3. ```sql
   CREATE VIEW high_earners AS
   SELECT employee_id, full_name, salary
   FROM Staff;
   ```
4. ```sql
   CREATE INDEX idx_salary
   ON Employees(salary);
   ```
5. ```sql
   CREATE INDEX idx_customer_id ON Orders(customer_id);
   CREATE INDEX idx_order_date ON Orders(order_date);
   CREATE INDEX idx_amount ON Orders(order_amount);
   ```
### Task 8: Capstone Challenge  
- **Use Sales database**  
- Design a reporting query that shows:  
  - Each customer’s full name (from a view).  
  - Their total purchases (from a function).  
  - Orders filtered by date (via a stored procedure).  
  - Optimised with appropriate indexes.  
- Purpose: bring together **views, functions, stored procedures, and indexes** into one integrated solution.  
