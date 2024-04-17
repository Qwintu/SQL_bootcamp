SELECT menu_1.pizza_name,
	pzr_1.name AS pizzeria_name1,
	pzr_2.name AS pizzeria_name2,
	menu_1.price
FROM menu AS menu_1
	JOIN menu AS menu_2 ON menu_1.price = menu_2.price
	JOIN pizzeria AS pzr_1 ON pzr_1.id = menu_1.pizzeria_id
	JOIN pizzeria AS pzr_2 ON pzr_2.id = menu_2.pizzeria_id
WHERE menu_1.id > menu_2.id AND menu_1.pizza_name = menu_2.pizza_name
ORDER BY pizza_name;
