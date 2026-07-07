/*
===========================================================
Topic       : NULL Handling
Database    : MyDatabase
Description : Practice handling NULL values using CASE,
              sorting techniques, filtering records, and
              identifying customers without related orders.
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Sort customers by score in ascending order,
-- placing NULL values at the end.
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
-- Q2. Retrieve all customers with no score.
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
-- ✓ NULL Values
-- ✓ CASE Expression
-- ✓ CASE WHEN
-- ✓ ORDER BY
-- ✓ LEFT JOIN
-- ✓ IS NULL
-- ✓ Filtering NULL Values
-- ✓ Finding Unmatched Records