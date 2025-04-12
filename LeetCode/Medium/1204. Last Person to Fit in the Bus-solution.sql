SELECT t.person_name AS person_name
FROM(
    SELECT person_id
    ,person_name
    ,turn
    ,SUM(weight) OVER (ORDER BY turn) AS RunningSum
    FROM Queue 
    GROUP BY turn 
    #ORDER BY turn DESC
) t
WHERE t.RunningSum <=1000 
ORDER BY t.turn DESC
LIMIT 1