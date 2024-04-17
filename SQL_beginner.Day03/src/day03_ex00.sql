SELECT 
    m.pizza_name,
    m.price,
    pizzeria.name AS pizzeria_name,
    pv.visit_date
FROM person_visits as pv
LEFT JOIN pizzeria
	ON pv.pizzeria_id = pizzeria.id
LEFT JOIN menu as m
	ON m.pizzeria_id = pizzeria.id	
	
WHERE (SELECT id FROM person WHERE name = 'Kate') = pv.person_id and m.price BETWEEN 800 and 1000
ORDER BY pizza_name, price, name
;