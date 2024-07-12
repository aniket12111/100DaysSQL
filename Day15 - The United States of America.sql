In some poorly designed UI applications, there's often a lack of data input restrictions. For instance, in a free text field for the country, users might input variations such as 'USA,' 'United States of America,' or 'US.'
Suppose we have survey data from individuals in the USA about their job satisfaction, rated on a scale of 1 to 5. Write a SQL query to count the number of respondents for each rating on the scale. Additionally, include the country name in the format that occurs most frequently in that scale.

**Table: survey (primary key : name)**

column name	datatype
name 	varchar(10)
job_satisfaction 	int
country 	varchar(20)
 
**Expected output:**

job_satisfaction	country	number_of_respondents
4	USA	3
5	United States	4

**Solution:**
with cte as (
    select job_satisfaction, country, count(1) as cnt from survey
    group by job_satisfaction, country
    order by job_satisfaction, cnt
), 

cte1 as (
    select *, sum(cnt)over(partition by job_satisfaction) as number_of_respondents
    , rank()over(partition by job_satisfaction order by cnt desc)as rnk
    --,max(cnt)over(partition by job_satisfaction) as max_cnt
    from cte
)

select job_satisfaction, country, number_of_respondents from cte1
where rnk=1 --or cnt=max_cnt

**Note: If we do not use order by inside windows function then it will not return running data.
"sum(cnt)over(partition by job_satisfaction) as number_of_respondents" try this with order by clause.
