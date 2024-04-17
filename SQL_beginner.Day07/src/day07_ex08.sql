SELECT p.address, pzr.name, COUNT(po.id) as count_of_orders
FROM person as p
LEFT JOIN person_order as po ON po.person_id = p.id
LEFT JOIN menu as m ON po.menu_id = m.id
LEFT JOIN pizzeria as pzr ON m.pizzeria_id = pzr.id
GROUP by pzr.name, p.address
ORDER by p.address, pzr.name
;