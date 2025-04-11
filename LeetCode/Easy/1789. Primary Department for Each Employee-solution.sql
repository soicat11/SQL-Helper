SELECT employee_id,department_id 
FROM (SELECT *
,COUNT(department_id) OVER (PARTITION BY employee_id) AS SingleDeptCounter
,IF(primary_flag='Y',department_id,NULL) AS PrimaryDeptCounter
FROM Employee
) e
WHERE SingleDeptCounter = 1 OR PrimaryDeptCounter IS NOT NULL