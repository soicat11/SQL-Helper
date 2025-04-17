SELECT 
candidate_id
--SUM(IF(skill='Python' OR skill='Tableau' OR skill='PostgreSQL',1,0)) AS Counter
FROM candidates
GROUP BY candidate_id
HAVING SUM(IF(skill='Python' OR skill='Tableau' OR skill='PostgreSQL',1,0)) =3;