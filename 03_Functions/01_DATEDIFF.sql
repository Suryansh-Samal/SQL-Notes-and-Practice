/*
===========================================================
Topic       : Date Functions
Database    : MyDatabase
Description : Practice using DATEDIFF(), GETDATE(),
              FORMAT() and LAG() for date calculations.
Author      : Suryansh 
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Calculate the age of each employee
-----------------------------------------------------------
SELECT
    EmployeeID,
    BirthDate,
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age
FROM Sales.Employees;

-----------------------------------------------------------
-- Q2. Calculate the average shipping time for each month
-- (Recommended approach for multiple years)
-----------------------------------------------------------
SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS Avg_Shipping_Days
FROM Sales.Orders
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Order_Year,
    Order_Month;

-----------------------------------------------------------
-- Q3. Calculate the average shipping time
-- (Suitable when data belongs to a single year)
-----------------------------------------------------------
SELECT
    FORMAT(OrderDate, 'MMM yyyy') AS Order_Month,
    AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AS Avg_Shipping_Days
FROM Sales.Orders
GROUP BY
    FORMAT(OrderDate, 'MMM yyyy')
ORDER BY
    MIN(OrderDate);

-----------------------------------------------------------
-- Q4. Time Gap Analysis
-- Find the number of days between each order
-- and the previous order.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate AS Current_Order_Date,
    LAG(OrderDate) OVER (ORDER BY OrderDate) AS Previous_Order_Date,
    DATEDIFF(
        DAY,
        LAG(OrderDate) OVER (ORDER BY OrderDate),
        OrderDate
    ) AS Days_Between_Orders
FROM Sales.Orders;