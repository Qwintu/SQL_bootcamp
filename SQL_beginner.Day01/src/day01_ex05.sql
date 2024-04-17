SELECT person.id as person_id, person.name, person.age, person.gender, person.address, pizzeria.id, pizzeria.name, pizzeria.rating
FROM person
CROSS JOIN pizzeria
ORDER by person_id, id;