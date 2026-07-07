/*
===========================================================
Topic       : NULL Handling
Database    : MyDatabase
Description : Practice handling NULL values using CASE,
              sorting techniques, filtering records, and
              identifying customers without orders.
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Sort customers in ascending order by score
-- while placing NULL values at the end.
-----------------------------------------------------------
SELECT
    CustomerID,
    Score,
    CASE
        WHEN Score IS NULL THEN 1
        ELSE 0
    END AS Flag
FROM Sales.Customers
ORDER BY
    Flag,
    Score;

-----------------------------------------------------------
-- Q2. Retrieve all customers who have no score.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Customers
WHERE Score IS NULL;

-----------------------------------------------------------
-- Q3. Retrieve customers who have never placed an order.
-----------------------------------------------------------
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Country,
    O.OrderID
FROM Sales.Customers AS C
LEFT JOIN Sales.Orders AS O
    ON O.CustomerID = C.CustomerID
WHERE O.OrderID IS NULL;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ NULL Handling
-- ✓ CASE Expression
-- ✓ CASE WHEN
-- ✓ ORDER BY
-- ✓ LEFT JOIN
-- ✓ Filtering NULL Values
-- ✓ Identifying Unmatched Records