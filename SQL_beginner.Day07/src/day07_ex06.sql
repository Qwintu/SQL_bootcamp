SELECT 
	pzr.name, 
	COUNT(pzr.name) as count_of_orders, 
	ROUND(AVG(m.price), 2) as average_price,
	MAX(m.price) as max_price,
	MIN(m.price) as min_price
FROM person_order as po
LEFT JOIN menu as m ON po.menu_id = m.id
LEFT JOIN pizzeria as pzr ON m.pizzeria_id = pzr.id
GROUP by pzr.name
ORDER by pzr.name
;