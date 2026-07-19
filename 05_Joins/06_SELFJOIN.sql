/*
===========================================================
Topic       : Self Join
Database    : Employee Database
Description : Find employees whose salary is greater than
              their manager's salary using a self join.
Author      : Suryansh
===========================================================
*/

-----------------------------------------------------------
-- Q1. Find employees whose salary is higher
-- than their manager's salary.
-----------------------------------------------------------

SELECT

    E.Name AS Employee

FROM Employee AS E

INNER JOIN Employee AS M

    ON E.ManagerId = M.Id

WHERE E.Salary > M.Salary;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Self Join
-- ✓ INNER JOIN
-- ✓ Table Aliases
-- ✓ Comparison Operators
-- ✓ WHERE