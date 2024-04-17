CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan TO Off;

EXPLAIN ANALYZE

SELECT person.name
FROM person
WHERE UPPER(person.name) = 'KATE';

-- SET enable_seqscan TO On;