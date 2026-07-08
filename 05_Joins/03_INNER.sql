/*
===========================================================
Topic       : INNER JOIN
Database    : SalesDB
Description : Practice retrieving records that have
              matching values in both the Customers and
              Orders tables using the INNER JOIN operation.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve customers along with their orders.
-- Only matching records from both tables are returned.
-----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    O.OrderID,
    O.Sales
FROM Customers AS C
INNER JOIN Orders AS O
    ON C.ID = O.Customer_ID;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ INNER JOIN
-- ✓ Table Aliases
-- ✓ Join Conditions
-- ✓ Matching Records