SELECT 
c.visited_on
,amount
,average_amount
FROM (
    SELECT 
    c1.visited_on,
    SUM(DateAmount) OVER (ORDER BY c1.visited_on ROWS BETWEEN 6 PRECEDING  AND CURRENT ROW) AS amount
    ,ROUND(AVG(DateAmount) OVER (ORDER BY c1.visited_on ROWS BETWEEN 6 PRECEDING  AND CURRENT ROW),2) AS average_amount 
    ,LAG(visited_on,6) OVER (ORDER BY visited_on) AS 7DaysBefore
    FROM (
        SELECT c0.visited_on,
        SUM(c0.amount) AS DateAmount
        #,ROUND(AVG(c0.amount) OVER (ORDER BY c0.visited_on ROWS BETWEEN 6 PRECEDING  AND CURRENT ROW),2) AS average_amount 
        #,LAG(visited_on,6) OVER (ORDER BY visited_on) AS 7DaysBefore
        FROM customer c0
        GROUP BY c0.visited_on
     ) c1
    GROUP BY c1.visited_on
) c
WHERE 7DaysBefore IS NOT NULL
