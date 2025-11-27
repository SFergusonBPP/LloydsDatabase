-- SQLBook: Code
-- Statements

-- Once you have written each SQL statement run that statement only, or comment out each query as you write and test it


-- Task 3
-- USE Sales;

--Show all details for all customers
--Count how many customers live in London
--Insert yourself as a customer
--Insert a new order for yourself
--Salesman James Hook has moved to Rome
--Customer Jane Davis has changed her surname to Black
--Delete your order from the order table
--Using a JOIN, show all the order details for all customers
--Sort the results of the previous query by order date, newest order first!
--Using a JOIN, show all order details for all orders placed by Brad Davis
--Add to the previous query so that it shows the name of the salesman
--Using GROUP BY, display how many orders each salesman is responsible for





-- Task 4
-- USE stock;

-- Insert a new Supplier into your Database
-- Insert a new Customer
-- Insert a new camera product, supplied by the Supplier inserted above
-- Insert a new Laptop into ‘Products’
-- Insert a new Keyboard into ‘Products’
-- Insert yourself as a Customer
-- Insert a new Order for yourself for one of the new laptops
-- Display the Title, Forename and Surname of the customers in the database
-- Display the name and telephone number of the suppliers in the database
-- Display ALL the information held in the database about the customers
-- Display all the unique Titles of the customers in the database.  Each title should only be shown once in the results.
-- Display all the unique categories of products that we have in the database.  Each category should only be displayed once.
-- Display ALL details of all customers whose credit limit is £1000
-- Display the order number of all orders where more than one item has been ordered.
-- Display the product number and description of all products supplied by the Supplier with Supplier Number 2 ONLY
-- Display how many customers there are in the database
-- Display how many customers have the title ‘Mr’
-- Display how many products there are in the ‘Cameras’ category
-- Display the name and address details of all customers with a credit limit of £2000
-- There is a quality issue with a product.  The company needs to see how many orders there are for the product with Product Number 'AE424747’.  Write this query.
-- Following on from the last query, now display the details (e.g., order number, order date) of the orders for the product with Product Number 'AE424747’.  
-- Display all details of products where the quantity in stock is less than the re-order level





-- Task 5
-- Create books/author database





-- Task 6

-- USE stock;

-- Change the first name of Rev Rob Girling to ‘Robert’
-- Ms Jeannie Cook has now married and become Mrs Jeannie Burton.  Update her customer record accordingly.
-- Update the address of one of your customers (i.e. to simulate that they have moved to a new house).
-- A delivery of 30 Diablo 207 Network Cameras has arrived.  Update the current stock level in the database.   Be careful to increase the quantity not just set it to 30.
-- Add £10 to ALL product prices.  Be careful to increase the price not set them all to £10!
-- Delete the order in the system from Customer with Customer Number 455
-- Delete the Supplier with Supplier Number 2 from your database

-- Write an SQL script for the Stock database that:
     -- Creates another table in your database (give it any name).  
     -- Uses INSERT commands to add a couple of test records.
     -- Then, deletes these test records. 
     -- Then deletes the table itself.






-- Task 7

-- USE stock;

-- Display the Product Number, Product Description and Supplier Name for all products.
-- For every order, display the order details AND the details of the product that has been ordered.
-- By using one SQL query, display the Order Numbers and Product Numbers for all orders placed by Mrs Leah Barlow.
-- Display the Product Number, Supplier Name and Product Description of all products where the current number in stock is less than 10.
-- Add to the query above to also display the Order Number and Order Quantity of any orders that have been placed for these items (i.e. orders that have been placed for the products with less than 10 in stock).
-- Use an outer join to show the details of all the products that have not yet been ordered.




-- Task 8

-- USE stock;

