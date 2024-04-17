SELECT pizzeria.name
FROM pizzeria
WHERE pizzeria.id NOT IN (SELECT distinct pizzeria_id FROM person_visits);

SELECT pizzeria.name
FROM pizzeria
WHERE NOT EXISTS (SELECT distinct pizzeria_id FROM person_visits where pizzeria.id = person_visits.pizzeria_id);