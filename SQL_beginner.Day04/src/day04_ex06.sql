CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
	SELECT	pzr.name
	FROM person_visits as pv
	JOIN person as p 
		ON pv.person_id = p.id
	JOIN menu as m
		ON m.pizzeria_id = pv.pizzeria_id
	JOIN pizzeria as pzr
		ON pzr.id = pv.pizzeria_id
	WHERE p.name ='Dmitriy' and visit_date = '2022-01-08' and price < 800
);
