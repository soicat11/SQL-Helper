SELECT 
#SUM((IF(First_Order_date=d1.customer_pref_delivery_date,1,0))) AS immediate,
#COUNT(d2.customer_id) AS Counter
ROUND(AVG(IF(First_Order_date=d1.customer_pref_delivery_date,1,0))*100,2) AS immediate_percentage
FROM Delivery d1
LEFT JOIN (
    SELECT customer_id
    ,MIN(order_date) as First_Order_date
    FROM Delivery GROUP BY customer_id
) d2 ON d1.customer_id=d2.customer_id
WHERE d1.order_date=First_Order_date

