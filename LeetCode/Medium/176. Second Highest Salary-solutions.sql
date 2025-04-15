SELECT MAX(SecondHighestSalary) AS SecondHighestSalary FROM (
SELECT 
IF(RankID <> 2,NULL,IF(RankID=2,Salary,NULL)) AS SecondHighestSalary 
FROM (
    SELECT *,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS RankID 
    FROM Employee
) t
)t2
