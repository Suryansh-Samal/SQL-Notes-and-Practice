/*
===========================================================
Topic       : LEFT JOIN
Database    : SalesDB
Description : Practice retrieving all customers along
              with their corresponding orders using the
              LEFT JOIN operation.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve all customers along with their orders.
-- Customers without orders are also included.
-----------------------------------------------------------
SELECT
    C.ID,
    C.FirstName,
    O.OrderID,
    O.Sales
FROM Customers AS C
LEFT JOIN Orders AS O
    ON C.ID = O.Customer_ID;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ LEFT JOIN
-- ✓ Table Aliases
-- ✓ Join Conditions
-- ✓ Retrieving Matching and Non-Matching Records