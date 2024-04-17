SELECT	p.name
FROM person_order as po
JOIN person as p 
	ON po.person_id = p.id
JOIN menu as m
	ON m.id = po.menu_id
WHERE p.gender ='female' and (pizza_name = 'pepperoni pizza' or pizza_name = 'cheese pizza')
GROUP BY p.name
HAVING COUNT(*) = 2
ORDER BY name
;
