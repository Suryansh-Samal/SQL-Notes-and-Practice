/*
===========================================================
Topic       : Multi-Row Subqueries
Database    : SalesDB
Description : Practice using multi-row subqueries that
              return multiple values for filtering and
              comparison using IN, ANY, and ALL.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display all orders placed by
-- customers from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders

WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Sales.Customers
    WHERE Country = 'Germany'
);

-----------------------------------------------------------
-- Q2. Display all orders placed by
-- customers who are not from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders

WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Sales.Customers
    WHERE Country <> 'Germany'
);

-----------------------------------------------------------
-- Q3. Retrieve female employees whose
-- salaries are greater than ANY
-- male employee's salary.
-----------------------------------------------------------
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary

FROM Sales.Employees

WHERE Gender = 'F'

AND Salary > ANY
(
    SELECT Salary
    FROM Sales.Employees
    WHERE Gender = 'M'
);

-----------------------------------------------------------
-- Q4. Retrieve male employees whose
-- salaries are greater than ALL
-- female employees' salaries.
-----------------------------------------------------------
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary

FROM Sales.Employees

WHERE Gender = 'M'

AND Salary > ALL
(
    SELECT Salary
    FROM Sales.Employees
    WHERE Gender = 'F'
);

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Multi-Row Subqueries
-- ✓ IN
-- ✓ ANY
-- ✓ ALL
-- ✓ WHERE
-- ✓ Comparison Operators
-- ✓ Filtering Rows