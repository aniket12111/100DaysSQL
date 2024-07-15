You are given a list of users and their opening account balance along with the trasaction done by them. Write a SQL to calculate their account balance at the end of all the transactions. Please note that users can do transactions 
  among themselves as well. 

**Table: users(primary key : user_id)**

| column name	    | datatype    |
| --------------- | ----------- |
| user_id         | int         |
| username        | varchar(10) |
| opening_balance |	int         |
 

**Table: transactions (primary key : id)**

| column name |	datatype |
| ----------- | -------- |
| id          |	int      |
| from_userid |	int      |
| to_userid   |	int      |
| amount      |	int      |
 

**Expected Output:**

| user_id | final_balance |
| ------- | ------------- |
| Ankit	  | 2000          |
| Rahul	  | 10200         |
| Amit	  | 2800          |
| Agam	  | 7500          |

**Solution:**
with money_added as (
    select u.user_id,u.username, u.opening_balance + sum(coalesce(ad.amount,0)) as amount
from  users as u left join transactions as ad
on ad.to_userid = u.user_id
group by user_id
),
money_deduct as (
    select u.user_id,u.username,  sum(coalesce(-mi.amount,0)) as amount
from  users as u left join transactions as mi
on mi.from_userid = u.user_id
group by user_id
)

select ad.username, ad.amount + mi.amount from money_added as ad, money_deduct as mi
where ad.user_id = mi.user_id

 

 
