SELECT w1.id FROM Weather w1
INNER JOIN (
    SELECT id, 
    #recordDate,
    #temperature,
    #LEAD(temperature) OVER (ORDER BY id) as LeadTemp,
    #DATEDIFF(recordDate,LAG(recordDate) OVER (ORDER BY recordDate)) as datediff,
    IF(
        DATEDIFF(recordDate,LAG(recordDate) OVER (ORDER BY recordDate))>1,
        '',       
        LAG(temperature) OVER (ORDER BY recordDate)-temperature) as TempDiff
    FROM Weather
) w2 ON w1.id=w2.id
WHERE w2.TempDiff < 0