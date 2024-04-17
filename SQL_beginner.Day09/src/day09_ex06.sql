CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson text DEFAULT 'Dmitriy', IN pprice int DEFAULT 500, IN pdate date DEFAULT '2022-01-01') 
RETURNS TABLE (name varchar) 
AS $$
BEGIN
    RETURN QUERY
	SELECT	pzr.name	
	FROM person_visits as pv
	JOIN person as p 
		ON pv.person_id = p.id
	JOIN menu as m
		ON m.pizzeria_id = pv.pizzeria_id
	JOIN pizzeria as pzr
		ON pzr.id = pv.pizzeria_id		
	WHERE p.name =pperson and visit_date = pdate and price < pprice;
END;
$$  LANGUAGE plpgsql;




select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
