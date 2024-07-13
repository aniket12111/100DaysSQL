Write a query to find workaholics employees.  Workaholics employees are those who satisfy atleast one of the given criterion:
1- Employees who work for more than 8 hours a day for atleast 3 days in a week. 
2- Employees who work for more than 10 hours a day for atleast 2 days in a week. 

You are given the login and logout timings of all the employess for a given week. Write a SQL to find all the workaholic employees along with the criterion that they are satisfying (1,2 or both).

**Table: employees(primary key : emp_id ,login)**

| column name |	data type |
| ----------- | --------- |
| emp_id 	    | int       |
| login 	    | datetime  |
| logout 	    | datetime  |
 
**Example Output:**

| emp_id | criterian | 
| ------ | --------- |
| 100	   | 1         |
| 200	   | 2         |  
| 300	   | both      |

**Solution:**
with cte as (
    select emp_id,  sum(case when ((strftime("%s", julianday(logout)) - strftime("%s", julianday(login))) / 3600) >= 8 then 1 else 0 end) over(partition by emp_id, strftime("%W", login)) as a_hrs
,  sum(case when ((strftime("%s", julianday(logout)) - strftime("%s", julianday(login))) / 3600) >= 10 then 1 else 0 end) over(partition by emp_id, strftime("%W", login)) as b_hrs
from employees
)

select emp_id, case when a_hrs >= 3 and b_hrs >= 2 then 'both' 
                    when a_hrs >= 3 then '1'
                    when b_hrs >= 2 then '2' end as criterian from cte
group by emp_id

