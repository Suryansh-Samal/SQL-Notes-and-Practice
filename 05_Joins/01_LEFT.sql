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
-- Q2. Retrieve orders that do not have
-- a matching customer.
-----------------------------------------------------------
SELECT
    O.OrderID,
    O.Customer_ID,
    O.Sales,
    C.ID,
    C.FirstName
FROM Orders AS O
LEFT JOIN Customers AS C
    ON O.Customer_ID = C.ID
WHERE C.ID IS NULL;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ LEFT JOIN
-- ✓ Table Aliases
-- ✓ Join Conditions
-- ✓ Retrieving Matching and Non-Matching Records