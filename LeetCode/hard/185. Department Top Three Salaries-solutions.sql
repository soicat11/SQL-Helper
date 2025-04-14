SELECT d.name AS Department
,e.name AS Employee
,salary AS salary
FROM Department d
LEFT JOIN
(
    SELECT *,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as RankId
    FROM Employee e
) e ON e.departmentId=d.id
WHERE e.RankId <=3
ORDER BY e.salary DESC