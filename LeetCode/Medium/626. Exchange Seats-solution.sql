SELECT id,
IF(mod(id,2)=0 #if even
,LAG(student) OVER (ORDER BY id) #previous row
,IF(id=(SELECT MAX(id) FROM Seat)
,student
,LEAD(student) OVER (ORDER BY id))) AS student
FROM Seat
ORDER BY id ASC