WITH tmp_tbl_f
AS (SELECT pizzeria.name AS pizzeria_name
	FROM menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
	WHERE person.gender = 'female'
),
tmp_tbl_m
AS (SELECT pizzeria.name AS pizzeria_name
	FROM menu
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person on person_order.person_id = person.id
	WHERE person.gender = 'male'
)

(SELECT pizzeria_name from tmp_tbl_f
EXCEPT
SELECT pizzeria_name from tmp_tbl_m)

UNION

(SELECT pizzeria_name from tmp_tbl_m
EXCEPT
SELECT pizzeria_name from tmp_tbl_f)

ORDER BY pizzeria_name;