INSERT INTO person_discounts(id, discount, person_id, pizzeria_id)
SELECT
	ROW_NUMBER( ) OVER (ORDER BY person_id) AS id,
	(CASE 
	 	WHEN COUNT(po.person_id) = 1 
	 	THEN 10.50
		WHEN COUNT(po.person_id) = 2 
	 	THEN 22
		ELSE 30
	END) as discount,
	(person_id),
	(pizzeria_id)
FROM person_order as po
LEFT JOIN menu as m
	on po.menu_id = m.id
LEFT JOIN pizzeria as pzr
	on m.pizzeria_id = pzr.id
	GROUP BY po.person_id, m.pizzeria_id
;