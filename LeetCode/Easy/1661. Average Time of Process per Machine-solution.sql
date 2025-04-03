SELECT t1.machine_id, ROUND(AVG(t2.timestamp-t1.timestamp),3) AS processing_time
FROM
(SELECT machine_id,process_id,timestamp
FROM Activity a
WHERE activity_type="start"
GROUP BY process_id,machine_id) t1
INNER JOIN (SELECT machine_id,process_id,timestamp
FROM Activity a
WHERE activity_type="end"
GROUP BY process_id,machine_id) t2 on t1.machine_id=t2.machine_id
GROUP BY t1.machine_id