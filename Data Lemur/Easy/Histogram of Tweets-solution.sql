SELECT tweet_count AS tweet_bucket,
COUNT(user_id) AS users_num
FROM 
(

SELECT user_id, COUNT(tweet_id) AS tweet_count
FROM tweets
WHERE tweet_date BETWEEN '01/01/2022' AND '12/31/2022'
GROUP BY user_id

) t
GROUP BY tweet_count
