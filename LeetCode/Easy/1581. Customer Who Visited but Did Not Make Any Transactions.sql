SELECT v.customer_id,COUNT(v.customer_id) as count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON t.visit_id=v.visit_id
WHERE t.amount IS NULL AND t.transaction_id IS NULL
GROUP BY v.customer_id