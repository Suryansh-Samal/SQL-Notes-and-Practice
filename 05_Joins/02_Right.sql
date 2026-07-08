/*
===========================================================
Topic       : RIGHT JOIN
Database    : SalesDB
Description : Practice retrieving all orders along with
              their corresponding customers using the
              RIGHT JOIN operation.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

----------------------------------------------------------
-- Q1. Retrieve all orders along with their customers.
-- Orders without matching customers are also included.
----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    O.OrderID,
    O.Sales
FROM Customers AS C
RIGHT JOIN Orders AS O
    ON C.ID = O.Customer_ID;

-----------------------------------------------------------
-- Q2. Retrieve orders that do not have
-- a matching customer.
-----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    O.OrderID,
    O.Customer_ID,
    O.Sales
FROM Customers AS C
RIGHT JOIN Orders AS O
    ON C.ID = O.Customer_ID
WHERE C.ID IS NULL;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ RIGHT JOIN
-- ✓ Table Aliases
-- ✓ Join Conditions
-- ✓ Filtering NULL Values
-- ✓ Finding Unmatched Records