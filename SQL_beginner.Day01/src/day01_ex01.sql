(
SELECT name AS object_name
FROM person
ORDER by object_name
)
UNION ALL (
SELECT pizza_name AS object_name
FROM menu
ORDER by object_name
);