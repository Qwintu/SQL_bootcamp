CREATE FUNCTION fnc_trg_person_audit()
RETURNS trigger AS $$
	DECLARE
	
	BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO person_audit VALUES (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
		RETURN OLD;
	END IF;
	IF (TG_OP = 'UPDATE') THEN
		INSERT INTO person_audit VALUES (current_timestamp, 'U', old.id, old.name, old.age, old.gender, old.address);
		RETURN NEW;
	END IF;
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO person_audit VALUES (current_timestamp, 'I', new.id, new.name, new.age, new.gender, new.address);
		RETURN NEW;
	END IF;
	
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
	AFTER INSERT OR UPDATE OR DELETE 
	ON person
	FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_audit();


TRUNCATE person_audit;

DROP FUNCTION fnc_trg_person_insert_audit CASCADE;
DROP FUNCTION fnc_trg_person_update_audit CASCADE;
DROP FUNCTION fnc_trg_person_delete_audit CASCADE;

DROP TRIGGER IF EXISTS trg_person_insert_audit ON person_audit;
DROP TRIGGER IF EXISTS trg_person_update_audit ON person_audit;
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person_audit;


INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;





