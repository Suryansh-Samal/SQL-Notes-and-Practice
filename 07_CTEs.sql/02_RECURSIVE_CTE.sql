/*
===========================================================
Topic       : Recursive Common Table Expressions (Recursive CTE)
Database    : SalesDB
Description : Practice using recursive CTEs to generate
              sequences and traverse hierarchical data.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Generate a series of numbers from 1 to 20
-- using a Recursive CTE.
-----------------------------------------------------------

WITH Series AS
(
    -- Anchor Query
    SELECT
        1 AS MyNumber

    UNION ALL

    -- Recursive Query
    SELECT
        MyNumber + 1

    FROM Series

    WHERE MyNumber < 20
)

SELECT
    *
FROM Series

OPTION (MAXRECURSION 50);

-----------------------------------------------------------
-- Q2. Display the employee hierarchy by showing
-- each employee's level within the organization.
-----------------------------------------------------------

WITH CTE_Employee_Hierarchy AS
(
    -------------------------------------------------------
    -- Anchor Query
    -------------------------------------------------------

    SELECT

        EmployeeID,

        FirstName,

        ManagerID,

        1 AS EmployeeLevel

    FROM Sales.Employees

    WHERE ManagerID IS NULL

    UNION ALL

    -------------------------------------------------------
    -- Recursive Query
    -------------------------------------------------------

    SELECT

        E.EmployeeID,

        E.FirstName,

        E.ManagerID,

        EH.EmployeeLevel + 1

    FROM Sales.Employees AS E

    INNER JOIN CTE_Employee_Hierarchy AS EH

        ON E.ManagerID = EH.EmployeeID
)

-----------------------------------------------------------
-- Main Query
-----------------------------------------------------------

SELECT

    EmployeeID,

    FirstName,

    ManagerID,

    EmployeeLevel

FROM CTE_Employee_Hierarchy;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Recursive CTE
-- ✓ WITH Clause
-- ✓ Anchor Query
-- ✓ Recursive Query
-- ✓ UNION ALL
-- ✓ Hierarchical Queries
-- ✓ Self Join
-- ✓ MAXRECURSION
-- ✓ Employee Hierarchy
-- ✓ Recursive Number Generation