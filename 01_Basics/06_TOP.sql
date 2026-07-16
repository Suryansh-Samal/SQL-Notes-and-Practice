select top 3*
from customers  -- top 3 customers with the highest score
order by score desc

select top 2
customer_id,
order_date
from orders  -- top 2 recent order
order by order_date desc