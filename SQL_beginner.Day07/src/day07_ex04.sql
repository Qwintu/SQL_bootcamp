SELECT p.name, COUNT(p.name) as count_of_visits
FROM person_visits as pv
LEFT JOIN person as p ON pv.person_id = p.id
GROUP by p.name
HAVING COUNT(p.name) > 3
ORDER by p.name
;