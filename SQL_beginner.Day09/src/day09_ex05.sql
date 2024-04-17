CREATE FUNCTION fnc_persons(IN pgender text DEFAULT 'female') 
RETURNS SETOF person AS $$
	SELECT * FROM person WHERE person.gender = $1;
$$  LANGUAGE sql;


select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
