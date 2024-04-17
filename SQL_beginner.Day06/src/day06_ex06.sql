CREATE SEQUENCE seq_person_discounts INCREMENT 1 START 1 OWNED BY person_discounts.id;
SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts) + 1);
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');

-- DROP SEQUENCE IF EXISTS seq_person_discounts;
