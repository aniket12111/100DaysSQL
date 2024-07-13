NamasteKart an ecommerce company wants to find out its top most selling product by quanity in each category. In case of a tie when quantities sold are same for more than 1 product than we need to give preference to the product 
  with higher sales value.

**Table: orders (primary key : order_id)**

| column name |	datatype    |
| ----------- | --------    |
| order_id	  | int         |
| product_id  | varchar(20) |
| category    | varchar(10) |
| unit_price  | int         |
| quantity    | int         |
 
**Input Data:**
  
| order_id | product_id	   | category  | unit_price	| quantity |
| -------- | ------------- | --------- | ---------- | -------- |
| 100	     | Chair-1221	   | Furniture | 1500       | 1        |
| 101	     | Table-3421	   | Furniture | 2000       | 3        |
| 102	     | Chair-1221	   | Furniture | 1500       | 2        |
| 103	     | Table-9762	   | Furniture | 7000       | 2        |
| 104	     | Shoes-1221	   | Footwear  | 1700       | 1        |
| 105	     | floaters-3421 | Footwear  | 2000       | 1        |
| 106	     | floaters-3421 | Footwear  | 2000       | 1        |
| 107	     | floaters-9875 | Footwear  | 1500       | 2        |

**Expected Output: **

| category	 | product_id    |
| ---------- | ------------- |
| Footwear	 | floaters-3421 |
| Furniture  | 	Table-3421   |

**Solution:**
with cte as (
    select category, product_id, sum(quantity) as t_quantity, unit_price * sum(quantity) as t_sales
    from orders
    group by category, product_id
    order by category, t_quantity, t_sales
)

select category, product_id from (
    select category, product_id, rank()over(partition by category order by t_quantity desc, t_sales desc) as rnk from cte
) as t
where t.rnk=1




