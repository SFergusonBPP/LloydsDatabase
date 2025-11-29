[Intro](./README.md) | [Getting Started](./Getting%20Started.md) | [Tasks Wk1](./TasksWk1.md) | [Tasks Wk2](./TasksWk2.md) | [SQL Basics](./sqlbasics.md)

# SQL Quick Reference Guide

## Keys
- **Primary Key** → Unique identifier for each row (no duplicates, no NULLs).
- **Foreign Key** → Column that points to a primary key in another table (enforces relationships).

---

## SELECT Statements
- **Basic form**: retrieve specific columns from a table.
    ```sql
    SELECT column1, column2
    FROM table_name;
    ```
- **WHERE** → filter rows.
- **ORDER BY** → sort results.
- **LIMIT** → restrict number of rows.
- **GROUP BY** → group rows + aggregates (COUNT, SUM, AVG).
- **HAVING** → filter groups.

---

## CASE (Conditional Logic)
- **Purpose**: Adds conditional labels inside queries.
- **Example**:
    ```sql
    SELECT OrderID,
       CASE 
         WHEN TotalAmount < 50 THEN 'Low'
         WHEN TotalAmount < 200 THEN 'Medium'
         ELSE 'High'
       END AS OrderCategory
    FROM Orders;
    ```
- **Placement**: Often used after GROUP BY/HAVING to categorise or label results.
- **Example use**: categorising orders as 'Low', 'Medium', 'High'.

---

## Joins
- **Purpose**: Combine data across tables using keys.
- **Example**:
    ```sql
    SELECT c.Name, o.OrderDate
    FROM Customers c
    INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    ```
- **Types**:
  - **INNER JOIN** → Only matching rows.
  - **LEFT JOIN** → All left rows + matches from right.
  - **RIGHT JOIN** → All right rows + matches from left.
  - **FULL JOIN** → All rows from both, NULLs where no match.

**Pitfalls**:
- Forgetting join condition → Cartesian product (every row combined with every other).
- Wrong join type → missing or extra data.
- Performance → index join columns.

---

## Stored Procedures
- **Definition**: Precompiled SQL routines stored in the database.
- **Benefits**:
  - Reusability → write once, run many times.
  - Security → restrict direct table access.
  - Performance → faster execution.
  - Maintainability → centralised business logic.
- **Common Issues**: missing parameters, inefficient logic, version control problems.

---

## Functions
- **Definition**: Routines that return a single value.
- **Differences from procedures**: must return a value, can be used inside SQL statements.
- **Common Issues**: return type mismatches, slow performance with complex logic, side effects (shouldn’t modify data).

---

## Views
- **Definition**: Virtual tables based on SELECT queries.
- **Characteristics**:
  - Virtual (no physical storage).
  - Dynamic (always reflects current data).
  - Can be read‑only or updatable.
- **Benefits**: simplify queries, restrict access, provide consistent interface.
- **Common Issues**: dependency on base tables, performance overheads, updatability limits.

---

## Indexing
- **Definition**: Database object that speeds up data retrieval.
- **How it works**: like a book index; often uses B‑Tree structure.
- **Types**: single‑column, composite, unique, full‑text.
- **Benefits**: faster queries, reduced I/O, enforce uniqueness.
- **Best Practices**:
  - Use on WHERE/JOIN/ORDER BY columns.
  - Avoid low‑selectivity columns.
  - Regularly review and optimise.
- **Common Issues**: over‑indexing slows writes, fragmentation, maintenance overhead.
- **Maintenance**: monitor usage, rebuild/reorganise fragmented indexes, drop unused ones.

---

## Key Takeaways
- Use **primary/foreign keys** to link tables.
- **SELECT** is the foundation; clauses refine results.
- **CASE** adds flexible logic.
- **Joins** unlock multi‑table queries — choose the right type.
- **Stored procedures/functions/views** → encapsulate, simplify, and secure logic.
- **Indexes** → optimise performance, but must be managed carefully.