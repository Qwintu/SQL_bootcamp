SELECT visit_date AS action_date, 
	(SELECT name FROM person WHERE person_visits.person_id = person.id) as person_name
FROM person_visits
	  
INTERSECT

SELECT order_date AS action_date, 
	(SELECT name FROM person WHERE person_order.person_id = person.id) as person_name
FROM person_order

ORDER by action_date asc, person_name desc;
