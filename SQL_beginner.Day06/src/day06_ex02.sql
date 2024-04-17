SELECT p.name, m.pizza_name, m.price, ROUND(m.price - (m.price / 100) * pd.discount, 2), pzr.name as pizzeria_name
FROM person_order as po
JOIN menu as m
	on m.id = po.menu_id
JOIN pizzeria as pzr
	on m.pizzeria_id = pzr.id
JOIN person_discounts as pd
	on pzr.id = pd.pizzeria_id
JOIN person as p
	on p.id = pd.person_id
WHERE pd.person_id = po.person_id
ORDER by p.name, m.pizza_name
;