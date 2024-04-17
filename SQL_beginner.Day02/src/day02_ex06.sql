select pizza_name, pzr.name as pizzeria_name
FROM person_order as po
LEFT JOIN
	(SELECT * FROM person as p
	WHERE p.name = 'Anna' or p.name = 'Denis') as pn
	ON pn.id = po.person_id 
LEFT JOIN
	(SELECT * FROM menu) as piz_id
	ON piz_id.id = po.menu_id
	
LEFT JOIN
	(SELECT * FROM pizzeria) as pzr
	ON pzr.id = piz_id.pizzeria_id 
	
WHERE pn.name is NOT NULL
ORDER by pizza_name, pizzeria_name;