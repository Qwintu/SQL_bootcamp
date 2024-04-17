SELECT person.name person_name, menu.pizza_name pizza_name, pizzeria.name pizzeria_name
FROM pizzeria, person, menu;

SELECT p.name person_name,
       m.pizza_name pizza_name,
	   pz.name pizzeria_name
  FROM person_order po
  
  JOIN menu m
    ON po.menu_id = m.id
  
  JOIN pizzeria pz
    ON m.pizzeria_id = pz.id
	
  JOIN person p
    ON po.person_id = p.id

ORDER by person_name asc, pizza_name asc, pizzeria_name asc;