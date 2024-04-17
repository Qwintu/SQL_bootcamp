(SELECT pizzeria.name
FROM pizzeria
	FULL OUTER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
	FULL OUTER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey')
EXCEPT
(SELECT pizzeria.name
FROM menu
	FULL OUTER JOIN person_order ON menu.id = person_order.menu_id
	FULL OUTER JOIN person ON person_order.person_id = person.id
	FULL OUTER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey');
