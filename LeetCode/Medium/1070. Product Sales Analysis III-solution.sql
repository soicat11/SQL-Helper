SELECT 
s1.product_id
,year AS first_year
,quantity
,price
FROM Sales s1
LEFT JOIN (
    SELECT product_id
    ,MIN(year) as miniYear
    FROM Sales 
    GROUP BY product_id
    ) s2 ON s2.product_id=s1.product_id
WHERE s1.year=miniYear