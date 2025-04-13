SELECT employee_id FROM Employees
WHERE manager_id NOT IN (SELECT employee_id FROM Employees) AND salary < 30000
GROUP BY employee_id
ORDER BY employee_id
