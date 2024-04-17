CREATE VIEW v_generated_dates 
AS (
	SELECT days::date AS generate_date FROM generate_series(timestamp '2022-01-01', '2022-01-31', '1 day') as days
	ORDER BY generate_date
	)
;
