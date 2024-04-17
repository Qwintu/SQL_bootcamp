create table person_discounts (
id bigserial,
discount NUMERIC CHECK (discount >= 0),
person_id bigint,
pizzeria_id bigint,
PRIMARY KEY (id),
constraint fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
constraint fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
);
