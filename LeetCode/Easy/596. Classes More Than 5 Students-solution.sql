SELECT 
class
#,COUNT(student)
FROM Courses
GROUP BY class
HAVING COUNT(student) >=5