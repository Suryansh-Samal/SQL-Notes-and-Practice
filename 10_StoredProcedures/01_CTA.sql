-- Create a CTA
Select
	DATENAME(month,Orderdate) 
	Count(OrderID) TotalOrders
Into Sales.MonthlyOrders
from sales.orders
Group by DATENAME(month,Orderd

Select * from Sales.MonthlyOrd

-- Drop a CTA

Drop table Sales.MonthlyOrders
