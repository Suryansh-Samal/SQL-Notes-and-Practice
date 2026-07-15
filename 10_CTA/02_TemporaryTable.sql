--Creating a temporary table 

Select 
	Month(Orderdate) Month,
	Datename(month, orderdate) MonthName
	into #TempOrderMonths
from Sales.Orders
Group by MONTH(Orderdate),
		 Datename(month, orderdate) 
		 
Select * from #TempOrderMonths

-- Deleting a row from temporary row
Delete from #TempOrderMonths
Where MonthName = 'January'

-- Storing content of temporary table permanently in an actual table
Select * 
Into Sales.NewTable
from #TempOrderMonths