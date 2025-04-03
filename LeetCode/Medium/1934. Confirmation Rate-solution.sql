SELECT s.user_id
#,ConfirmationCounter
#,ActionCounter
,IF(ConfirmationCounter IS NULL OR ActionCounter IS NULL,0.00,ROUND(ConfirmationCounter/ActionCounter,2)) AS confirmation_rate
FROM Signups s
LEFT JOIN (
    SELECT user_id,COUNT(user_id) as ConfirmationCounter
    FROM Confirmations
    WHERE action="confirmed"
    GROUP BY user_id
) t1 ON t1.user_id=s.user_id
LEFT JOIN(SELECT user_id,COUNT(user_id) AS ActionCounter
FROM Confirmations 
GROUP BY user_id
) t2 ON t2.user_id=s.user_id 