-- Create a query that for a particular order number, shows the items that have been ordered, the price of each item that is in the database (which include VAT), and the price of each item excluding VAT.  Note that the latter will need to be a calculated field.
-- Write a query that uses a calculated field to display the total amount payable for each product on each order (i.e. the price of each product multiplied by the quantity).
-- An important customer has rung up. They placed an order (376805), but having received the products, they are not satisfied with the quality or reliability of the items. Using this order number, write a query that finds the item number for this order – and then saves this item number to a variable. You should then PRINT the variable to the screen so that it is visible when the query is executed.
-- Continuing on from the query above:- Because the item in question is an expensive product, and there are serious concerns over the quality of this stock, management have made the decision to temporarily remove this item from sale. Extend the query from above, so that the item number saved to a variable is used in an UPDATE query to modify the items stock level to 0 (zero).  This will ensure that no more of this item can be ordered temporarily.






--Task 9

-- USE stock;

-- What is the average price of an item in our database
-- What is the total value of all of the items that in stock
-- When was the earliest order placed in our database
-- Currently we are using VARCHAR(100) to store the product descriptions.
-- A manager is wondering whether we could ‘alter’ this table to reduce this to varchar(50). Write a query that shows what it would be like if we only stored up to the first 50 characters of each product description.
-- For every order in the database, display how many days ago the order was placed
-- Who is the customer with the most characters in their combined first name and surname





-- Task 10

-- USE stock;

-- Write a query that displays each category of product that we sell, and the number of orders for each category that we currently have.
-- Write a query that displays the number of orders in the database, grouped by order date (display all the dates we have received orders on, and the number of orders on each date).
-- (extension) Write a query that shows the value of stock we hold from each of our suppliers  (display the name of each supplier, and next to it display the total value of stock from that supplier)





-- Task 11

-- USE stock;

--  Display each category of product that we sell, and the number of orders for each category that we currently have.  However, only display results for categories where the number of orders is less than 20.
--  (extension) Display how many orders each customer has placed – but only display results where a customer has placed more than one order.





-- Task 12

-- USE stock;

-- Write a query that displays the product number, description, supplier number and price of our products from all suppliers other than Supplier 1.
-- Write a second query that displays the product number, description, supplier number and price excluding VAT for all products supplied by Supplier 1 only.
-- Use the UNION operator to show the data from both queries above all together in one set of results.





-- Task 13

-- USE stock;

-- Create a VIEW that contains: Product descriptions next to the name of the company that supplies them
-- Create a VIEW that contains: A list of order numbers, with the product name and quantity ordered next to it
-- For each of the VIEWs: Run a SELECT query of some sort, to check that the data is retrievable.
-- For each of the VIEWs: Try to run other CRUD queries on your view – i.e. an INSERT, an UPDATE and a DELETE.  





-- Task 14

-- USE stock;

-- Show the product number, description, category and stock level information for all products
-- Show the details of all orders where more than one of a product has been ordered.
-- Display all order numbers in the database, and alongside each, display the total number of items on the order
-- Show all details of all customers who live in the West Midlands, and whose credit limit is greater than £1000
-- Show the product name, number and supplier name for all products.  Sort the results by supplier name, alphabetically
-- Find an order number from the database.  For this order number, display the details of the product that have been ordered.
-- Allow the user to enter a customer number, and then display the number of orders that customer has.
-- Produce a query that displays all customer numbers and names, along with the number of orders that each customer has placed.  Sort the results alphabetically by surname.
-- Allow the user to enter an order number.  Display the Customer name and product name on the order
-- In one query, retrieve the order number for the order that has been placed for the highest quantity of a particular product.
-- Write the query to retrieve the customer contact details for everyone who has ordered products from supplier 1.





-- Task 15

-- USE stock;

-- Create a stored procedure for one of the simple queries you have created previously.
-- Create a stored procedure that will allow you to DELETE an order, by just passing it the order number
-- Create and test a Stored Procedure that can easily be executed to delete a customer, and all associated data from our ‘Stock’ database.  The stored procedure should simply be able to be executed by passing it a Customer ID.
