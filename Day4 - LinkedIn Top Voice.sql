LinkedIn is a professional social networking app. They want to give top voice badge to their best creators to encourage them to create more quality content. A creator qualifies for the badge if he/she satisfies following criteria. 

1- Creator should have more then 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.

Write a SQL to get the list of top voice creators name along with no of posts and impressions by them in the month of Dec-2023.

**Table: creators(primary key : creator_id)**

| column name |	data type |
| ----------- | --------- |
| creator_id |	int |
| creator_name |	varchar(20) |
| followers |	int |
 

**Table: posts(primary key : post_id)**

| column name |	data type |
| ----------- | --------- |
| creator_id |	int |
| post_id |	varchar(3) |
| publish_date |	date |
| impressions |	int |
 

**Example output:**

| creator_name | no_of_posts | total_impressions |
| ------------ | ----------- | ----------------- |
| Ankit Bansal	| 3	| 132000 |

**Solution:**
select creator_name, count(post_id) as no_of_posts, sum(impressions) as total_impressions  from creators as c inner join posts as p
on c.creator_id = p.creator_id
where c.followers > 50000
and strftime("%Y%m", p.publish_date) == '202312'
group by creator_name
having no_of_posts >= 3 and total_impressions > 100000


 
