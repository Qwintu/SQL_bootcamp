
SELECT (SELECT person.name from person where person_id = person.id) AS person_name,
       (SELECT pizzeria.name from pizzeria where pizzeria_id = pizzeria.id) AS pizzeria_name
FROM (SELECT person_id, pizzeria_id
	  FROM person_visits 
	  WHERE visit_date between '2022-01-07' and '2022-01-09') AS pv
ORDER BY person_name ASC, pizzeria_name DESC;