WITH cte_dates 
AS (SELECT generate_series(timestamp '2022-01-01', '2022-01-10', '1 day')::date as missing_date)

SELECT missing_date
FROM cte_dates AS t
LEFT JOIN
(SELECT visit_date FROM person_visits WHERE person_id in (1, 2)) AS vd
    ON missing_date = vd.visit_date
WHERE visit_date is NULL
ORDER BY missing_date
;
