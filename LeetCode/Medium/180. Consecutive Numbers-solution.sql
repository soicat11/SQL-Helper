SELECT DISTINCT(ConsecutiveNums) FROM (
SELECT 
IF(num = LEAD(num) OVER (ORDER BY id) AND num = LEAD(num,2) OVER (ORDER BY id),num,NULL) AS ConsecutiveNums
FROM Logs
) t WHERE ConsecutiveNums IS NOT NULL