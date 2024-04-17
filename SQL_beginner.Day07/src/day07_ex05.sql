SELECT DISTINCT p.name 
FROM person_order as po
LEFT JOIN person as p ON po.person_id = p.id
ORDER by p.name
;