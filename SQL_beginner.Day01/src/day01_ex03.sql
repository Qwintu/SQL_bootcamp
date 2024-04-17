SELECT visit_date AS action_date, person_id
FROM person_visits
	  
INTERSECT

SELECT order_date AS action_date, person_id
FROM person_order

ORDER by action_date asc, person_id desc;