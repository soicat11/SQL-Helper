SELECT e.name from Employee e
LEFT JOIN (
    SELECT managerId,name
    FROM Employee 
    GROUP BY managerId
    HAVING COUNT(id) >=5 
) t1 ON t1.managerId=e.id
WHERE t1.managerId IS NOT NULL