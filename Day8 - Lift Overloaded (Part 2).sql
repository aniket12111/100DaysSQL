You are given a table of list of lifts , their maximum capacity and people along with their weight and gender who wants to enter into it. You need to make sure maximum people enter into the lift without lift getting overloaded but you need to give preference to female passengers first.
For each lift find the comma separated list of people who can be accomodated. The comma separated list should have female first and then people in the order of their weight in increasing order.

**Table: lifts (primary key : id)**

| column name	| datatype |
| id |	int |
| capacity_kg |	int |
 

**Table: lift_passengers(primary key : passenger_name )**

| column name	| datatype |
| passenger_name | varchar(10) |
| weight_kg |	int |
| gender |	varchar(1) |
| lift_id |	int |
 

**Expected Output:**

| id	| passenger_list |
| 1	| Adarsh,Dheeraj,Rahul |
| 2 |	Priti,Neha,Vimal,Himanshi |

**Solution:**
with data as (select *, sum(weight_kg) over(partition by lift_id order by gender, weight_kg) as wkg from lift_passengers p
inner join lifts l on p.lift_id = l.id)


select id, group_concat(passenger_name) as passenger_list from data
where wkg < capacity_kg
group by lift_id

 
