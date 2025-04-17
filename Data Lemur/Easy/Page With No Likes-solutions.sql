SELECT p.page_id FROM pages p
LEFT JOIN page_likes pl ON pl.page_id=p.page_id
WHERE pl.user_id IS NULL