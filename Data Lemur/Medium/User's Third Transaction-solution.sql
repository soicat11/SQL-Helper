SELECT user_id, spend, transaction_date FROM (
SELECT *,
DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date) AS RankID
FROM transactions
) t 
WHERE RankID = 3;