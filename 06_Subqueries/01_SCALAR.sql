/*
===========================================================
Topic       : Scalar Subqueries
Database    : SalesDB
Description : Practice using scalar subqueries that
              return a single value for filtering,
              comparison, and displaying calculated
              values.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display the product ID, product name,
-- price, and the average price of all products.
-----------------------------------------------------------
SELECT
    ProductID,
    Product,
    Price,

    (
        SELECT AVG(Price)
        FROM Sales.Products
    ) AS Average_Price

FROM Sales.Products;

-----------------------------------------------------------
-- Q2. Retrieve products whose price is
-- greater than the average price of
-- all products.
-----------------------------------------------------------
SELECT
    ProductID,
    Product,
    Price,

    (
        SELECT AVG(Price)
        FROM Sales.Products
    ) AS Average_Price

FROM Sales.Products

WHERE Price >
(
    SELECT AVG(Price)
    FROM Sales.Products
);

-----------------------------------------------------------
-- Q3. Display each product along with
-- the total number of orders.
-----------------------------------------------------------
SELECT
    ProductID,
    Product AS Product_Name,
    Price,

    (
        SELECT COUNT(*)
        FROM Sales.Orders
    ) AS Total_Orders

FROM Sales.Products;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Scalar Subqueries
-- ✓ Single-Value Subqueries
-- ✓ Aggregate Functions
-- ✓ AVG()
-- ✓ COUNT()
-- ✓ WHERE
-- ✓ Comparison Operators