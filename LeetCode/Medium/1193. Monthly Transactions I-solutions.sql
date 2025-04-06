SELECT DATE_FORMAT(t.trans_date, "%Y-%m") as month
,country
,IF(COUNT(t.id) IS NULL,0,COUNT(t.id)) as trans_count
,IF(COUNT(t1.id) IS NULL,0,COUNT(t1.id)) as approved_count
,IF(SUM(t.amount) IS NULL,0,SUM(t.amount)) as trans_total_amount
,IF(SUM(t1.amount) IS NULL,0,SUM(t1.amount)) as approved_total_amount
FROM Transactions t
LEFT JOIN (
    SELECT id
    ,amount
    FROM Transactions
    WHERE state="approved"  
) t1 ON t1.id=t.id
GROUP BY DATE_FORMAT(trans_date, "%Y-%m"),country