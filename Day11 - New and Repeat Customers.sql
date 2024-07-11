NamasteKart an ecommerce company wants to build a very imporant business metrics where they want to track on daily basis how many new and repeat customers are purchasing products from their website. A new customer is defined 
  when he purchased anything for the first time from the website and repeat customer is someone who has done atleast one purchase in the past.

**Table: customer_orders (primary key : order_id)**

| column name |	datatype |
| order_id |	int |
| order_date |	date |
| customer_id |	int |
| order_amount |	int |
 
**Expected Output:**

| order_date |	new_customers |	repeat_customers |
| 2022-01-01 |	3	| 0 |
| 2022-01-02 |	2	| 1 |
| 2022-01-03 |	1	| 2 |

**Solution:**

with first_customer as (
    select customer_id, min(order_date) as first_order_date from customer_orders
    group by customer_id
)

select order_date, sum(first_order_date is not null) as new_customers, sum(first_order_date is null) as repeat_customers 
from customer_orders co left outer join first_customer fc
on co.order_date = fc.first_order_date
and co.customer_id = fc.customer_id
group by order_date



