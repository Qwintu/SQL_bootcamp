CREATE TABLE person_audit (
created timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- timestamp when a new event has been created.  Default value is a current timestamp and NOT NULL
type_event char(1) NOT NULL DEFAULT 'I',  -- possible values I (insert), D (delete), U (update). Default value is ‘I’. NOT NULL. Add check constraint ch_type_event with possible values ‘I’, ‘U’ and ‘D’
row_id bigint NOT NULL,   --  copy of person.id. NOT NULL
name varchar,  -- copy of person.name (no any constraints)
age integer,  -- copy of person.age (no any constraints)
gender varchar,  -- copy of person.gender (no any constraints)
address varchar  -- copy of person.address (no any constraints)
);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'));

CREATE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS $$
	DECLARE
	
	BEGIN
	
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO person_audit VALUES (current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
		RETURN NEW;
	END IF;
	
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
	AFTER INSERT
	ON person
	FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');

SELECT * FROM person_audit;