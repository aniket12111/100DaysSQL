NCS (Namaste Consultancy Services) wants to award employees based on number of projects completed by each individual each month.  Write an SQL to find best employee for each month along with number of projects completed by him/her 
in that month .

 

**Table: projects(primary key : project_id)**

| column name |	data type | 
| project id	| int |
| employee_name	| varchar(20) |
| project_completion_date |	date |
 

**Example Input**
**projects**

| project_id |	employee_name |	project_completion_date |
| 101 |	Shilpa	| 2023-01-03 |
| 102 |	Shilpa	| 2023-01-15 |
| 103 |	Shilpa	| 2023-01-22 |
| 104 |	Rahul	| 2023-01-05 |
 

**Expected Output:**

| employee_name	| year_month	| no_of_completed_projects |
| Shilpa |	202301 |	3 |
 

**Explanation:**

In the Month of Jan 2023 Shilpa has done 3 projects and Rahul has done 1 project so she is the best employee for Jan 2023.

**Solution**


