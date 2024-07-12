A profit ride for a Uber driver is considered when the start location and start time of a ride exactly match with the previous ride's end location and end time. 
Write an SQL to calculate total number of rides and total profit rides by each driver.

**Table: drivers(primary key : id , start_time )**

| column name |	datatype |
| ----------- | -------- | 
| id |	varchar(10) |
| start_time |	time |
| end_time | time |
| start_loc |	varchar(1) |
| end_loc |	varchar(1) |
 
**Expected output :**

| id	| total_rides |	profit_rides |
| --- | ----------- | ------------ |
| dri_1	| 5	| 1 |
| dri_2 |	2 |	0 |

**Solution:**
with cte as (
    select *, lag(end_time)over(partition by id order by end_time) as prev_end_time
    , lag(end_loc)over(partition by id order by end_time) as prev_end_loc
    from drivers
)

select id, count(1) as total_rides, sum(case when start_time==prev_end_time and start_loc==prev_end_loc
then 1 else 0 end) as profit_rides from cte
group by id
