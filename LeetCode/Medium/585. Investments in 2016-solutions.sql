WITH cte_concat AS (
    SELECT pid,COUNT(CompositeLatLon) FROM (
        SELECT pid,CONCAT(lat,lon) AS CompositeLatLon 
        FROM Insurance) table1
    GROUP BY CompositeLatLon
    HAVING COUNT(CompositeLatLon)=1
),
cte_unique_tiv_2015 AS (
    SELECT tiv_2015,COUNT(tiv_2015) AS unique_2015 FROM Insurance GROUP BY tiv_2015 HAVING COUNT(tiv_2015) > 1
)

SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016 FROM Insurance
WHERE (tiv_2015 IN (SELECT tiv_2015 FROM cte_unique_tiv_2015))
AND (pid IN (SELECT pid FROM cte_concat))
