/*
===========================================================
Topic       : MIN() and MAX()
Database    : SalesDB
Description : Practice using the MIN() and MAX() window
              functions to identify minimum and maximum
              values, compare records, and calculate
              deviations.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display each order along with:
-- 1. The highest and lowest sales across all orders.
-- 2. The highest and lowest sales for each product.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,

    MAX(Sales) OVER() AS Highest_Sales,

    MIN(Sales) OVER() AS Lowest_Sales,

    MAX(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Highest_Sales_By_Product,

    MIN(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Lowest_Sales_By_Product

FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Retrieve employee(s) with the highest salary.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary,

        MAX(Salary) OVER() AS Highest_Salary

    FROM Sales.Employees

) AS EmployeeSalary

WHERE Salary = Highest_Salary;

-----------------------------------------------------------
-- Q3. Calculate the deviation of each order's sales
-- from the minimum and maximum sales.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,

    MAX(Sales) OVER() AS Highest_Sales,

    MIN(Sales) OVER() AS Lowest_Sales,

    Sales - MIN(Sales) OVER() AS Deviation_From_Minimum,

    MAX(Sales) OVER() - Sales AS Deviation_From_Maximum

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ MIN()
-- ✓ MAX()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ Subqueries
-- ✓ Data Comparison
-- ✓ Deviation Analysis