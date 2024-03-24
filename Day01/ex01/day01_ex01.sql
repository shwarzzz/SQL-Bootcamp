(SELECT p.name AS object_name FROM person p
ORDER BY p.name)
UNION ALL
(SELECT m.pizza_name AS object_name FROM menu m
ORDER BY object_name)