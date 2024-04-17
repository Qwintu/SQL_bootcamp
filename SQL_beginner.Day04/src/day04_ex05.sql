CREATE VIEW v_price_with_discount AS (
	SELECT p.name as name, pizza_name, price, ROUND(price * 0.9) as discount_price
	FROM person_order as po
	LEFT JOIN person as p
		ON po.person_id = p.id
	LEFT JOIN menu as m
		ON po.menu_id = m.id
	ORDER BY name, pizza_name 
);		
		