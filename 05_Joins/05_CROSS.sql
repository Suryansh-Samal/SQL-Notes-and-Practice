/*
===========================================================
Topic       : CROSS JOIN
Database    : SalesDB
Description : Practice generating all possible
              combinations of rows from the Customers
              and Orders tables using the CROSS JOIN
              operation.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Generate all possible combinations of
-- customers and orders.
-----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    C.LastName,
    O.OrderID,
    O.Customer_ID,
    O.Sales
FROM Customers AS C
CROSS JOIN Orders AS O;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ CROSS JOIN
-- ✓ Cartesian Product
-- ✓ Table Aliases
-- ✓ All Possible Row Combinations