SELECT person_id, COUNT(person_id) as count_of_visits
FROM person_visits
GROUP by person_id
ORDER by count_of_visits desc, person_id
;