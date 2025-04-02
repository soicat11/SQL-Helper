SELECT 
product_id
,IF(ROUND(SUM(productsM)/SUM(units),2) IS NULL,0,ROUND(SUM(productsM)/SUM(units),2)) AS average_price
FROM (
    SELECT p.product_id
    ,p.price
    ,u.units
    ,IF(p.price*u.units IS NOT NULL AND u.purchase_date BETWEEN p.start_date AND p.end_date,p.price*u.units,0) AS productsM
    FROM  Prices p
    LEFT JOIN UnitsSold u ON p.product_id=u.product_id AND (u.purchase_date BETWEEN p.start_date AND p.end_date OR u.purchase_date IS NULL)
) s
GROUP BY product_id