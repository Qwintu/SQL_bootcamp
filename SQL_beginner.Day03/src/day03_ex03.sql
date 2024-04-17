WITH tmp_tbl_f
AS (
	SELECT pizzeria.name as pizzeria_name
	FROM person_visits as pv
	JOIN pizzeria
		ON pv.pizzeria_id = pizzeria.id
	WHERE (SELECT gender FROM person WHERE pv.person_id = id) = 'female'
),
tmp_tbl_m
AS (
	SELECT pizzeria.name as pizzeria_name
	FROM person_visits as pv
	JOIN pizzeria
		ON pv.pizzeria_id = pizzeria.id
	WHERE (SELECT gender FROM person WHERE pv.person_id = id) = 'male'
)

((SELECT pizzeria_name from tmp_tbl_f)
EXCEPT ALL
(SELECT pizzeria_name from tmp_tbl_m))

UNION all

((SELECT pizzeria_name from tmp_tbl_m)
EXCEPT ALL
(SELECT pizzeria_name from tmp_tbl_f))

ORDER BY pizzeria_name;