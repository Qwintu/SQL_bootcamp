SELECT	p.name
FROM person_order as po
JOIN person as p 
	ON po.person_id = p.id
JOIN menu as m
	ON m.id = po.menu_id
WHERE p.gender ='male' and (address = 'Moscow' or address = 'Samara') and (pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza')
ORDER BY name desc
;