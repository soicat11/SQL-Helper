WITH cte_overall AS 
(
    SELECT  
    id,
    SUM(count) AS num
    FROM (
        SELECT
        requester_id AS id,
        IF(COUNT(requester_id) IS NULL,0,COUNT(requester_id)) AS count
        FROM RequestAccepted
        GROUP BY requester_id
        
        UNION ALL

        SELECT
        accepter_id AS id,
        IF(COUNT(accepter_id) IS NULL,0,COUNT(accepter_id)) AS count
        FROM RequestAccepted
        GROUP BY accepter_id


        
    ) t
    GROUP BY id
)

SELECT * FROM cte_overall
ORDER BY num DESC 
LIMIT 1