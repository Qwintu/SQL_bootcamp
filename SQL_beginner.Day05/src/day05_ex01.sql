SET enable_seqscan TO Off;
EXPLAIN ANALYZE
SELECT m.pizza_name, p.name as pizzeria_name
FROM menu AS m
 JOIN pizzeria AS p
ON m.pizzeria_id = p.id
;
-- SET enable_seqscan TO On;