SELECT m.pizza_name, piz_name.name as pizzeria_name, m.price
FROM menu as m
LEFT JOIN
	(SELECT name, id FROM pizzeria) as piz_name
	ON m.pizzeria_id = piz_name.id
WHERE m.pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name
