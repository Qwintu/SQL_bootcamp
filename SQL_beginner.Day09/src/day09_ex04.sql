CREATE FUNCTION fnc_persons_male()
RETURNS SETOF person AS $$
		SELECT * FROM person WHERE person.gender = 'male';
$$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_female()
RETURNS SETOF person AS $$
		SELECT * FROM person WHERE person.gender = 'female';
$$ LANGUAGE sql;

SELECT * FROM fnc_persons_male();

SELECT * FROM fnc_persons_female();
