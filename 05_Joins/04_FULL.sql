/*
===========================================================
Topic       : FULL JOIN
Database    : SalesDB
Description : Practice retrieving all matching and
              non-matching records from both the
              Customers and Orders tables using
              the FULL JOIN operation.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve all customers and all orders.
-- Matching records are combined, while unmatched
-- records from both tables are also included.
-----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.Customer_ID,
    O.Sales
FROM Customers AS C
FULL JOIN Orders AS O
    ON C.ID = O.Customer_ID;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ FULL JOIN
-- ✓ Table Aliases
-- ✓ Join Conditions
-- ✓ Matching Records
-- ✓ Unmatched Records
-- ✓ Retrieving Data from Both Tables