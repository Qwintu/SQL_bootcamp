CREATE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET enable_seqscan TO Off;

EXPLAIN ANALYZE
	SELECT *
	FROM menu
	WHERE pizzeria_id = 2

-- SET enable_seqscan TO On;


