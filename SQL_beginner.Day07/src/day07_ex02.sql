WITH tmp_lst as(
	(SELECT pzr.name, COUNT(pzr.name) as count, 'visit' as action_type
	FROM person_visits as pv
	LEFT JOIN pizzeria as pzr ON pv.pizzeria_id = pzr.id
	GROUP by pzr.name
	LIMIT 3)

	UNION

	(SELECT pzr.name, COUNT(pzr.name) as count, 'order' as action_type
	FROM person_order as po
	LEFT JOIN menu as m ON po.menu_id = m.id
	LEFT JOIN pizzeria as pzr ON m.pizzeria_id = pzr.id
	GROUP by pzr.name
	LIMIT 3)
)
SELECT * FROM tmp_lst
ORDER by action_type, count desc
;