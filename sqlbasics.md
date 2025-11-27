[Intro](./README.md) | [Tasks](./Tasks.md) | [SQL Basics](./sqlbasics.md)

# SQL Basics
Lesson: Basic SQL - SELECT Statements, Primary Keys & Joins
---------------------------------------------------------

### 1. Introduction to SQL Basics and Key Concepts

SQL (Structured Query Language) is a powerful language for managing and querying relational databases. let's look at the basic syntax and key concepts of SQL necessary for working with a relational database like the one described in the initial question.

### 1.1 Introduction to SELECT Statements

A **SELECT** statement is used to retrieve data from a table. It consists of the following parts:

1. **Table Name**: The name of the table we want to retrieve data from, e.g., Employees, Stock.
2. **Column List**: A comma-separated list of column names in the selected row(s).
3. **WHERE Clause** (optional): Filters applied to rows retrieved by the query. For example: "SELECT EmployeeID, FirstName FROM Employees WHERE FirstName LIKE 'J%'" would retrieve all employees with a first name starting with the letter J.
4. **ORDER BY Clause** (optional): Sorts the result set in ascending order based on the column specified.
5. **LIMIT Clause** (optional): Limits the number of rows returned by the query.
6. **GROUP BY Clause** (optional): Groups data by one or more columns and calculates aggregates like SUM, AVG, MAX, MIN.
7. **HAVING Clause** (optional): Filters groups based on aggregate functions.
8. **JOIN Clause**: Connects two or more tables based on a common column(s). For example, to join the Employees and Sales tables, you'd use a JOIN like this: "SELECT e.EmployeeID, s.SaleDate FROM Employees AS e JOIN Sales AS s ON e.EmployeeID = s.EmployeeID".

### 1.2 Introduction to Primary Keys

A **primary key** is a unique identifier for each row in a table (e.g., EmployeeID in the Employees table). A primary key constraint ensures that no two rows in a table have the same value. This constraint also prevents NULL values from being entered, as NULL values are not unique.

### 1.3 Introduction to Foreign Keys

A **foreign key** is a column(s) in one table that refers to the primary key of another table (e.g., EmployeeID in Sales table referring to EmployeeID in Employees table). This constraint ensures that data entered into the foreign key column(s) must exist in the referenced primary key column(s), and prevents deletion or insertion of invalid data.

### 1.4 Introduction to Joins - I (1-to-1 relationship)

A **join** is a way to combine two or more tables based on common values in one or more columns, creating a new table with all possible combinations of rows from the original tables. The most basic join type is a 1-to-1 relationship, where each row in either table can be matched to exactly one row in the other table.

### 1.5 Introduction to Joins - II (Many-to-One relationship)

A **many-to-one** relationship exists when a record in one table is related to multiple records in another table, and vice versa. In this case, you would join the tables on a column(s) that represents the relationship between them (e.g., EmployeeID and ClientID in the Sales table).

### 1.6 Introduction to Joins - III (Many-to-Many relationship)

A **many-to-many** relationship exists when a record in one table is related to multiple records in another table, but vice versa, and each record may be related to many other records. In this case, you would join the tables on a column(s) that represents the relationship between them (e.g., EmployeeID and SupplierID in the Sales table).
