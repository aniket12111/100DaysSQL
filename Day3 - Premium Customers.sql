Namastekart, an e-commerce company want to start special reward program for their premium customers.  The customers who have placed more number of orders than the average number of orders placed by each customers are 
  considered as premium customers.

Write an SQL to find the list of premium customers along with the number of orders placed by each of them. 

**Table: orders (primary key : order_id)**

|column name	| datatype |
|------------ | -------- |
|order_id	| int |
|order_date	| date |
|customer_name |	varchar(20) |
|sales	| int |
 

**Example Input**

**orders**

order_id	order_date	customer_name	sales
1	2023-01-01	Alexa	1239
2	2023-01-02	Alexa	1239
3	2023-01-03	Alexa	1239
4	2023-01-03	Alexa	1239
5	2023-01-01	Ramesh	1239
6	2023-01-02	Ramesh	1239
7	2023-01-03	Ramesh	1239
8	2023-01-03	Neha	1200
9	2023-01-03	Subhash	100
10	2023-01-03	Subhash	230
 

**Expected Output:**

| customer_name |	no_of_orders |
| ------------- | ------------ |
| Alexa |	4 |
| Ramesh |	3 |

**Explanation: **
There are total 10 orders placed by 4 customers so the average number order placed by each customers is 10/4 = 2.5 . Alexa and ramesh have done more than 2.5 orders so they are in the output. 

**Solution: **
select customer_name, count(*) as no_of_orders from orders
group by customer_name
having count(*) > (select count(*)/count(distinct customer_name) from orders)

