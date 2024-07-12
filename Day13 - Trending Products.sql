Amazon wants to find out the Trending products for each month. Trending products are those for which any given month sales is more than the sum of previous 2 months sales for that product.
Please note that for first 2 months of operations this metrics does not make sense. So output should start from 3rd month only.  Assume that each product has atleast 1 sales each month.

**Table: orders (primary key : order_month, product_id)**

| column name	| datatype |
| order_month	| date |
| product_id |	varchar(5) |
| sales |	int |
 
**Expected Output:**

| order_month	| product_id |
| 202303	| p1 |
| 202304	| p1 |
| 202304	| p2 |

**Solution 1: Using LAG() function**
with cte as (
 select order_month, product_id, sales, lag(sales, 2, 0)over(partition by product_id order by order_month)
+ lag(sales, 1, 0)over(partition by product_id order by order_month) as sum_older_2
, dense_rank() over(order by order_month) as rnk
from orders
 order by rnk
)

select order_month, product_id from cte
where sales > sum_older_2
and rnk>2
order by order_month

**Solution 2: Using SUM() function**
with cte as (
 select order_month, product_id
,sum(sales) over(partition by product_id order by order_month rows between 2 preceding and 1 preceding) as sum_older_2
,dense_rank() over(order by order_month)  as rn
from orders 
order by rn
)

select order_month, product_id from cte
where sales > sum_older_2
and rn>2
order by order_month

