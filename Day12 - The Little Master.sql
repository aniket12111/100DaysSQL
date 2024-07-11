Sachin Tendulkar - Also known as little master. You are given runs scored by Sachin in his first 10 matches. You need to write an SQL to get match number when he completed 500 runs and his batting average at the end of 10 matches.

Batting Average = (Total runs scored) / (no of times batsman got out)
Round the result to 2 decimal places.

**Table: sachin(primary key : match_no)**

| column name |	datatype |
| match_no |	int |
| runs_scored |	int |
| status |	varchar(10) |
 
**Expected Output:**

| match_no	| batting_average |
| 8	| 70.33 |


**Solution:**

with cte as (
select match_no, sum(runs_scored)over(order by match_no) as running_runs, sum(case when status=='out' then 1 else 0 end)over(order by match_no) as status
from sachin
)

select min(match_no) as match_no, round(cast(max(running_runs) as float)/max(status), 2) as batting_average
from cte
where running_runs > 500
