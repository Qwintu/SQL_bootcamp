SELECT COALESCE(person.name, '-') as person_name, pv.visit_date, COALESCE(pizzeria.name, '-') as pizzeria_name
from person
	FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' and '2022-01-03') AS pv
	on person.id = pv.person_id
	
	FULL OUTER JOIN pizzeria
	on pizzeria.id = pv.pizzeria_id
	
ORDER BY person_name, visit_date, pizzeria_name