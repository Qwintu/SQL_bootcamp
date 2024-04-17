SELECT	p.name as person_name1, p2.name as person_name2, p2.address as common_address
FROM person as p
JOIN person as p2
	ON p2.address = p.address
WHERE p.id > p2.id and NOT p.name = p2.name
ORDER BY  person_name1, person_name2, common_address