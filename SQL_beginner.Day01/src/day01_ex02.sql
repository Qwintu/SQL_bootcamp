SELECT pizza_name AS pizza_name
FROM menu
UNION
SELECT pizza_name AS pizza_name
FROM menu
ORDER by pizza_name desc;