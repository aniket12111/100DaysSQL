Udaan expanding his business to new cities every year. You are given a table of business operations where you have information about cities where Udaan is doing operations along with the business date information.
Write a SQL to find year wise number of new cities added to the business.

**Table: business_operations (primary key : order_id)**

| column name	| datatype |
| business_date |	date |
| city_id |	int |
 

**Sample Input :**

| business_date	| city_id |
| 2020-01-02 |	3  |
| 2020-07-01 |	7  |
| 2021-01-01 |	3  |
| 2021-02-03 |	19 |
| 2022-12-01 |	3  |
| 2022-12-15 |	3  |
| 2022-02-28 |	12 |

**Sample Output: **

| year |	no_of_new_cities |
| 2020 | 2 |
| 2021 | 1 |
| 2022 | 1 |
 

**Explanation: **
In 2020 there are 2 new cities, in 2021 only new city added was 19 and similarly in 2022 only new city added was 12 as city id 3 operations started in 2020 only.

**Solution:**
WITH first_appearance AS (
SELECT city_id, MIN(strftime("%Y", business_date)) AS first_year 
FROM business_operations 
GROUP BY city_id
)
SELECT  first_year AS year,  COUNT(city_id) AS no_of_new_cities
FROM  first_appearance
GROUP BY  first_year
ORDER BY  first_year

